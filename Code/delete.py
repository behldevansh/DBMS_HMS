import tkinter as tk
from tkinter import messagebox
import button as bP
import connection as H 
import resources as r

def open_delete_window(table_name):
    root2 = tk.Tk()
    root2.update_idletasks()  # Ensure all widgets are updated

    

    # Get screen width and height
    screen_width = root2.winfo_screenwidth()
    screen_height = root2.winfo_screenheight()

    # Set window size to screen width and height
    root2.geometry(f"{screen_width}x{screen_height}")
    root2.title("Hospital Management - Delete Data")



    
        
    tk.Label(root2, text=f"Enter Primary attribute:").grid(row=0, column=0, padx=10, pady=5)
    entry = tk.Entry(root2)
    entry.grid(row=0, column=1, padx=10, pady=5)
    



   


    add_button = tk.Button(root2, text="Delete Data", command=lambda: [add_to_database(entry.get(), table_name, root2)])
    add_button.grid(row=13, column=0, columnspan=2, padx=10, pady=10)

        
    
    # return_button = tk.Button(root2, text="Return to Main", command=lambda:[root2.destroy(),bP.buttonPage()])
    # return_button.grid(row=13, column=2, padx=10, pady=5)

    root2.mainloop()


def add_to_database(primary_key, table_name, root):

# Code for database operations/
    Pkey = r.columnName[table_name][0]
    query = f"DELETE FROM {table_name} where {Pkey} = {primary_key};"
    print(query)
    try:
        H.cur.execute(query)
        H.con.commit()
        messagebox.showinfo("Success", "Data deleted from the database.")
        
    except:
        messagebox.showinfo("Failure","Primary key does not exist")
        
    root.destroy()

    

# open_delete_window("Patient")