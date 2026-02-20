#import flask and its components
from flask import *
import os
#import the pymsql module -it helps us to create a connection btw python flask and mysql database
import pymysql

#Create a flask application and give it a name
app=Flask(__name__)

# config the location where your product images will be saved on your application
app.config["UPLOAD_FOLDER"]="static/images"

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
    
    # Below is a route for adding  products
@app.route("/api/add_product",methods=["POST"])
def addproduct():
    if request.method=="POST":
       
        #extract the data entered on the form
        product_name=request.form["product_name"]
        product_description=request.form["product_description"]
        product_cost=request.form["product_cost"]
        product_photo=request.files["product_photo"]
        #For the product phot, we shall fetch it from file as shown below

        #Extract the file name of the photo
        filename=product_photo.filename
        #print("the filename is:" filename)
        # by use of the os module (operating system) we can extract the file path where the images is currently saved
        photo_path = os.path.join(app.config["UPLOAD_FOLDER"], filename)
        # print("This is the photo path: ", photo_path)
        # save the product photo image into the new location
        product_photo.save(photo_path)

        #print them out to test whether you are receiving the detail sent with the request
        #print(product_name,product_description,product_cost,product_photo)
        connection=pymysql.connect(host="localhost",user="root",password="",database="test")
        
        # create a cursor
        cursor=connection.cursor()
        #Structure the sql querry
        sql="INSERT INTO product_detail(product_name, product_description, product_cost, product_photo) VALUES (%s, %s, %s, %s)"
        # Create a tuple that will hold data from the which are currently held onto the different variable declared
        # change product-photo to filename
        data=(product_name,product_description,product_cost,filename)
        # use the cursor to execute the sql as you replace the placeholders with the actual data
        cursor.execute(sql,data)
        #commit the changes to the database
        connection.commit()


        return jsonify({"message":"product added successfully"})





#run the application
app.run(debug=True)