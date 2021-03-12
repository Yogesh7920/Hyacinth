drop database if exists Hyacinth;
create database if not exists Hyacinth;
use Hyacinth;


create table Employee
(
    ID       int primary key,
    name     varchar(45) not null,
    password longtext    not null,
    phone    varchar(20) not null,
    email    varchar(20) not null,
    address  varchar(20) not null,
    sex      varchar(20) not null
);

create table Nurse
(
    ID            int primary key,
    qualification varchar(30) not null,
    license       varchar(30) not null,
    constraint FK_Employee_Nurse foreign key (ID)
        references Employee (ID)
        on delete cascade
);

create table Admin
(
    ID int primary key,
    constraint FK_Employee_Admin foreign key (ID)
        references Employee (ID)
        on delete cascade
);

create table Doctor
(
    ID             int primary key,
    qualification  varchar(30)  not null,
    license        varchar(30)  not null,
    bio            varchar(300) not null,
    available      bool         not null,
    specialization varchar(30)  not null,
    constraint FK_Employee_Doctor foreign key (ID)
        references Employee (ID)
        on delete cascade
);

create table Driver
(
    ID          int primary key,
    experience  int(5)      not null,
    licenseNo   varchar(10) not null,
    successRate float,
    constraint FK_Employee_Driver foreign key (ID)
        references Employee (ID)
        on delete cascade
);

create table Patient
(
    ID             int primary key,
    name           varchar(45) not null,
    password       longtext    not null,
    phone          varchar(20) not null,
    email          varchar(20) not null,
    address        varchar(20) not null,
    sex            varchar(20) not null,
    medicalHistory varchar(300),
    marital        bool
);

create table Prescription
(
    ID        int primary key,
    timeStamp timestamp not null
);

create table Diagnostics
(
    ID       int primary key,
    category varchar(20) not null,
    name     varchar(20) not null
);

create table Vendor
(
    ID      int primary key,
    Name    varchar(45)  not null,
    Phone   varchar(10)  not null,
    Address varchar(100) not null,
    Email   varchar(20)  not null
);

create table Pharmacy
(
    ID       int primary key,
    name     varchar(45) not null,
    category varchar(20) not null
);

create table Invoice
(
    ID     int primary key,
    amount float not null,
    isPaid bool  not null
);

create table Ambulance
(
    ID              int primary key,
    lastMaintenance datetime,
    totalDistance   float
);

create table Consultation
(
    ID        int primary key,
    problem   varchar(40),
    doctorID  int unique,
    patientID int unique,
    constraint FK_Doctor_Consultation foreign key (doctorID)
        references Doctor (ID)
        on delete cascade,
    constraint FK_Patient_Consultation foreign key (patientID)
        references Patient (ID)
        on delete cascade
);

create table Appointment
(
    ID             int primary key,
    startTime      timestamp,
    endTime        timestamp,
    remarks        varchar(40),
    invoiceId      int unique,
    prescriptionId int unique,
    consultationId int,
    constraint FK_Consultation_Appointment foreign key (consultationId)
        references Consultation (ID)
        on delete cascade,
    constraint FK_Invoice_Appointment foreign key (invoiceId)
        references Invoice (ID)
        on delete cascade,
    constraint FK_Prescription_Appointment foreign key (prescriptionId)
        references Prescription (ID)
        on delete cascade
);

create table Supplies
(
    drugID     int      not null,
    vendorID   int      not null,
    price      float    not null,
    orderTime  datetime not null,
    supplyTime datetime,
    constraint FK_Pharmacy_Supplies foreign key (drugID)
        references Pharmacy (ID)
        on delete cascade,
    constraint FK_Vendor_Supplies foreign key (vendorID)
        references Vendor (ID)
        on delete cascade,
    primary key (drugID, vendorID)
);


create table Drugs
(
    prescriptionID int not null,
    pharmacyID     int not null,
    constraint FK_Prescription_Drugs foreign key (prescriptionID)
        references Prescription (ID)
        on delete cascade,
    constraint FK_Pharmacy_Drugs foreign key (pharmacyID)
        references Pharmacy (ID)
        on delete cascade,
    primary key (prescriptionID, pharmacyID)
);

create table Contains
(
    diagnosticsID  int not null,
    prescriptionID int not null,
    constraint FK_Diagnostics_Contains foreign key (diagnosticsID)
        references Diagnostics (ID)
        on delete cascade,
    constraint FK_Prescription_Contains foreign key (prescriptionID)
        references Prescription (ID)
        on delete cascade,
    primary key (diagnosticsID, prescriptionID)
);

create table Assists
(
    nurseId       int,
    diagnosticsID int,
    constraint FK_Nurse_Assists foreign key (nurseID)
        references Nurse (ID)
        on delete cascade,
    constraint FK_Diagnostics_Assists foreign key (diagnosticsID)
        references Diagnostics (ID)
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
    constraint FK_Driver_Journey foreign key (driverID)
        references Driver (ID)
        on delete cascade,
    constraint FK_Ambulance_Journey foreign key (ambulanceId)
        references Ambulance (ID)
        on delete cascade,
    primary key (driverID, ambulanceId)
);



# drop database if exists Hyacinth;
# create database if not exists Hyacinth;
# use Hyacinth;
#
# 
# create table Employees
# (
#     ID       int primary key,
#     name     varchar(45) not null,
#     password longtext    not null,
#     phone    varchar(20) not null,
#     email    varchar(20) not null,
#     address  varchar(20) not null,
#     sex      varchar(20) not null
# );
#
# # E
# create table Nurses
# (
#     ID            int primary key,
#     qualification varchar(30) not null,
#     license       varchar(30) not null,
#     constraint FK_Employees_Nurses foreign key (ID)
#         references Employees (ID)
#         on delete cascade
# );
#
# # E
# create table Admins
# (
#     ID int primary key,
#     constraint FK_Employees_Admins foreign key (ID)
#         references Employees (ID)
#         on delete cascade
# );
#
# # E
# create table Doctors
# (
#     ID             int primary key,
#     qualification  varchar(30)  not null,
#     license        varchar(30)  not null,
#     bio            varchar(300) not null,
#     available      bool         not null,
#     specialization varchar(30)  not null,
#     constraint FK_Employees_Doctors foreign key (ID)
#         references Employees (ID)
#         on delete cascade
# );
#
# # E
# create table Driver
# (
#     ID          int primary key,
#     experience  int(5)      not null,
#     licenseNo   varchar(10) not null,
#     successRate float,
#     constraint FK_Employees_Driver foreign key (ID)
#         references Employees (ID)
#         on delete cascade
# );
#
# # E
# create table Patients
# (
#     ID             int primary key,
#     name           varchar(45) not null,
#     password       longtext    not null,
#     phone          varchar(20) not null,
#     email          varchar(20) not null,
#     address        varchar(20) not null,
#     sex            varchar(20) not null,
#     medicalHistory varchar(300),
#     marital        bool
# );
#
# # E
# create table Consultation
# (
#     ID        int primary key,
#     problem   varchar(40)
# );
#
# # E
# create table Appointment
# (
#     ID             int primary key,
#     startTime      timestamp,
#     endTime        timestamp,
#     remarks        varchar(40)
# );
#
# # E
# create table Prescription
# (
#     ID            int primary key,
#     timeStamp     timestamp not null
# );
#
# # E
# create table Diagnostics
# (
#     ID       int primary key,
#     category varchar(20) not null,
#     name     varchar(20) not null
# );
#
# # E
# create table Vendor
# (
#     ID      int primary key,
#     Name    varchar(45)  not null,
#     Phone   varchar(10)  not null,
#     Address varchar(100) not null,
#     Email   varchar(20)  not null
# );
#
# # E
# create table Pharmacy
# (
#     ID       int primary key,
#     name     varchar(45) not null,
#     category varchar(20) not null
# );
#
# # E
# create table Invoice
# (
#     ID            int primary key,
#     amount        float not null,
#     isPaid        bool  not null
# );
#
# # E
# create table Ambulance
# (
#     ID              int primary key,
#     lastMaintenance datetime,
#     totalDistance   float
# );
#
# # M:M
# create table Supplies
# (
#     drugID     int      not null,
#     vendorID   int      not null,
#     price      float    not null,
#     orderTime  datetime not null,
#     supplyTime datetime,
#     constraint FK_Pharmacy_Supplies foreign key (drugID)
#         references Pharmacy (ID)
#         on delete cascade,
#     constraint FK_Vendor_Supplies foreign key (vendorID)
#         references Vendor (ID)
#         on delete cascade,
#     primary key (drugID, vendorID)
# );
#
#
# # M:M
# create table Drugs
# (
#     prescriptionID int not null,
#     pharmacyID     int not null,
#     constraint FK_Prescription_Drugs foreign key (prescriptionID)
#         references Prescription (ID)
#         on delete cascade,
#     constraint FK_Pharmacy_Drugs foreign key (pharmacyID)
#         references Pharmacy (ID)
#         on delete cascade,
#     primary key (prescriptionID, pharmacyID)
# );
#
# # M:M
# create table Contains
# (
#     diagnosticsID  int not null,
#     prescriptionID int not null,
#     constraint FK_Diagnostics_Contains foreign key (diagnosticsID)
#         references Diagnostics (ID)
#         on delete cascade,
#     constraint FK_Prescription_Contains foreign key (prescriptionID)
#         references Prescription (ID)
#         on delete cascade,
#     primary key (diagnosticsID, prescriptionID)
# );
#
# # M:M
# create table Assists
# (
#     nurseId       int,
#     diagnosticsID int,
#     constraint FK_Nurses_Assists foreign key (nurseID)
#         references Nurses (ID)
#         on delete cascade,
#     constraint FK_Diagnostics_Assists foreign key (diagnosticsID)
#         references Diagnostics (ID)
#         on delete cascade,
#     primary key (nurseId, diagnosticsID)
# );
#
# # M:M
# create table Journey
# (
#     driverID    int,
#     ambulanceId int,
#     address     varchar(100),
#     startTime   datetime,
#     endTime     datetime,
#     constraint FK_Driver_Journey foreign key (driverID)
#         references Driver (ID)
#         on delete cascade,
#     constraint FK_Ambulance_Journey foreign key (ambulanceId)
#         references Ambulance (ID)
#         on delete cascade,
#     primary key (driverID, ambulanceId)
# );
#
# # 1:1
# create table Payment
# (
#     invoiceID     int unique,
#     appointmentID int unique,
#     constraint FK_Invoice_Payment foreign key (invoiceID)
#         references Invoice (ID)
#         on delete cascade,
#     constraint FK_Appointment_Payment foreign key (appointmentID)
#         references Appointment (ID)
#         on delete cascade
# );
#
# # 1:1
# create table Attachment
# (
#     prescriptionID int unique,
#     appointmentID  int unique,
#     constraint FK_Prescription_Attachment foreign key (prescriptionID)
#         references Prescription (ID)
#         on delete cascade,
#     constraint FK_Appointment_Attachment foreign key (AppointmentID)
#         references Appointment (ID)
#         on delete cascade
# );
#
# # 1:M
# create table Performs
# (
#     doctorID       int,
#     consultationID int unique,
#     constraint FK_Doctors_Performs foreign key (doctorID)
#         references Doctors (ID)
#         on delete cascade,
#     constraint FK_Consultation_Performs foreign key (consultationID) references Consultation (ID)
# );
#
# # 1:M
# create table Participates
# (
#     consultationID int,
#     patientID      int unique,
#     constraint FK_Consultation_Participates foreign key (consultationID)
#         references Consultation (ID)
#         on delete cascade,
#     constraint FK_Patients_Participates foreign key (patientID) references Patients (ID)
# );
#
#
# # 1:M
# create table Session
# (
#     consultationID int unique,
#     appointmentID  int,
#     constraint FK_Consultation_Session foreign key (consultationID)
#         references Consultation (ID)
#         on delete cascade,
#     constraint FK_Appointment_Session foreign key (appointmentID)
#         references Appointment (ID)
#         on delete cascade
# );
#
