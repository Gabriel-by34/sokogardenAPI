#import flask and its components
from flask import *
#import the pymsql module -it helps us to create a connection btw python flask and mysql database
import pymysql

#Create a flask application and give it a name
app=Flask(__name__)

#Below is sign up route
@app.route("/api/signup",methods=["POST"])
@app.route("/signup", methods=["POST"])
def signup():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = request.form["password"]
        phone = request.form["phone"]

        # print(username, email, password, phone)
        #Establish a connection between flask/python
        # The following parameter should be specified when creating a connection with the database
        #1.Host=>Localhost
        #2.user=>root
        #3.Password=>""
        #4.Database name=>test
        connection=pymysql.connect(host="localhost",user="root",password="",database="test")
        #Create a cursor to execute the sql queries
        cursor=connection.cursor()
        #structure an sql to insert the detail received from the form
        #The %S is placeholder= a place holder it stands in places of the actual values
        sql="INSERT INTO users(username,email,phone,password) VALUES(%s,%s,%s,%s)"
        #create a tuple that will hold all the data gotten from the form
        data=(username, email, phone, password)
        #by use of the cursor , execute the sql as you replace the placeholder with actual values
        cursor.execute(sql,data)
        #commit the changes to the database
        connection.commit()

        return jsonify({"message": "User registered successfully"})



#run the application
app.run(debug=True)