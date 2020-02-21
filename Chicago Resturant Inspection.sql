DROP TABLE inspections
DROP TABLE licenses
DROP TABLE businessinfo
DROP TABLE owners
DROP TABLE yelp

select * from inspections;
Select * from licenses;
Select * from owners;
Select * from businessinfo;
Select * from yelp;

create table licenses (
	license_id int primary key,
	account_number int,
	license_code int,
	license_description Varchar,
	license_start_date date,
	lincese_end_date date,
	license_status Varchar
	
);

create table businessinfo (
	account_number int primary key,
	legal_name Varchar,
	business_name Varchar,
	address Varchar,
	city Varchar,
	state Varchar,
	zip_code int,
	latitude int,
	longitude int
);


CREATE TABLE inspections (
id INT PRIMARY KEY,
license_id Int,
DBA_name Varchar,
AKA_name Varchar,
risk TEXT,
inspection_date DATE,
inspection_type Varchar,
results Varchar,
violations Varchar
);


create table owners (
	account_number int,
	legal_name Varchar,
	owner_first_name Varchar,
	owner_last_name Varchar,
	title Varchar);
	

Create table yelp (
bus_id Varchar primary key,
dba_name Varchar,
license_id Int,
cust_rating float,
price_rating float,
foreign key (license_id) references licenses(license_id)
);


