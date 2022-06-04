
from flask import Flask,render_template, request
from flask_mysqldb import MySQL



if __name__ == "__main__":

    app = Flask(__name__)

    app.config['MYSQL_HOST'] = '127.0.0.1'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = ''
    app.config['MYSQL_DB'] = 'elidek'

    mysql = MySQL(app)



    @app.route('/')
    def george():
        cursor = mysql.connection.cursor()
        cursor.execute('''SELECT * FROM elidek.researcher''')
        researchers = cursor.fetchall()
        return render_template('index.html', researchers = researchers)

    app.run(debug = True ,host='localhost')
