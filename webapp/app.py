

from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from forms import StudentForm


if __name__ == "__main__":

    app = Flask(__name__)

    app.config['MYSQL_HOST'] = '127.0.0.1'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = ''
    app.config['MYSQL_DB'] = 'elidek'
    # secret key for sessions (signed cookies). Flask uses it to protect the contents of the user session against tampering.
    app.config["SECRET_KEY"] = 'aa'
    # token for csrf protection of forms.
    app.config["WTF_CSRF_SECRET_KEY"] = 'bb'

    mysql = MySQL(app)

    @app.route('/')
    def george():
        cursor = mysql.connection.cursor()

        cursor.execute('''select * from projects_for_each_researcher''')
        view1 = cursor.fetchall()

        cursor.execute('''select * from total_amount_for_each_field''')
        view2 = cursor.fetchall()

        cursor.execute('''select 		temp1.`Organization_Organization Name`
        from 	(	select count(`ID Project`) as counter,`Organization_Organization Name`,year(`Start Date`) as yr
			from project
			group by `Organization_Organization Name`,year(`Start Date`) ) as temp1,
		        (	select count(`ID Project`) as counter,`Organization_Organization Name`,year(`Start Date`) as yr
			        from project
			group by `Organization_Organization Name`,year(`Start Date`) ) as temp2
            where temp1.`Organization_Organization Name` = temp2.`Organization_Organization Name` and temp1.counter = temp2.counter and temp1.counter>=10 and ( (temp1.yr - temp2.yr) = 1 )
            group by `Organization_Organization Name`;''')
        organisations = cursor.fetchall()

        cursor.execute('''SELECT `Researcher_ID Researcher`, COUNT(`Project_ID Project`) AS `value_occurrence` FROM project_has_researcher, researcher WHERE DoB > CURRENT_DATE - INTERVAL 40 YEAR and `ID Researcher` = `Researcher_ID Researcher` GROUP BY  `Researcher_ID Researcher` ORDER BY  `value_occurrence` DESC LIMIT 5;''')
        researchers = cursor.fetchall()

        cursor.execute('''select `Full Name`,`Stem_ID Stem`,Amount,`Organization_Organization Name`
        from     project, company, stem
        where `Organization_Organization Name` = `Organization Name` and `ID Stem` = `Stem_ID Stem`
        order by Amount desc
        limit 5;''')
        stems = cursor.fetchall()

        cursor.execute('''select `Full Name`, count(`Researcher_ID Researcher`) 
        from project_has_researcher, researcher
        where `Project_ID Project` not in(select `Project_ID Project` from deliveries) and `Researcher_ID Researcher` = `ID Researcher` 
        group by `Researcher_ID Researcher`
        having count(`Researcher_ID Researcher`)>=5''')
        fivepro = cursor.fetchall()

        cursor.execute('''SELECT a1,b1,times_played,amount

        FROM (
	        SELECT
		        a.`Project_ID Project`,
		        a.`Scientific Field_Scientific Name` AS a1,
		        b.`Scientific Field_Scientific Name` AS b1,
		        COUNT(*) AS times_played,
		        RANK() OVER (ORDER BY COUNT(*) DESC) Rnk
	        FROM `project_has_scientific field` a
	        JOIN `project_has_scientific field` b
	        ON a.`Scientific Field_Scientific Name` < b.`Scientific Field_Scientific Name` AND a.`Scientific Field_Scientific Name` != b.`Scientific Field_Scientific Name`
	        GROUP by 1,2
        ) sub , project
        WHERE `ID Project` = `Project_ID Project`
        LIMIT 3
        ; ''')
        pairs = cursor.fetchall()
        return render_template('land.html', researchers=researchers, stems=stems, fivepro=fivepro, pairs=pairs, organisations=organisations, view1=view1, view2=view2)

    # "GET" by default

    @app.route('/researcher', methods=["GET", "POST"])
    def createStudent():
       # """
        # Create new student in the database
        # """
        form = StudentForm()
        # when the form is submitted
        if(request.method == "POST" and form.validate_on_submit()):
            newStudent = form.__dict__
            query = "INSERT INTO researcher(`Full Name`, DoB, Gender, `Organization Name`) VALUES ('{}', '{}', '{}','{}');".format(
                newStudent['name'].data, newStudent['dob'].data, newStudent['gender'].data, newStudent['org'].data)
            try:
                cur = mysql.connection.cursor()
                cur.execute(query)
                mysql.connection.commit()
                cur.close()
                flash("Student inserted successfully", "success")
                return redirect(url_for("george"))
            except Exception as e:  # OperationalError
                flash(str(e), "danger")

        # else, response for GET request
        return render_template("create_student.html", pageTitle="Create Researcher", form=form)

    app.run(debug=True, host='localhost')
