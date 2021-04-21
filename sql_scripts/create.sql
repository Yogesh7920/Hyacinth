drop database if exists Hyacinth;
create database if not exists Hyacinth;
use Hyacinth;

create table Employee
(
    employeeID       int primary key,
    name     varchar(45) not null,
    password longtext    not null,
    phone    varchar(20) not null,
    email    varchar(255) not null,
    address  varchar(20) not null,
    sex      varchar(20) not null,
    salary   int         not null,
    constraint SexCheck check ( sex in ('Male', 'Female', 'Other') ),
    constraint PhoneCheck check ( phone regexp '^[\+]91 [6-9][[:digit:]]{9}$' )
);

create table Nurse
(
    nurseID            int primary key,
    qualification varchar(30) not null,
    license       varchar(30) not null,
    constraint FK_Employee_Nurse foreign key (nurseID)
        references Employee (employeeID)
        on delete cascade
);

create table Admin
(
    adminID int primary key,
    constraint FK_Employee_Admin foreign key (adminID)
        references Employee (employeeID)
        on delete cascade
);

create table Doctor
(
    doctorID             int primary key,
    qualification  varchar(30)  not null,
    license        varchar(30)  not null,
    bio            varchar(300) not null,
    available      bool         not null,
    specialization varchar(30)  not null,
    constraint FK_Employee_Doctor foreign key (doctorID)
        references Employee (employeeID)
        on delete cascade
);

create table Driver
(
    driverID          int primary key,
    experience  int(5)      not null,
    licenseNo   varchar(10) not null,
    successRate float,
    constraint FK_Employee_Driver foreign key (driverID)
        references Employee (employeeID)
        on delete cascade
);

create table Patient
(
    patientID             int primary key,
    name           varchar(45) not null,
    password       longtext    not null,
    phone          varchar(20) not null,
    email          varchar(20) not null,
    address        varchar(20) not null,
    sex            varchar(20) not null,
    medicalHistory varchar(300),
    marital        bool,
    constraint SexCheck check ( sex in ('Male', 'Female', 'Other') ),
    constraint PhoneCheck check ( phone regexp '^[\+]91 [6-9][[:digit:]]{9}$' )
);

create table Prescription
(
    prescriptionID        int primary key,
    timeStamp timestamp not null
);

create table Diagnostics
(
    diagnosticsID       int primary key,
    category varchar(20) not null,
    name     varchar(20) not null
);

create table Vendor
(
    vendorID      int primary key,
    name    varchar(45)  not null,
    phone   varchar(20)  not null,
    address varchar(100) not null,
    email   varchar(20)  not null,
    constraint PhoneCheck check ( phone regexp '^[\+]91 [6-9][[:digit:]]{9}$' )
);

create table Pharmacy
(
    pharmacyID       int primary key,
    name     varchar(45) not null,
    category varchar(20) not null
);

create table Invoice
(
    invoiceID     int primary key,
    amount float not null,
    isPaid bool  not null
);

create table Ambulance
(
    ambulanceID              int primary key,
    lastMaintenance datetime,
    totalDistance   float
);

create table Consultation
(
    consultationID        int primary key,
    problem   varchar(40),
    doctorID  int,
    patientID int,
    constraint FK_Doctor_Consultation foreign key (doctorID)
        references Doctor (doctorID)
        on delete cascade,
    constraint FK_Patient_Consultation foreign key (patientID)
        references Patient (patientID)
        on delete cascade
);

create table Appointment
(
    appointmentID             int primary key,
    startTime      timestamp,
    endTime        timestamp,
    remarks        varchar(40),
    invoiceId      int unique not null,
    prescriptionId int unique not null,
    consultationId int not null,
    constraint DateTimeCheck check ( endTime > startTime ),
    constraint FK_Consultation_Appointment foreign key (consultationId)
        references Consultation (consultationID)
        on delete cascade,
    constraint FK_Invoice_Appointment foreign key (invoiceId)
        references Invoice (invoiceID)
        on delete cascade,
    constraint FK_Prescription_Appointment foreign key (prescriptionId)
        references Prescription (prescriptionID)
        on delete cascade
);

create table Supplies
(
    pharmacyID     int      not null,
    vendorID   int      not null,
    price      float    not null,
    orderTime  datetime not null,
    supplyTime datetime,
    constraint DateTimeCheck check ( supplyTime > orderTime ),
    constraint FK_Pharmacy_Supplies foreign key (pharmacyID)
        references Pharmacy (pharmacyID)
        on delete cascade,
    constraint FK_Vendor_Supplies foreign key (vendorID)
        references Vendor (vendorID)
        on delete cascade,
    primary key (pharmacyID, vendorID)
);


create table Drugs
(
    prescriptionID int not null,
    pharmacyID     int not null,
    constraint FK_Prescription_Drugs foreign key (prescriptionID)
        references Prescription (prescriptionID)
        on delete cascade,
    constraint FK_Pharmacy_Drugs foreign key (pharmacyID)
        references Pharmacy (pharmacyID)
        on delete cascade,
    primary key (prescriptionID, pharmacyID)
);

create table Contains
(
    diagnosticsID  int not null,
    prescriptionID int not null,
    constraint FK_Diagnostics_Contains foreign key (diagnosticsID)
        references Diagnostics (diagnosticsID)
        on delete cascade,
    constraint FK_Prescription_Contains foreign key (prescriptionID)
        references Prescription (prescriptionID)
        on delete cascade,
    primary key (diagnosticsID, prescriptionID)
);

create table Assists
(
    nurseId       int,
    diagnosticsID int,
    constraint FK_Nurse_Assists foreign key (nurseID)
        references Nurse (nurseID)
        on delete cascade,
    constraint FK_Diagnostics_Assists foreign key (diagnosticsID)
        references Diagnostics (diagnosticsID)
        on delete cascade,
    primary key (nurseId, diagnosticsID)
);

create table Journey
(
    driverID    int,
    ambulanceId int,
    address     varchar(100),
    startTime   datetime,
    endTime     datetime,
    constraint DateTimeCheck check ( endTime > startTime ),
    constraint FK_Driver_Journey foreign key (driverID)
        references Driver (driverID)
        on delete cascade,
    constraint FK_Ambulance_Journey foreign key (ambulanceId)
        references Ambulance (ambulanceID)
        on delete cascade,
    primary key (driverID, ambulanceId)
);

