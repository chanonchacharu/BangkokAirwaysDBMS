create database bangkokairways_final;

use bangkokairways_final;

create table passenger(
	PAX_ID int not null,
    FName varchar(250) not null,
    MName varchar(250),
    LName varchar(250) not null,
    Pgender char(1) not null,
    passport_num varchar(25) not null,
    DOB date not null,
    constraint primary key (PAX_ID),
    constraint Pgender check (Pgender in ('M','F'))
);

create table seat_type(
	SeatT_ID int not null,
    Sname varchar(100) not null,
    price int not null,
    constraint primary key (SeatT_ID)
);


create table membership_level(
	ML_ID int not null,
    mem_name varchar(20) not null,
    qualifying_point int not null,
    qualifying_sector int not null,
    validation_period int not null,
    constraint primary key (ML_ID)
);

create table airport(
	AIRPT_ID char(4) not null,
    IATA_Code char(3) not null,
    flightline_num int not null,
    city varchar(20) not null,
    country	varchar(20) not null,
    latitude varchar(30) not null,
    longitude	varchar(30) not null,
    elevation	float not null,
    runway_num	int not null,
    AIRPT_name	varchar(250) not null,
    constraint primary key (AIRPT_ID)
);

CREATE TABLE flight_schedule (
    FLTS_ID	int not null,
    FLTCode	char(20) not null,
    ScheduleDept_time datetime not null,
    ScheduleArr_time datetime not null, 
    FLT_date date not null,
    airline_name varchar(100) not null,
    terminal char(1) not null,
    checkin_counter	char(3) not null,
    status	varchar(30) not null,
    constraint primary key (FLTS_ID)
);

CREATE TABLE employee (
    EMP_ID	int not null,
    FName	varchar(250) not null,
    MName	varchar(250),
    LName	varchar(250) not null,
    title	varchar(100) not null,
    DOB 	date not null,
    Egender	char(1) not null,
    employment_date	date not null,
    phone_number	bigint,
    salary	bigint,
    SEMP_ID int,
    constraint primary key (EMP_ID),
    constraint supervisor_emp_id foreign key (SEMP_ID) references employee(EMP_ID),
    constraint Egender check (Egender in ('M','F'))
);


CREATE TABLE thai_passenger (
    TPAX_ID	int not null,
    national_ID	varchar(15) not null,
    constraint primary key (TPAX_ID, national_ID),
    constraint foreign key (TPAX_ID) references passenger(PAX_ID)
);

CREATE TABLE foreign_passenger (
    FPAX_ID	int not null,
    visa_number	varchar(15) not null,
    nationality	varchar(15) not null,
    constraint primary key (FPAX_ID, visa_number),
    constraint foreign key (FPAX_ID) references passenger(PAX_ID)
);

CREATE TABLE seat (
    Seat_ID int not null,
    row_num	char(10) not null,
    ST_ID	int not null,
    constraint primary key (Seat_ID, ST_ID),
    constraint foreign key (ST_ID) references seat_type(SeatT_ID)
);

CREATE TABLE contact_detail (
    CONT_ID	int not null,
    email	varchar(250) not null,
    pnum	char(10) not null,
    tnum	char(9),
    guardian	varchar(250) not null,
    g_relationship	varchar(50) not null,
    gnum	char(10) not null,
    CPAX_ID	int not null,
    constraint primary key (CONT_ID, CPAX_ID),
    constraint foreign key (CPAX_ID) references passenger(PAX_ID)
);

CREATE TABLE flyerbonus_membership (
    FLYER_ID int not null,
    passwd	varchar(100) not null,
    MEM_discount	int not null,
    preferred_lang	varchar(20) not null default 'Thai',
    ML_ID	int not null,
    FLPAX_ID	int not null,
    signup_date	date,
    constraint primary key (FLYER_ID, ML_ID, FLPAX_ID),
    constraint foreign key (ML_ID) references membership_level(ML_ID),
    constraint foreign key (FLPAX_ID) references passenger(PAX_ID)
);

CREATE TABLE payment (
    PYMT_ID	int not null,
    PYMT_datetime	datetime not null,
    PYMT_mode	varchar(20) not null,
    service_charge	int not null default 0,
    discount	int not null default 0,
    PPAX_ID	int not null,
    constraint primary key (PYMT_ID,PPAX_ID),
    constraint foreign key (PPAX_ID) references passenger(PAX_ID),
    constraint PYMT_mode check (PYMT_mode in ('ATM','Debit','Credit','counter','ibanking'))
);

create table network_planning(
	NEMP_ID	int not null,
    algorithm_level	varchar(20) not null,
    constraint primary key (NEMP_ID),
    constraint foreign key (NEMP_ID) references employee(EMP_ID),
    constraint algorithm_level check (algorithm_level in ('Novice','Moderate','Expert'))
);


CREATE TABLE route (
    R_ID		int not null,
    distance	int not null,
    route_type	varchar(30) not null,
    point		int not null,
    DEPT_AIRPT	char(4) not null,
    ARR_AIRPT	char(4) not null,
    N_EMP_ID	int not null,
    constraint primary key (R_ID),
    constraint foreign key (DEPT_AIRPT) references airport(AIRPT_ID),
    constraint foreign key (ARR_AIRPT) references airport(AIRPT_ID),
    constraint foreign key (N_EMP_ID) references employee(EMP_ID)
);

CREATE TABLE airplane (
    AIRP_ID	varchar(10) not null,
    company	varchar(100) not null,
    model	varchar(100) not null,
    max_capacity	int not null,
    num_class	int not null default 3,
    type	varchar(20) not null,
    manufacture_date	date not null,
    constraint primary key (AIRP_ID),
    constraint num_class check (num_class >= 1 and num_class <= 3)
);

CREATE TABLE airplane_can_land_airport(
    AIRP_ID	varchar(10) not null,
    AIRPT_ID char(4) not null,
    constraint primary key (AIRP_ID,AIRPT_ID),
    constraint foreign key (AIRP_ID) references airplane(AIRP_ID),
    constraint foreign key (AIRPT_ID) references airport(AIRPT_ID)
);

CREATE TABLE passenger_address (
    PAPAX_ID		int not null,
    PAX_AID		int not null,
    number		varchar(50) not null,
    street		varchar(50) not null,
    county		varchar(50) not null,
    city		varchar(50) not null,
    country		varchar(50) not null,
    zip_code	varchar(10) not null,
    constraint primary key (PAPAX_ID, PAX_AID),
    constraint foreign key (PAPAX_ID) references passenger(PAX_ID)
);

create index pass_address_id on passenger_address(PAX_AID);

CREATE TABLE employee_address (
    EEMP_ID		int not null,
    EMP_AID		int not null,
    number		varchar(50) not null,
    street		varchar(50) not null,
    county		varchar(50) not null,
    city		varchar(50) not null,
    country		varchar(50) not null,
    zip_code	varchar(10) not null,
    constraint primary key (EEMP_ID,EMP_AID),
    constraint foreign key (EEMP_ID) references employee(EMP_ID)
);

create index emp_address_id on employee_address(EMP_AID);

CREATE TABLE air_crew (
    AEMP_ID	int not null,
    weight	int not null,
    height	int not null,
    vision	varchar(20) not null,
    constraint primary key (AEMP_ID),
    constraint foreign key (AEMP_ID) references employee(EMP_ID)
);

CREATE TABLE cabin_crew (
    CEMP_ID	int not null,
    second_language	varchar(300) not null,
    constraint primary key (CEMP_ID),
    constraint foreign key (CEMP_ID) references air_crew(AEMP_ID)
);

CREATE TABLE maintenance_engineer (
    MEMP_ID	int not null,
    pratiotioner_license varchar(30),
    constraint primary key (MEMP_ID),
    constraint foreign key (MEMP_ID) references employee(EMP_ID)
);

CREATE TABLE pilot (
    PEMP_ID	int not null,
    year_of_experience	int not null,
    license	char(4) not null,
    english_certification int not null,
    constraint primary key (PEMP_ID),
    constraint foreign key (PEMP_ID) references air_crew(AEMP_ID)
);

CREATE TABLE cancellation (
    CXL_ID	int not null,
    penalty_fee	int not null,
    PYMT_ID	int not null,
    constraint primary key (CXL_ID,PYMT_ID),
    constraint foreign key (PYMT_ID) references payment(PYMT_ID)
);

CREATE TABLE cash_receipt (
    CASHR_ID	int not null,
    medium		varchar(20) not null,
    date		date not null,
    PYMT_ID		int not null,
    constraint primary key (CASHR_ID, PYMT_ID),
    constraint foreign key (PYMT_ID) references payment(PYMT_ID)
);

CREATE TABLE travel_insurance (
    TI_ID		int not null,
    issued_date	date not null,
    travel_num	int not null,
    exp_date 	int not null,
    dept_city	char(3) not null,
    dest_city	char(3) not null,
    trip_type	varchar(20) not null,
    coverage_amount	int not null,
    categories	varchar(200) not null,
    special_description	varchar(250),
    PYMT_ID	int not null,
    constraint primary key (TI_ID, PYMT_ID),
    constraint foreign key (PYMT_ID) references payment(PYMT_ID)
);

CREATE TABLE ticket (
    TCK_ID				int not null,
    reservation_date	date not null,
    PYMT_ID				int not null,
    Seat_ID				int not null,
    FLTS_ID				int not null,
    constraint primary key (TCK_ID),
    constraint foreign key (PYMT_ID) references payment(PYMT_ID),
    constraint foreign key (Seat_ID) references seat(Seat_ID),
    constraint foreign key (FLTS_ID) references flight_schedule(FLTS_ID)
);

CREATE TABLE airplane_operation_fs_route (
    FLTS_ID	int not null,
    R_ID	int not null,
    AIRP_ID	char(6) not null,
    constraint primary key (FLTS_ID, R_ID, AIRP_ID),
    constraint foreign key (FLTS_ID) references flight_schedule(FLTS_ID),
    constraint foreign key (R_ID) references route(R_ID),
    constraint foreign key (AIRP_ID) references airplane(AIRP_ID)
);

CREATE TABLE pilot_fly_flightsch (
    P_EMP_ID			int not null,
    FLTS_ID				int not null,
    cockpit_position 	varchar(20) not null,
    constraint primary key (P_EMP_ID, FLTS_ID),
    constraint foreign key (P_EMP_ID) references pilot(PEMP_ID),
    constraint foreign key (FLTS_ID) references flight_schedule(FLTS_ID),
    constraint cockpit_position check (cockpit_position in ('Captain','Co-pilot'))
);

CREATE TABLE maintenancee_check_airplane (
    M_EMP_ID	int not null,
    AIRP_ID		char(6) not null,
    constraint primary key (M_EMP_ID, AIRP_ID),
    constraint foreign key (M_EMP_ID) references maintenance_engineer(MEMP_ID),
    constraint foreign key (AIRP_ID) references airplane(AIRP_ID)
);

CREATE TABLE boarding_pass (
    BP_ID		int not null,
    dept_time	datetime not null,
    BP_time		datetime not null,
    TCK_ID		int not null,
    constraint primary key (BP_ID, TCK_ID),
    constraint foreign key (TCK_ID) references ticket(TCK_ID)
);

