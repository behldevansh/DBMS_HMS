import tkinter as tk
from tkinter import messagebox
import button as bP
import connection as connect
import login


def validate_login(root, username_entry, password_entry):
    username = username_entry.get()
    password = password_entry.get()

    query = f"Insert into register values('{username}', '{password}')"
    try:
        connect.cur.execute(query)
        connect.con.commit()
    except:
        messagebox.showinfo("Failure", "Username already exist")
        username_entry.delete(0, 'end')
        password_entry.delete(0, 'end')
        return

    messagebox.showinfo("Success", "User registered. Please Login to continue")
    root.destroy()
    login.login()
        
    
    

def register():
    root = tk.Tk()
    root.title("Hospital Management - Register")
    # Adjust the padding and alignments for better visual appearance
    username_label = tk.Label(root, text="Username:")
    username_label.grid(row=0, column=0, padx=10, pady=5)
    username_entry = tk.Entry(root)
    username_entry.grid(row=0, column=1, padx=10, pady=5)

    password_label = tk.Label(root, text="Password:")
    password_label.grid(row=1, column=0, padx=10, pady=5)
    password_entry = tk.Entry(root, show="*")
    password_entry.grid(row=1, column=1, padx=10, pady=5)

    login_button = tk.Button(root, text="Register", command=lambda:[validate_login(root, username_entry, password_entry)])
    login_button.grid(row=2, column=0, columnspan=2, padx=10, pady=10)



    # root_width = root.winfo_screenwidth()
    # root.geometry(f"{root_width}x400")  
    root.update_idletasks()  # Ensure all widgets are updated

    # Get screen width and height
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Set window size to screen width and height
    root.geometry(f"{screen_width}x{screen_height}")

    root.mainloop()  








