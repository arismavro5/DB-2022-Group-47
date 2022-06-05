from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired, Email

# when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
# with the additional restrictions specified for each field


class StudentForm(FlaskForm):
    name = StringField(label="Full Name", validators=[
                       DataRequired(message="Name is a required field.")])

    dob = StringField(label="Date of Birth", validators=[
        DataRequired(message="Date of Birth is a required field.")])

    gender = StringField(label="Gender", validators=[DataRequired(
        message="Gender is a required field.")])

    org = StringField(label="Organization Name", validators=[DataRequired(
        message="Organization Name is a required field.")])

    submit = SubmitField("Create")
