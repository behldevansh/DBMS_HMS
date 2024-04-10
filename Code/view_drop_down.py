import tkinter as tk
from tkinter import ttk
import view
import button as bP

def on_table_selected(event, table_var):
    selected_table = table_var.get()
    view.view_database(selected_table)
    

def drop_down():
    # Create a Tkinter window
    root = tk.Tk()
    root.title("Select table to be viewed")

    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Set window size to screen width and height
    root.geometry(f"{screen_width}x{screen_height}")

    # Create a label
    label = tk.Label(root, text="Select a Table:")
    label.pack()

    # Create a variable to store the selected table
    table_var = tk.StringVar()

    # Create a dropdown menu
    table_choices = ["Patient", "Staff", "Department", "Shift", "Doctor", "Nurse", "Driver", "Room", "Ambulance", "Records", "Bill"]
    table_dropdown = ttk.Combobox(root, textvariable=table_var, values=table_choices)
    table_dropdown.pack()
    # table_dropdown.bind("<<ComboboxSelected>>", on_table_selected)

    # Create a button to perform data insertion
    show_button = tk.Button(root, text="Show Data", command=lambda:on_table_selected("<<ComboboxSelected>>", table_var))
    show_button.pack()

    return_button = tk.Button(root, text="Return to Main", command=lambda:[root.destroy(),bP.buttonPage()])
    return_button.pack()


    # Run the Tkinter main loop
    root.mainloop()
