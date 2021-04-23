drop procedure if exists exec_query;
drop procedure if exists EmployeeRegistration;
drop procedure if exists PatientRegistration;

delimiter //

create procedure exec_query(query_str varchar(255))
begin
    set @exec_cmd = query_str;
    prepare stmt from @exec_cmd;
    execute stmt;
    deallocate prepare stmt;
end; //

create procedure EmployeeRegistration(in email_ varchar(20), in password_ varchar(255), out valid bool)
begin
    -- If user exists, then check password
    if user_exists(email_)
    then
        set @password = (select password from Employee where email=email_);
        if (password(password_)=@password) then
            set valid=true;
        else
            set valid=false;
        end if;
    -- If user does not exist, check if the admin has added him/her as an employee.
    elseif exists(select * from Employee where email=email_)
    then
        set @create_user = concat('create user ', substring_index(email_, '@', 1), '@localhost identified by \'', password_, '\';');
        call exec_query(@create_user);
        set valid=true;
    -- If the admin has not added the Employee, don't allow registration.
    else
        set valid=false;
    end if;
end; //

create procedure PatientRegistration(name_ varchar(45), password_ varchar(255), phone varchar(20), 
                                    email varchar(20), address_ varchar(20), sex varchar(20),
                                    medicalHistory varchar(300), marital bool, out registered bool
                                    )
begin
    if user_exists(email)
    then
        set registered=false;
    else
        set @create_user = concat('create user ', substring_index(email, '@', 1), '@localhost identified by ', PASSWORD(password_));
        call exec_query(@create_user);

        -- select @insert_user = concat('insert into Patient ')
        -- call exec_query(@insert_user);
        -- grant patient_role to email;
        set registered=true;
    end if;
end; //

delimiter ;

