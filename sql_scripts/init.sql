alter table Patient auto_increment=51;
alter table Employee auto_increment=31;
alter table Prescription auto_increment=51;
alter table Diagnostics auto_increment=31;
alter table Vendor auto_increment=51;
alter table Pharmacy auto_increment=51;
alter table Invoice auto_increment=51;
alter table Ambulance auto_increment=31;
alter table Consultation auto_increment=25;

update Patient set password=PASSWORD('pass');
update Employee set password=PASSWORD('pass');