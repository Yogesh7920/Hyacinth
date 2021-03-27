create view DoctorInfo as (
    select * from doctor natural join employee
);

create view NurseInfo as (
    select * from nurse natural join employee
);

create view DriverInfo as (
    select * from driver natural join employee
);

create view AdminInfo as (
    select * from admin natural join employee
);

create view VendorDrugInfo as (
    select vendorID, drugID, vendor.name, vendor.phone, vendor.address, vendor.email,
         price, orderTime, supplyTime,
         p.name as drug_name, category
    from vendor
           inner join supplies s on vendor.ID = s.vendorID
           inner join pharmacy p on s.drugID = p.ID
);

create view NurseDiagnosticsInfo as (
	select NurseInfo.ID as Nurse_ID, NurseInfo.qualification, 
               NurseInfo.license, Diagnostics.ID as Diagnostics_ID, 
               Diagnostics.category, Diagnostics.name as diagnostics 
        from NurseInfo inner join (Assists, Diagnostics) on 
             (NurseInfo.ID = Assists.nurseId and Diagnostics.ID = Assists.diagnosticsID)

);

