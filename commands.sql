CREATE TABLE staff (
  staff_id INT PRIMARY KEY,
  f_name VARCHAR(255),
  l_name VARCHAR(255),
  gender CHAR(1),
  phone_number VARCHAR(15),
  house_no VARCHAR(10),
  street_name VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  pincode VARCHAR(10),
  joining_date DATE,
  salary DECIMAL(10,2),
  shift_id INT
);

CREATE TABLE department(
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

CREATE TABLE shift(
  shift_id INT PRIMARY KEY,
  start_name TIME,
  end_time TIME
);


CREATE TABLE doctor(
  doctor_id INT PRIMARY KEY,
  speciality VARCHAR(255),
  department_id INT,
  staff_id INT,
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE room(
  roomnumber INT PRIMARY KEY,
  roomtype VARCHAR(255)
);

CREATE TABLE patient (
  patient_id INT PRIMARY KEY,
  f_name VARCHAR(255),
  l_name VARCHAR(255),
  age INT,
  gender VARCHAR(10),
  phone_number VARCHAR(15),
  house_no VARCHAR(10),
  street_name VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  pincode VARCHAR(10),
  doctor_id INT,
  roomnumber INT,
  FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
  FOREIGN KEY (roomnumber) REFERENCES room(roomnumber)
);


CREATE TABLE nurse(
  staff_id INT,
  roomnumber INT,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (roomnumber) REFERENCES room(roomnumber)
);

CREATE TABLE ambulance(
  ambulancenumber INT PRIMARY KEY,
  registrationnumber VARCHAR(255)
);


CREATE TABLE driver(
  driver_id INT PRIMARY KEY,
  staff_id INT,
  license_number VARCHAR(255),
  ambulancenumber INT,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (ambulancenumber) REFERENCES ambulance(ambulancenumber)
);


CREATE TABLE records (
  record_id INT PRIMARY KEY,
  date_admitted DATE,
  date_discharged DATE,
  diagnosis VARCHAR(255),
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);


CREATE TABLE bill(
  bill_number INT PRIMARY KEY,
  doc_charges DECIMAL(10,2),
  lab_charges DECIMAL(10,2),
  room_charges DECIMAL(10,2),
  total_amount DECIMAL(10,2),
  billing_date DATE,
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);









shift (shift_id (primary key))


shift_details (shift_id (foreign key), start_time, end_time)




























































