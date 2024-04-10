import mysql.connector as c

con=c.connect(host="localhost",user="root",password="Behl@2004",database="test")

cur=con.cursor()


if con.is_connected():
    print("Connected to MySQL database")

else:
    print("Failed to connect to MySQL database")