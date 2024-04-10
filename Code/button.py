import tkinter as tk
from tkinter import messagebox
import insert_drop_down as I
import view_drop_down as V
import delete_drop_down as D



def open_insert_window(root):
    root.destroy()
    I.drop_down()
    



def open_view_window(root):
    root.destroy()
    V.drop_down()
    # view_window = tk.Toplevel(root)
    # view_window.title("View Data")
    # Create the view window UI here

def open_delete_window(root):
    root.destroy()
    D.drop_down()
    # Create the delete window UI here

def buttonPage():
    
    root = tk.Tk()
    root.title("Database Management")

    # Function to open insert, view, and delete windows
    insert_button = tk.Button(root, text="Insert Data", command=lambda:[open_insert_window(root)])
    insert_button.grid(row=0, column=1, padx=10, pady=5)

    view_button = tk.Button(root, text="View Data", command=lambda:[open_view_window(root)])
    view_button.grid(row=1, column=1, padx=10, pady=5)

    delete_button = tk.Button(root, text="Delete Data", command=lambda:[open_delete_window(root)])
    delete_button.grid(row=2, column=1, padx=10, pady=5)

    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Set window size to screen width and height
    root.geometry(f"{screen_width}x{screen_height}")

    root.mainloop()

# global root
# root = tk.Tk()
# root.title("Database Management")

# # Function to open insert, view, and delete windows
# insert_button = tk.Button(root, text="Insert Data", command=lambda:[open_insert_window(root)])
# insert_button.grid(row=0, column=1, padx=10, pady=5)

# view_button = tk.Button(root, text="View Data", command=open_view_window)
# view_button.grid(row=1, column=1, padx=10, pady=5)

# delete_button = tk.Button(root, text="Delete Data", command=open_delete_window)
# delete_button.grid(row=2, column=1, padx=10, pady=5)
# root.mainloop()
# buttonPage()