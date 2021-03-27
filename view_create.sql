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
    select * from vendor
    inner join supplies s on vendor.ID = s.vendorID
    inner join pharmacy p on s.drugID = p.ID
);
