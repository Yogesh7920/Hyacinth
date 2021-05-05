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
drop procedure if exists HospitalRecords;
drop procedure if exists AdminProfile;
drop procedure if exists PharmacyRecords;


delimiter //

create procedure exec_query(query_str varchar(255))
begin
    set @exec_cmd = query_str;
    prepare stmt from @exec_cmd;
    execute stmt;
    deallocate prepare stmt;
end; //

create procedure EmployeeRegistration(in email_ varchar(20), in password_ varchar(255), out role varchar(11), out id int)
begin
    -- If user exists, then check password
    if user_exists(email_)
    then
        set @password = (select password from Employee where email=email_);
        if (password(password_)=@password) then
            set role=employee_role(email_);
            set id = (select id from Employee where email=email_);
        else
            set role='None';
            set id = -1;
        end if;
    -- If user does not exist, check if the admin has added him/her as an employee.
    elseif exists(select * from Employee where email=email_)
    then
        set @create_user = concat('create user \'', substring_index(email_, '@', 1), '\'@\'localhost\' identified by \'', password_, '\';');
        call exec_query(@create_user);
        set role=employee_role(email_);
        set id = (select id from Employee where email=email_);
    -- If the admin has not added the Employee, don't allow registration.
    else
        set role='None';
        set id = -1;
    end if;
end; //

create procedure PatientRegistration(name_ varchar(45), email_ varchar(20), password_ varchar(255),
                                    phone varchar(20), address_ varchar(20), sex varchar(20),
                                    medicalHistory varchar(300), marital bool, out id int
                                    )
begin
    if user_exists(email_)
    then
        set id=-1;
    else
        set @email = substring_index(email_, '@', 1);
        set @create_user = concat('create user \'', @email, '\'@\'localhost\' identified by \'', password_, '\';');
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
        select @insert_user;
        call exec_query(@insert_user);
#         grant patient_role to @email; # TODO: Error because of this !.
        set id = (select id from Patient where email=email_);
    end if;
end; //


create procedure PatientLogin(in email_ varchar(20), in password_ varchar(255), out id int)
begin
    if user_exists(email_)
    then
        set @password = (select password from patient where email=email_);
        if (password(password_)=@password) then
            set id = (select id from patient where email=email_);
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

create procedure addNurse(name varchar(45), password varchar(256),
 phone varchar(45), email varchar(45), address varchar(45), sex varchar(45), salary varchar(45))
 begin

 end //
delimiter ;

