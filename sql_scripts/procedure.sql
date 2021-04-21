use hyacinth;

delimiter //

create procedure Register(in email_ varchar(11), in password_ varchar(256), out valid bool)
begin
    if exists(
        select User
        from mysql.user
        where User=email_
        ) then
            set @password = (select password from employee where email=email_);
            if (password(password_)=@password) then
                set valid=true;
            else
                set valid=false;
            end if;
    else
        set @sql = (select concat('create user ', email_, ' identified by ', password_));
        prepare stmt from @sql;
        execute stmt;
        set valid=true;
    end if;
end; //

delimiter ;

