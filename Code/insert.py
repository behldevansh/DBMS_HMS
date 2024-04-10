import tkinter as tk
from tkinter import messagebox
import button as bP
import connection as H 
import resources as r

def open_insert_window(table_name):
    root2 = tk.Tk()
    root2.update_idletasks()  # Ensure all widgets are updated

    

    # Get screen width and height
    screen_width = root2.winfo_screenwidth()
    screen_height = root2.winfo_screenheight()

    # Set window size to screen width and height
    root2.geometry(f"{screen_width}x{screen_height}")
    root2.title("Hospital Management - Insert Data")
    
    columns = r.columnName[table_name]

    entries = []

    for i in range(len(columns)):
        col = columns[i]
        tk.Label(root2, text=f"{col}:").grid(row=i, column=0, padx=10, pady=5)
        entry = tk.Entry(root2)
        entry.grid(row=i, column=1, padx=10, pady=5)
        entries.append(entry)



   


    add_button = tk.Button(root2, text="Add Data", command=lambda: add_to_database(entries, table_name, root2))
    add_button.grid(row=13, column=0, columnspan=2, padx=10, pady=10)

    # return_button = tk.Button(root2, text="Return to Main", command=lambda:[root2.destroy(),bP.buttonPage()])
    # return_button.grid(row=13, column=2, padx=10, pady=5)

    root2.mainloop()


def add_to_database(entries, table_name, root):

# Code for database operations/
    query = f"Insert into  {table_name}  values("
    for i in entries:
        val = i.get()
        if (val.isdigit()):
            query = query + val + ','
        else:
            query = query + f"'{val}'" + ','
    query = query[:-1] + ');'
    print(query)
    # query = query + entries[0].get() + ',' + f"'{entries[1].get()}'" + ')'
    # query="Insert into patient(patient_id,f_name,l_name,age,gender,phone_number,house_no,street_name,city,state,pincode,doctor_id,roomnumber) values({},'{}','{}',{},'{}','{}',{},'{}','{}','{}',{},{},{})".format(patient_id,f_name,l_name,age,gender,phone_number,house_no,street_name,city,state,pincode,doctor_id,roomnumber)
    try:
        H.cur.execute(query)
        H.con.commit()
        messagebox.showinfo("Success", "Data inserted to the database.")
    except:
        messagebox.showinfo("Failure","Could not enter data please try again with correct primary.")
    root.destroy()
    

# open_insert_window("Doctor")