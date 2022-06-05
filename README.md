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


# What does Flask do

Flask is a micro web framework used to create web applications. It uses Jinja as its templating engine, to generate static template files at runtime, and Werkzeug as its WSGI toolkit, to facilitate the communication between web server and application. When writing an app locally, Flask will launch a simple "development" server on which to run it.



# How to Execute SQL Queries with Python and Flask

In order to send queries to a database from a Python program, a connection between it and the databases' server must be established first. That is accomplished by a cursor object from the Flask-MySQLdb library, and using the appropriate methods (execute, commit).


# Project Structure

Generally, Flask allows some freedom of choice regarding the layout of the application's components. This demo follows the structure recommended by the official documentation, whereby a package, arbitrarily named "dbdemo", contains the application's code and files, separated into folders for each category (models, controllers, HTML templates - views, static files such as css or images).
