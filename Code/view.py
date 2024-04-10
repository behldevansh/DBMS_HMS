import tkinter as tk
from tkinter import ttk
import connection as connect

def display_database(tree, table_name):
    # Replace this section with code to fetch and display the database content
    # Simulated database content
    connect.cur.execute(f"Select * from {table_name}")
    database_content =connect.cur.fetchall()


    tree.delete(*tree.get_children())  # Clear previous data
    for row in database_content:
        tree.insert("", "end", values=row)

def view_database(selected_table):
    root = tk.Tk()
    root.title("Hospital Database Viewer")
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Set window size to screen width and height
    root.geometry(f"{screen_width}x{screen_height}")


    columnName = {"Patient": ("patient_id","f_name","l_name","age","gender","phone_number","house_no","street_name","city","state","pincode","doctor_id","roomnumber"),
              "Staff":  ("staff_id","f_name","l_name","gender","phone_number","house_no","street_name","city","state","pincode","joining_date","salary", "shift_id"),
              "Department":("department_id", "department_name"),
              "Doctor" : ("doctor_id", "speciality", "department_id", "staff_id"),
              "Shift" : ("shift_id", "start_time", "end_time"),
              "Nurse" : ("staff_id", "roomnumber"),
              "Room" : ("roomnumber", "roomtype"),
              "Driver" : ("driver_id", "staff_id", "license_number", "ambulancenumber"),
              "Ambulance" : ("ambulancenumber", "registrationnumber"),
              "Records" : ("record_id","date_admitted","date_discharged","diagnosis","patient_id"),
              "Bill" : ("bill_number", "doc_charges", "lab_charges", "room_charges", "total_amount", "billing_date", "patient_id")
            }
    
    columns = columnName[selected_table]

    tree = ttk.Treeview(root, columns=columns, show="headings")

    # Set column headings
    for i in range(len(columns)):
        tree.heading(columns[i], text=columns[i])
        tree.column(columns[i], anchor="center",width="118")
        tree.grid(row=0, column=i, padx=1, pady=1)
    display_database(tree, selected_table)
    # display_button = tk.Button(root, text="Display Database", command=display_database)
    # display_button.pack(pady=10)

    root.mainloop()
# view_database()


