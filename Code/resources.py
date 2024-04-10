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