drop database Hospital;
create database Hospital;
use Hospital;

# ISA
create table Employees (
    ID int primary key ,
    name varchar(45) NOT NULL ,
    password longtext NOT NULL ,
    phone varchar(20) NOT NULL ,
    email varchar(20) NOT NULL ,
    address varchar(20) NOT NULL ,
    sex varchar(20) NOT NULL
);

# E
create table Nurses (
    ID int PRIMARY KEY references Employees(ID),
    qualification varchar(30) NOT NULL,
    license varchar(30) NOT NULL
);

# E
create table Admins (
    ID int PRIMARY KEY references Employees(ID)
);

# E
create table Doctors (
    ID int PRIMARY KEY references Employees(ID),
    qualification varchar(30) NOT NULL,
    license varchar(30) NOT NULL,
    bio varchar(300) NOT NULL,
    available bool NOT NULL,
    specialization varchar(30) NOT NULL
);

# E
create table Driver (
    ID int primary key REFERENCES Employees(ID),
    experience int(5) NOT NULL,
    licenseNo varchar(10) NOT NULL,
    successRate float
);

# E
create table Patients (
    ID int PRIMARY KEY,
    name varchar(45) NOT NULL ,
    password longtext NOT NULL ,
    phone varchar(20) NOT NULL ,
    email varchar(20) NOT NULL ,
    address varchar(20) NOT NULL ,
    sex varchar(20) NOT NULL,
    medicalHistory varchar(300),
    marital bool
);

# E
create table Consultation (
    ID int primary key ,
    problem varchar(40),
    docID int,
    patientID int
);

# E
create table Appointment (
    ID int PRIMARY KEY ,
    startTime timestamp,
    endTime timestamp,
    remarks varchar(40),
    consultationID int
);

# E
create table Prescription (
    ID int primary key ,
    timeStamp timestamp not null,
    appointmentID int
);

# E
create table Diagnostics (
    ID int primary key ,
    category varchar(20) not null ,
    name varchar(20) not null
);

# E
create table Vendor(
    ID int PRIMARY KEY,
    Name varchar(45) not null,
    Phone varchar(10) not null,
    Address varchar(100) not null,
    Email varchar(20) not null
);

# E
create table Pharmacy(
    ID int PRIMARY KEY,
    name varchar(45) not null,
    category varchar(20) not null
);

# E
create table Invoice(
    ID int PRIMARY KEY,
    amount float not null,
    isPaid bool not null,
    appointmentID int unique
);

# E
create table Ambulance (
   ID int primary key,
   lastMaintenance datetime,
   totalDistance float
);

# M:M
create table Supplies (
    drugID     int not null ,
    vendorID   int not null ,
    price      float    not null,
    orderTime  datetime not null,
    supplyTime datetime,
    constraint FK_Pharmacy_Supplies foreign key (drugID) references Pharmacy(ID) ON DELETE CASCADE,
    constraint FK_Vendor_Supplies foreign key (vendorID) references Vendor(ID),
    primary key (drugID, vendorID)
);


# M:M
create table Drugs(
      prescriptionID int not null,
      pharmacyID int not null,
      constraint FK_Prescription_Drugs FOREIGN KEY (prescriptionID) references Prescription(ID),
      constraint FK_Pharmacy_Drugs FOREIGN KEY (pharmacyID) references Pharmacy(ID),
      primary key (prescriptionID, pharmacyID)
);

# M:M
create table Contains(
     diagnosticID int not null,
     prescriptionID int not null,
     constraint FK_Diagnostics_Contains FOREIGN KEY (diagnosticID) references Diagnostics(ID),
     constraint FK_Prescription_Contains FOREIGN KEY (prescriptionID) references Prescription(ID),
     primary key (diagnosticID, prescriptionID)
);

# M:M
create table Assists (
    nurseId int,
    diagnosticsID int,
    constraint FK_Nurses_Assists foreign key (nurseID) REFERENCES Nurses(ID),
    constraint FK_Diagnostics_Assists foreign key (diagnosticsID) REFERENCES Diagnostics(ID),
    primary key (nurseId, diagnosticsID)
);

# M:M
create table Journey (
    driverID int,
    ambulanceId int,
    address varchar(100),
    startTime datetime,
    endTime datetime,
    constraint FK_Driver_Journey foreign key (driverID) REFERENCES Driver(ID),
    constraint FK_Ambulance_Journey foreign key (ambulanceId) REFERENCES Ambulance(ID),
    PRIMARY KEY (driverID, ambulanceId)
);

# 1:1
create table Payment (
    invoiceID int unique ,
    AppointmentID int unique ,
    constraint FK_Invoice_Payment foreign key (invoiceID) references Invoice(ID),
    constraint FK_Appointment_Payment foreign key (AppointmentID) references Appointment(ID)
);

# 1:1
create table Attachment (
    prescriptionID int unique ,
    AppointmentID int unique ,
    constraint FK_Prescription_Attachment foreign key (prescriptionID) references Prescription(ID),
    constraint FK_Appointment_Attachment foreign key (AppointmentID) references Appointment(ID)
);

# 1:M
create table Performs (
    doctorID int,
    consultationID int unique,
    constraint FK_Doctors_Performs foreign key (doctorID) references Doctors(ID),
    constraint FK_Consultation_Performs foreign key (consultationID) references Consultation(ID)
);

# 1:M
create table Participates (
    consultationID int,
    patientID int unique,
    constraint FK_Consultation_Participates foreign key (consultationID) references Consultation(ID),
    constraint FK_Patients_Participates foreign key (patientID) references Patients(ID)
);


# 1:M
create table Session(
    consultationID int unique,
    appointmentID int,
    constraint FK_Consultation_Session foreign key (consultationID) references Consultation(ID),
    constraint FK_Appointment_Session foreign key (appointmentID) references Appointment(ID)
);
