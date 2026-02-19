#import flask and its components
from flask import *
#import the pymsql module -it helps us to create a connection btw python flask and mysql database
import pymysql

#Create a flask application and give it a name
app=Flask(__name__)

#Below is sign up route
@app.route("/api/signup",methods=["POST"])
# @app.route("/signup", methods=["POST"])
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

#Below is login /sign in route
@app.route("/api/signin", methods=["post"])
def signin():
    if request.method=="POST":
        # return jsonify({"message": "signin route accessed"})
    #extract the two details entered on the form
     email=request.form["email"]
     password=request.form["password"]
    # print out the details
    # print(email,password)
    # create/establish a connection to the database
    connection=pymysql.connect(host="localhost",user="root",password="",database="test" )
    #create a cursor
    cursor=connection.cursor(pymysql.cursors.DictCursor)
    #structure the sql query will check whether the email and the password entered are correct
    sql="SELECT * FROM users WHERE email = %s AND password = %s"
    #put the data received from the form into tuple
    data=(email,password)
    #by use of the cursor execute the sql
    cursor.execute(sql,data)
    #if 
    count=cursor.rowcount
    # print (count)
    if count==0:
        return jsonify({"message":"login failed"})
    else:
    #there must be a user so we create a variable that will hold the detail of the user fetches from the database
        user=cursor.fetchone()
    #Return the detail to the frontend as well as a message
        return jsonify({"message":"user logged in Successfully","user":user})


#run the application
app.run(debug=True)