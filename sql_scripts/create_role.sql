use Hyacinth;

drop role if exists patient_role;

create role patient_role;
grant select on Consultation to patient_role;
grant select on DoctorInfo to patient_role;
grant select on Appointment to patient_role;
grant select on Invoice to patient_role;
grant select on Prescription to patient_role;
grant select on Drugs to patient_role;
grant select on Pharmacy to patient_role;
grant select on Contains to patient_role;
grant select on Diagnostics to patient_role;
grant select on Assists to patient_role;
grant select on NurseInfo to patient_role;


