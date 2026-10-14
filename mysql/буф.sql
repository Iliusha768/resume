create database buf;
use buf;



create table prodoct (
id_produnct int primary key,
name_product varchar(45),
cost int,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
); 


create table group_student (
id_group int primary key,
specializtion varchar(45),
number_group varchar(45),
curs int,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);


create table students (
id_student int primary key,
name_stundent varchar(45),
surname varchar(45),
group_student_id int,
foreign key (group_student_id) references group_student(id_group),
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);


create table `order` (
id_order int primary key,
student_id int,
foreign key (student_id) references students(id_student),
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);


create table sostav (
id_sostav int primary key,
product_id int,
order_id int,
foreign key (product_id) references prodoct(id_produnct),
foreign key (order_id) references `order`(id_order),
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE,
  price int
);

insert into group_student (id_group,specializtion,number_group,curs,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) values
(1,'программист','0907-42',1,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(2,'экономист','0907-43',1,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(3,'юрист','0907-47',1,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE);

insert into students (id_student,name_stundent,surname,group_student_id,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) values
(1,'артем','яковлев',1,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(2,'степа','фомин',2,'2026-01-01 12:00:00','admin','2026-01-01 13:00:00','admin',TRUE),
(3,'наиля','янузакова',3,'2026-01-01 11:00:00','admin','2026-01-01 17:00:00','admin',TRUE);




insert into prodoct (id_produnct,name_product,cost,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) values
(1,'яблоко',100,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(2,'банан',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(3,'апельсин',300,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(4,'гречка',100,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(5,'манка',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(6,'рис',100,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(7,'курица',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(8,'горошек',100,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(9,'хлеб',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(10,'булка',100,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(11,'пепси',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE),
(12,'кокакола',150,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(13,'7up',200,'2026-01-01 11:11:00','admin','2026-01-01 15:00:00','admin',TRUE);


insert into `order` (id_order,student_id,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) values
(1,1,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(2,2,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(3,3,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE);

insert into sostav (id_sostav,product_id,order_id,price,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) values
(1,2,1,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(2,3,1,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(3,5,1,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),

(4,8,2,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(5,11,2,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),

(6,13,3,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(7,11,3,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(8,5,3,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE),
(9,6,3,200,'2026-01-01 10:00:00','admin','2026-01-01 15:00:00','admin',TRUE);

select sum(price) from sostav
where order_id = 1;
select sum(price) from sostav
where order_id = 2;
select sum(price) from sostav
where order_id = 3;
select id_student from students
where group_student_id = 1;
select id_student from students
where group_student_id = 2;
select id_student from students
where group_student_id = 3;


select min(cost) from prodoct;
select max(cost) from prodoct;

select avg(cost) from prodoct;
