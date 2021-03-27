create view DoctorInfo as (
    select doctorID, name, phone, email, address, sex from Doctor natural join Employee
);

create view NurseInfo as (
    select nurseId, name, phone, email, address, sex from Nurse natural join Employee
);

create view DriverInfo as (
    select driverID, name, phone, email, address, sex from Driver natural join Employee
);

create view AdminInfo as (
    select adminID, name, phone, email, address, sex from Admin natural join Employee
);

create view VendorDrugInfo as (
    select Vendor.vendorID, p.pharmacyID, Vendor.name, Vendor.phone, Vendor.address, Vendor.email,
         price, orderTime, supplyTime,
         p.name as drug_name, category
    from Vendor
           inner join Supplies s using (vendorID)
           inner join Pharmacy p using (pharmacyID)
);

create view DriverJourneyInfo as (
    select
           DriverInfo.*, Ambulance.*, Journey.startTime, Journey.endTime, Journey.address as journeyAddress
    from DriverInfo
        inner join Journey using (driverID)
        inner join Ambulance using (ambulanceId)
)
