CREATE TABLE inspections (
id INT PRIMARY KEY,
license_NO Int,
DBA_name Varchar,
AKA_name Varchar,
risk INT,
inspection_date DATE,
inspection_type Varchar,
results Varchar,
violations Varchar
);
select * from inspections;

create table licenses (
	id int primary key,
	license_id int,
	account_number int,
	legal_name Varchar,
	business_name Varchar,
	address Varchar,
	city Varchar,
	state Varchar,
	zip_code int,
	license_code int,
	license_description Varchar,
	license_start_date date,
	lincese_end_date date,
	license_status Varchar,
	LATITUDE int,
	LONGITUDE int
);
Select * from licenses;
