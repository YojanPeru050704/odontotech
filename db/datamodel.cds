using {    
    cuid
} from '@sap/cds/common';

namespace medicalcare;

entity Clinic {
    key ID              : UUID; 
    name                : String(250);
    status              : String(2);    
};

entity ClinicBranch {
    key ID              : UUID;   
    name                : String(250); 
    status              : String(2);
    province            : String(250);
    city                : String(250);
    address             : String(500);
    clinic              : Association to one Clinic;    
};

entity Patient {
    key ID              : UUID;
    code                : String(50);            
    firstName           : String(250);  
    lastName            : String(250);
    city                : String(250);
    address             : String(500);
    gender              : String(2);
    dateBirth           : DateTime;
    consultationReason  : String(4000);
    status              : String(2);
    clinicBranch        : Association to one ClinicBranch;
};

entity Doctor {
    key ID              : UUID;
    code                : String(50);            
    firstName           : String(250);
    lastName            : String(250);
    gender              : String(2);
    city                : String(250);
    address             : String(500);
    status              : String(2);
    clinic              : Association to one Clinic;
    speciality          : Composition of many Speciality2Doctor on speciality.doctor = $self;
};

entity Speciality2Doctor  {
    key ID              : UUID;
    speciality          : Association to Speciality;
    doctor              : Association to Doctor;
}

entity Speciality {
    key ID              : UUID;
    name                : String(250);
};


entity Medicalrecord {
    key ID              : UUID;
    description         : String(4000);
    creationDate        : DateTime;
    patient             : Association to one Patient;
    doctor              : Association to one Doctor;
    clinicBranch        : Association to one ClinicBranch;
}


entity Appointment {
    key ID              : UUID;
    date                : DateTime;    
    doctor              : Association to one Doctor;
    patient             : Association to one Patient;   
    clinicBranch        : Association to one ClinicBranch;
    status              : String(2);
    observation         : String;
}