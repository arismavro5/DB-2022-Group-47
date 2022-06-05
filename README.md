# DB-2022-Project-Group 47

Members:  

    - Alexandros Papanastasiou    el17647
    - Giorgos Kotsompolis         ge17013
    - Aris Mavrotas               el18640


# Dependecies 

- MySQL for Windows
- Python, with the additional libraries
    - Flask
    - Flask-MySQLdb
    - faker (dummy data)

The necessary packages for this app are listed in "requirements.txt".


# What does Flask do

Flask is a micro web framework used to create web applications. It uses Jinja as its templating engine, to generate static template files at runtime, and Werkzeug as its WSGI toolkit, to facilitate the communication between web server and application. When writing an app locally, Flask will launch a simple "development" server on which to run it.



# How to Execute SQL Queries with Python and Flask

In order to send queries to a database from a Python program, a connection between it and the databases' server must be established first. That is accomplished by a cursor object from the Flask-MySQLdb library, and using the appropriate methods (execute, commit).


# Project Structure

We have divided the project into seperate folders. The folder "sql-queries" contains the solutions to the problems 3.2-3.8, as well as two views of the relational model. "Insertions" contains all the dummy-data used and transfered in our database.
