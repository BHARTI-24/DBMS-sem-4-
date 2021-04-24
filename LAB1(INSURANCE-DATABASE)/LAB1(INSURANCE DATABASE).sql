show databases;
create database Insurance;
use Insurance;

-- table person (driver-id #: String, name: String, address: String)

create table  person(
Driver_id varchar(20),
name varchar(20),
address varchar(25)
);
desc person;
alter table person add primary key(Driver_id);


insert into person
values ('A01','richard','Srinivas nagar'),('A02','pradeep','Rajaji nagar'),('A03','smith','Ashok nagar'),
('A04','venu','NR colony'),('A05','jhon','Hanumanth nagar');
select * from person;

--  table car (Regno: String, model: String, year: int)



create table car (
Reg_no varchar(15) primary key,
model varchar(15),
year int);
desc car;


insert into car
values ('KA052250','Indica',1990),('KA031181','Lancer',1957),('KA095477','Toyota',1998),
('KA053408','Honda',2008),('KA041702','Audi',2005);
select * from car;


-- create table accident (report-number: int, date: date, location: String)
create table accident (
report_number int,
date date,  
location varchar(30)
);
alter table accident add primary key(report_number);
desc accident;

	 -- YYYY-MM-DD   DATE FORMAT
insert into accident values
(11,'2003-01-01','Mysore road'),(12,'2004-02-02','South end circle'),(13,'2003-01-21','Bull temple road')
,(14,'2008-02-17','Mysore road'),(15,'2005-03-05','Kanakpura road');
select * from accident;



-- create table owns  (driver-id #: String, Regno: String)
create table owns (
Driver_id varchar(20),
Reg_no varchar(15),
foreign key  (Driver_id) references person(Driver_id),
foreign key (Reg_no) references car(Reg_no)
);
desc owns;
insert into  owns values
('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),('A04','KA095477'),('A05','KA041702');
select * from owns;

-- create table participated (driver-id: String, Regno: String, report-number: int, damage-amount: int)
create table participated(
Driver_id varchar(20),
Reg_no varchar(15),
report_number int,
damage_amount int
);
alter table participated 
add foreign key (Driver_id) references person(Driver_id),
add foreign key (Reg_no) references car(Reg_no),
add foreign key(report_number) references accident(report_number);

desc participated;
insert into participated values
('A01','KA052250',11,10000),
('A02','KA053408',12,50000),
('A03','KA095477',13,25000),
('A04','KA031181',14,3000),
('A05','KA041702',15,5000);

select * from participated;


update participated 
set  damage_amount =25000
where report_number=12;