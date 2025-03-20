using {medicalcare} from '../db/datamodel';

service MedicalCareService{

    entity ClinicSet as projection on medicalcare.Clinic; 

    entity ClinicBranchSet as projection on medicalcare.ClinicBranch;

    entity DoctorSet as projection on medicalcare.Doctor;

    entity PatientSet as projection on medicalcare.Patient;

    entity SpecialitySet as projection on medicalcare.Speciality;

    entity AppointmentSet as projection on medicalcare.Appointment;

    entity MedicalrecordSet as projection on medicalcare.Medicalrecord;


}