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


