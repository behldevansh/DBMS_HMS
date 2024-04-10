CREATE DATABASE test;
USE test;

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
    salary DECIMAL(10, 2),
    shift_id INT
);
INSERT INTO staff VALUES
(01,"Harsh","Sharma","M","9898989898","10","MgRoad","Indore","MP","455500","2022-10-10",50000.00,1),
(02,"Harshita","Sen","F","9898989897","14","civil lines","Bhopal","MP","455201","2022-11-10",60000.00,1),
(03,"Yash","Gupta","M","7898989898","22","DwarkaMor","Delhi","Delhi","110078","2022-10-15",55000.00,2),
(04,"Rohit","Sharma","M","9898999977","25","ShivajiRoad","Mumbai","Maharashtra","400009","2021-11-10",70000,3),
(05,"Rashmika","Diwaan","F","9898987845","02","Ambedkarroad","Mumbai","Maharashtra","400008","2021-10-10",90000.00,2);

insert into staff VALUES
(06,"Ansh","Yadav","M","7878787878","89","Silverclub","Patna","Bihar","800008","2022-09-09",45000.00,3),
(07,"Akshita","Saini","F","7854785411","97","Station Road","Dewas","MP","455001","2022-08-05",78020.00,1),
(08,"Saksham","Mehta","M","7544448899","88","TilakNagar","Ahmdabad","Gujrat","380001","2023-06-05",85400.00,3),
(09,"Chetan","Kohli","M","6260455256","55","Vijaynagar","Lucknow","UP","226001","2020-09-05",74000.00,2);
insert into staff Values
(10,"Shreya","Shukla","F","8787879588","13","Ambedkar road","Chennai","TamilNadu","700003","2021-10-03",69000.00,1);


INSERT INTO staff VALUES
(11, 'Jayesh', 'Dayal', 'M', '5454625555', '123', 'Main Street', 'New delhi', 'newdelhi', '110065', '2023-01-15', 15000.00, 1),
(12, 'Suyash', 'Sharma', 'M', '9876549870', '456', 'gokuldham street', 'Mumbai', 'Maharashtra', '190001', '2022-11-20', 15000.00, 2),
(13, 'Maahi', 'chaturvedi', 'F', '7475256345', '789', 'daryaganj', 'Indore', 'MP', '460001', '2023-03-05', 15000.00, 3),
(14, 'Eshita', 'arora', 'F', '6868686868', '101', 'Maharanapratap road', 'Jaipur', 'Rajasthan', '370001', '2022-10-10', 15000.00, 2),
(15, 'David', 'brown', 'M', '9898787456', '202', 'IG Street', 'Ajmer', 'Rajasthan', '394101', '2023-02-28', 15000.00, 1);

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);
INSERT INTO department values
(01,"Outpatient department(OPD)"),
(02,"Operation Theatre Complex (OT)"),
(03,"Radiology Department (X-ray)"),
(04,"General ward");

CREATE TABLE shift (
    shift_id INT PRIMARY KEY,
    start_time TIME,
    end_time TIME
);

INSERT INTO shift VALUES
(1,"06:00:00","14:00:00"),
(2,"14:00:00","22:00:00"),
(3,"22:00:00","06:00:00");


CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    speciality VARCHAR(255),
    department_id INT,
    staff_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
insert into doctor VALUES
(101,"Surgeon",04,01),
(102,"Cardiologist",02,03),
(103,"Gynaecologist",01,02),
(104,"Dermatologist",04,08),
(105,"Radiologist",03,07);

CREATE TABLE room (
    roomnumber INT PRIMARY KEY,
    roomtype VARCHAR(255)
);
INSERT INTO room (roomnumber, roomtype) VALUES
    (101, 'Single'),
    (102, 'Single'),
    (103, 'Double'),
    (104, 'Double'),
    (105, 'Triple'),
    (106, 'Single'),
    (107, 'Triple'),
    (108, 'Double');

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

INSERT INTO patient (patient_id, f_name, l_name, age, gender, phone_number, house_no, street_name, city, state, pincode, doctor_id, roomnumber) VALUES
    (1, 'John', 'Doe', 35, 'Male', '123-456-7890', '123', 'Main Street', 'New York', 'NY', '10001',101, 101),
    (2, 'Jane', 'Smith', 28, 'Female', '987-654-3210', '456', 'Elm Avenue', 'Los Angeles', 'CA', '90001', 102, 102),
    (3, 'Michael', 'Johnson', 45, 'Male', '555-123-4567', '789', 'Oak Lane', 'Chicago', 'IL', '60001',103, 103),
    (4, 'Emily', 'Wilson', 32, 'Female', '444-567-8901', '101', 'Maple Road', 'Houston', 'TX', '70001', 104, 104),
    (5, 'David', 'Brown', 50, 'Male', '222-333-4444', '202', 'Cedar Street', 'San Francisco', 'CA', '94101',101, 105),
    (6, 'Linda', 'Davis', 40, 'Female', '777-888-9999', '303', 'Birch Avenue', 'Miami', 'FL', '33101',102, 106),
    (7, 'Daniel', 'Martinez', 55, 'Male', '111-222-3333', '404', 'Pine Lane', 'Phoenix', 'AZ', '85001', 103, 107),
    (8, 'Sarah', 'Garcia', 29, 'Female', '333-444-5555', '505', 'Sycamore Road', 'Philadelphia', 'PA', '19101',104, 108),
    (9, 'James', 'Rodriguez', 42, 'Male', '888-999-0000', '606', 'Cypress Street', 'Dallas', 'TX', '75201',101, 103),
    (10, 'Olivia', 'Anderson', 34, 'Female', '555-666-7777', '707', 'Redwood Avenue', 'Atlanta', 'GA', '30301',102, 104);

create table nurse(
      staff_id INT,
      roomnumber INT,
      FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
      FOREIGN KEY (roomnumber) REFERENCES room(roomnumber)
);   
      
      
Insert into nurse VALUES
(04,101),
(05,104),
(04,102),
(06,103),
(09,108),
(10,105),
(05,106),
(10,107);



CREATE TABLE ambulance (
    ambulancenumber INT PRIMARY KEY,
    registrationnumber VARCHAR(255)
);
Insert into ambulance VALUES
(1001,"MP412004"),
(1002,"HR082003"),
(1003,"UP261998");


CREATE TABLE driver (
    driver_id INT PRIMARY KEY,
    staff_id INT,
    license_number VARCHAR(255),
    ambulancenumber INT,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (ambulancenumber) REFERENCES ambulance(ambulancenumber)
);

INSERT INTO driver (driver_id, staff_id, license_number, ambulancenumber) VALUES
    (1, 11, 'DL123456', 1001),
    (2, 12, 'DL789012', 1002),
    (3, 13, 'DL345678', 1003),
    (4, 14, 'DL901234', 1001);
    
CREATE TABLE records (
    record_id INT PRIMARY KEY,
    date_admitted DATE,
    date_discharged DATE,
    diagnosis VARCHAR(255),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

INSERT INTO records (record_id, date_admitted, date_discharged, diagnosis, patient_id) VALUES
    (1, '2023-01-05', '2023-01-15', 'Influenza', 1),
    (2, '2022-11-10', '2022-11-25', 'Fractured Arm', 2),
    (3, '2023-03-01', '2023-03-10', 'Pneumonia', 3),
    (4, '2022-10-05', '2022-10-20', 'Appendicitis', 4),
    (5, '2023-02-25', '2023-03-05', 'Bronchitis', 5),
    (6, '2022-12-10', '2022-12-22', 'Hypertension', 6),
    (7, '2023-01-20', '2023-02-05', 'Migraine', 7),
    (8, '2023-03-20', '2023-03-25', 'Allergies', 8),
    (9, '2022-11-05', '2022-11-15', 'Diabetes', 9),
    (10, '2022-12-30', '2023-01-15', 'Asthma', 10);
    
CREATE TABLE bill (
    bill_number INT PRIMARY KEY,
    doc_charges DECIMAL(10, 2),
    lab_charges DECIMAL(10, 2),
    room_charges DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    billing_date DATE,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

INSERT INTO bill (bill_number, doc_charges, lab_charges, room_charges, total_amount, billing_date, patient_id) VALUES
    (1, 500.00, 100.00, 250.00, 850.00, '2023-01-15', 1),
    (2, 600.00, 120.00, 300.00, 1020.00, '2022-11-25', 2),
    (3, 700.00, 140.00, 350.00, 1190.00, '2023-03-10', 3),
    (4, 550.00, 110.00, 275.00, 935.00, '2022-10-20', 4),
    (5, 650.00, 130.00, 325.00, 1105.00, '2023-03-05', 5),
    (6, 600.00, 120.00, 300.00, 1020.00, '2022-12-22', 6),
    (7, 750.00, 150.00, 375.00, 1275.00, '2023-02-05', 7),
    (8, 800.00, 160.00, 400.00, 1360.00, '2023-03-25', 8),
    (9, 525.00, 105.00, 262.50, 892.50, '2022-11-15', 9),
    (10, 700.00, 140.00, 350.00, 1190.00, '2023-01-15', 10);
show tables;


create table register(
      username VARCHAR(255) PRIMARY KEY,
      password VARCHAR(255)
);  