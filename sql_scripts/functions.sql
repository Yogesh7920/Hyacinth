drop function if exists total_monthly_income;
drop function if exists total_monthly_expenditure;
drop function if exists user_exists;

DELIMITER //

create function total_monthly_income()
returns float
begin
    return (
        select sum(amount) from Hyacinth.Invoice
        inner join Appointment a on Invoice.invoiceID = a.invoiceId
        where (isPaid=1) and (startTime > date_sub(curdate(), interval 31 day ))
);
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
