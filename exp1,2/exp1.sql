#creating darabase

create database EPharm;
#using databse
use EPharm;

#creating tables
create table pharmacy
	(phid int not null primary key, phname varchar(20) not null, contact int not null, address varchar(30) not null);
create table manufacturer
	(mid int not null primary key, mname varchar(20) not null, contact int not null);
create table contract
	(mid int not null, phid int not null, period int not null, primary key(mid,phid), foreign key(mid) references manufacturer(mid), foreign key(phid) references pharmacy(phid));
create table drugs
	(drugid int not null primary key, drugname varchar(20) not null, mid int not null, potency int not null, price float not null, foreign key(mid) references manufacturer(mid));
create table patient
	(pid int primary key, pname varchar(20) not null, sex char not null, contact int not null, age int not null);
create table doctor
	(drid int primary key, drname varchar(20) not null, specialization varchar(20) not null);
create table prescription
	(prid int not null, drugid int not null, pid int not null, drid int not null, primary key(prid,drugid), foreign key(drugid) references drugs(drugid), foreign key(pid) references patient(pid), foreign key(drid) references doctor(drid));
create table bill
	(bid int primary key, prid int not null, phid int not null, total int not null);

#altering table
alter table drugs drop column potency;
alter table drugs add column potency char;
alter table drugs modify column potency int not null;
alter table patient modify column sex enum('F','M') not null ;
alter table prescription add column quantity int not null;
alter table prescription add column price int default 0;

