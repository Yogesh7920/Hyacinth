use hyacinth;

drop function if exists total_monthly_income;

DELIMITER //

create function total_monthly_income()
returns float
begin
    return (
        select sum(amount) from hyacinth.invoice
        inner join appointment a on invoice.invoiceID = a.invoiceId
        where (isPaid=1) and (startTime > date_sub(curdate(), interval 31 day ))
);
end //

DELIMITER ;

select total_monthly_income();
