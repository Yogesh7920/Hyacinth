use Hyacinth;

drop procedure if exists exec_query;
drop procedure if exists EmployeeRegistration;
drop procedure if exists PatientRegistration;
drop procedure if exists NurseProfile;
drop procedure if exists DiagnosticsHistory;
drop procedure if exists DoctorProfile;
drop procedure if exists PatientRecords;
drop procedure if exists DriverProfile;
drop procedure if exists DriveRecords;
drop procedure if exists PatientProfile;
drop procedure if exists PatientLogin;
drop procedure if exists HospitalRecords;
drop procedure if exists AdminProfile;
drop procedure if exists PharmacyRecords;
drop procedure if exists addNurse;
drop procedure if exists addDoctor;
drop procedure if exists addDriver;


delimiter //

create procedure exec_query(query_str varchar(255))
begin
    set @exec_cmd = query_str;
    prepare stmt from @exec_cmd;
    execute stmt;
    deallocate prepare stmt;
end; //

create procedure EmployeeRegistration(in email_ varchar(255), in password_ varchar(255), out role varchar(11), out id int)
begin
    -- If user exists, then check password
    if user_exists(email_)
    then
        set @password = (select password from Employee where email=email_);
        if (PASSWORD(password_)=@password) then
            set role=employee_role(email_);
            set id = (select employeeID from Employee where email=email_);
        else
            set role='None';
            set id = -1;
        end if;
    -- If user does not exist, check if the admin has added him/her as an employee.
    elseif exists(select * from Employee where email=email_)
    then
        set @create_user = concat('create user \'', substring_index(email_, '@', 1), '\'@\'localhost\' identified by \'', password_, '\';');
        call exec_query(@create_user);
        set @update_user = concat('update Employee set password=\'', PASSWORD(password_), '\' where email=\'', email_, '\'');
        call exec_query(@update_user);
        set role=employee_role(email_);
        set id = (select employeeID from Employee where email=email_);
    -- If the admin has not added the Employee, don't allow registration.
    else
        set role='None';
        set id = -1;
    end if;
end; //

create procedure PatientRegistration(name_ varchar(45), email_ varchar(255), password_ varchar(255),
                                    phone varchar(20), address_ varchar(255), sex varchar(20),
                                    medicalHistory varchar(255), marital bool, out id int
                                    )
begin
    if user_exists(email_)
    then
        set id=-1;
    else
        set @email = substring_index(email_, '@', 1);
        select @email;
        set @create_user = concat('create user \'', @email, '\'@\'localhost\' identified by \'', password_, '\';');
        select @create_user;
        call exec_query(@create_user);
        set @insert_user = concat(
            'insert into Patient set',
            ' name = \'', name_, '\'',
            ', email = \'', email_, '\'',
            ', phone = \'', phone, '\'',
            ', password = \'', PASSWORD(password_), '\'',
            ', address = \'', address_, '\'',
            ', sex = \'', sex, '\'',
            ', medicalHistory = \'', medicalHistory, '\'',
            ', marital = ', marital
        );
        call exec_query(@insert_user);
        set id = (select patientID from Patient where email=email_);
    end if;
end; //


create procedure PatientLogin(in email_ varchar(255), in password_ varchar(255), out id int)
begin
    if user_exists(email_)
    then
        set @password = (select password from Patient where email=email_);
        if (password(password_)=@password) then
            set id = (select patientID from Patient where email=email_);
        else
            set id = -1;
        end if;
    else
        set id = -1;
    end if;
end //

create procedure NurseProfile(ID int(11))
begin
    select * from NurseInfo where nurseID = ID;    
end; //

create procedure DiagnosticsHistory(ID int(11))
begin
    select * from NurseDiagnosticsInfo where nurseID = ID;
end; //

create procedure DoctorProfile(ID int(11))
begin
    select * from DoctorInfo where doctorID = ID;    
end; //

create procedure PatientRecords (ID int(11))
begin
    select * from DoctorPatientInfo where doctorID = ID;    
end; //

create procedure DriverProfile(ID int(11))
begin
    select * from DriverInfo where driverID = ID;    
end; //

create procedure DriveRecords (ID int(11))
begin
    select * from DriverJourneyInfo where driverID = ID;    
end; //

create procedure PatientProfile(ID int(11))
begin
    select * from PatientInfo where patientID = ID;    
end; //

create procedure HospitalRecords(ID int(11))
begin
    select * from PatientDoctorInfo where patientID = ID;    
end; //

create procedure AdminProfile(ID int(11))
begin
    select * from AdminInfo where adminID = ID;    
end; //

create procedure PharmacyRecords (drug varchar(45))
begin
    select * from VendorDrugInfo where drugName = drug;    
end; //

create procedure addNurse(name_ varchar(45), password_ varchar(256), phone_ varchar(45),
                    email_ varchar(45), address_ varchar(45), sex_ varchar(45),
                    salary_ varchar(45), qualification_ varchar(50), license_ varchar(50), out id int)
 begin
    insert into Employee (name, password, phone, email, address, sex, salary)
    values (name_, password_, phone_, email_, address_, sex_, salary_);
    set id = last_insert_id();
    insert into Nurse (nurseID, qualification, license)
    values (id, qualification_, license_);
 end //

create procedure addDoctor(name_ varchar(45), password_ varchar(256), phone_ varchar(45),
                          email_ varchar(45), address_ varchar(45), sex_ varchar(45),
                          salary_ varchar(45), qualification_ varchar(50), license_ varchar(50),
                           bio_ varchar(255), available_ bool, specialization_ varchar(255), id int)
begin
    insert into Employee (name, password, phone, email, address, sex, salary)
    values (name_, password_, phone_, email_, address_, sex_, salary_);
    set id = last_insert_id();
    insert into Doctor (doctorID, qualification, license, bio, available, specialization)
    values (id, qualification_, license_, bio_, available_, specialization_);
end //

create procedure addDriver(name_ varchar(45), password_ varchar(256), phone_ varchar(45),
                           email_ varchar(45), address_ varchar(45), sex_ varchar(45),
                           salary_ varchar(45), experience_ varchar(50), license_ varchar(50),
                           successRate_ varchar(255), id int)
begin
    insert into Employee (name, password, phone, email, address, sex, salary)
    values (name_, password_, phone_, email_, address_, sex_, salary_);
    set id = last_insert_id();
    insert into Driver (experience, licenseNo, successRate)
    values (experience_, licenseNo, successRate_);
end //

delimiter ;

