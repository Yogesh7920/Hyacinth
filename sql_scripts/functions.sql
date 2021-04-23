drop function if exists total_monthly_income;
drop function if exists total_monthly_expenditure;
drop function if exists user_exists;
drop function if exists employee_role;

DELIMITER //

create function total_monthly_income()
returns float
begin
    return (
        select sum(amount) from Hyacinth.Invoice
        inner join Appointment a on Invoice.invoiceID = a.invoiceId
        where (isPaid=1) and (startTime > date_sub(curdate(), interval dayofmonth(curdate()) - 1 day ))
    );
end //

create function employee_role(email_ varchar(20))
returns varchar(20)
begin
    if exists(
        select * from Doctor
        where doctorID=(select employeeID from Employee where email=email_)
    )
    then
        return 'Doctor';
    elseif exists(
        select * from Nurse
        where nurseID=(select employeeID from Employee where email=email_)
    )
    then return 'Nurse';
    elseif exists(
        select * from Driver
        where driverID=(select employeeID from Employee where email=email_)
    )
    then return 'Driver';
    elseif exists(
        select * from Admin
        where adminID=(select employeeID from Employee where email=email_)
    )
    then return 'Admin';
    else return 'Invalid';
    end if;
end //

create function total_monthly_expenditure()
    returns float
begin
    return (
        select sum(price) from Hyacinth.Supplies
        where (orderTime > date_sub(curdate(), interval 31 day ))
    );
end //

create function user_exists(email varchar(20))
    returns bool
begin
    return (
        exists(select User from mysql.user where User=email)
    );
end //

DELIMITER ;
