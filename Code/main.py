import tkinter as tk
from tkinter import messagebox
import login as lg
import register as reg



def open_login_window(root):
    root.destroy()
    lg.login()
    



def open_register_window(root):
    root.destroy()
    reg.register()
    # view_window = tk.Toplevel(root)
    # view_window.title("View Data")
    # Create the view window UI here



def main():
    
    root = tk.Tk()
    root.title("Database Management")

    # Function to open insert, view, and delete windows
    login_button = tk.Button(root, text="Login", command=lambda:[open_login_window(root)])
    login_button.grid(row=0, column=1, padx=10, pady=5)

    Register_button = tk.Button(root, text="Register", command=lambda:[open_register_window(root)])
    Register_button.grid(row=1, column=1, padx=10, pady=5)

    

    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Set window size to screen width and height
    root.geometry(f"{screen_width}x{screen_height}")

    root.mainloop()

main()

