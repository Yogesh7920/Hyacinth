drop view if exists DoctorInfo;
drop view if exists NurseInfo;
drop view if exists DriverInfo;
drop view if exists PatientInfo;
drop view if exists AdminInfo;
drop view if exists VendorDrugInfo;
drop view if exists DriverJourneyInfo;
drop view if exists NurseDiagnosticsInfo;
drop view if exists DoctorPatientInfo;
drop view if exists PatientDoctorInfo;

create view DoctorInfo as
    ( select  doctorID, name as doctorName,
             phone, email, address, sex
    from Doctor natural join Employee );

create view PatientInfo as
    ( select patientID, name as patientName, phone, email,
             address, sex, medicalHistory, marital
    from Patient );

create view NurseInfo as
    ( select Nurse.*, name, phone, email, address, sex
    from Nurse natural join Employee );

create view DriverInfo as
    ( select driverID, name, phone, email, address, sex
    from Driver natural join Employee );

create view AdminInfo as
    ( select adminID, name, phone, email, address, sex
    from Admin natural join Employee );

create view VendorDrugInfo as (
    select Vendor.vendorID, p.pharmacyID, Vendor.name,
           Vendor.phone, Vendor.address, Vendor.email,
         price, orderTime, supplyTime,
         p.name as drugName, category
    from Vendor
           inner join Supplies s using (vendorID)
           inner join Pharmacy p using (pharmacyID)
);

create view DriverJourneyInfo as (
    select
           DriverInfo.*, Ambulance.*, Journey.startTime,
           Journey.endTime, Journey.address as journeyAddress
    from DriverInfo
        inner join Journey using (driverID)
        inner join Ambulance using (ambulanceId)
);
create view NurseDiagnosticsInfo as (
	select
	       NurseInfo.*,
	       Diagnostics.diagnosticsID, Diagnostics.category,
	       Diagnostics.name as diagnostics
    from NurseInfo
        inner join Assists using (nurseID)
        inner join Diagnostics using (diagnosticsID)
);

create view DoctorPatientInfo as (
    select * from DoctorInfo
          inner join Consultation C using (doctorID)
          inner join Appointment A using (consultationID)
          inner join Prescription Pr using (prescriptionID)
          inner join Drugs D using (prescriptionID)
          inner join Pharmacy Ph using (pharmacyID)
);

create view PatientDoctorInfo as (
    select * from PatientInfo
        inner join Consultation as C using (patientID)
        inner join Appointment as A using (consultationID)
        inner join Invoice as I using (invoiceID)
        inner join Prescription as P using (prescriptionID)
        inner join Drugs as D using (prescriptionID)
        inner join Pharmacy as Ph using (pharmacyID)
);
