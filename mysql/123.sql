CREATE DATABASE fitness;
USE fitness;

CREATE TABLE subscription (
  id_subscription INT primary key,
  name VARCHAR(45),
  milking VARCHAR(45),
  price INT,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE table_(
  id_table INT primary key,
  date_and_time DATETIME,
  type VARCHAR(45),
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);



CREATE TABLE equipment (
  id_equipment INT primary key,
  model VARCHAR(45),
  state VARCHAR(45),
  name VARCHAR(45),
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE class (
  id_class INT primary key,
  milking VARCHAR(45),
  name VARCHAR(45),
  date_and_time DATETIME,
  table_id_table INT,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE,
  foreign key (table_id_table)
  REFERENCES table_(id_table)
);

CREATE TABLE clients (
  id_clients INT primary key,
  surname VARCHAR(45),
  name_ VARCHAR(45),
  patronymic VARCHAR(45),
  gender VARCHAR(45),
  number_ INT NULL,
  subscription_id_subscription INT,
  class_id_class INT,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (subscription_id_subscription) REFERENCES subscription(id_subscription),
  FOREIGN KEY (class_id_class) REFERENCES class(id_class)
);

CREATE TABLE distribution_of_specialities (
  id_distribution_of_specialities INT primary key,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE trainer (
  id_trainer INT primary key,
  surname VARCHAR(45),
  name_ VARCHAR(45),
  patronymic VARCHAR(45),
  nationality VARCHAR(45),
  gender VARCHAR(45),
  date_of_birth DATETIME,
  number_ INT,
  clients_id_clients INT,
  class_id_class INT,
  distribution_of_specialities_id_distribution_of_specialities INT,
  CreatedAt DATETIME,
  CreatedBy VARCHAR(50),
  UpdatedAt DATETIME,
  UpdatedBy VARCHAR(50),
  IsActive BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (clients_id_clients) REFERENCES clients(id_clients),
  FOREIGN KEY (class_id_class) REFERENCES class(id_class),
  FOREIGN KEY (distribution_of_specialities_id_distribution_of_specialities) 
    REFERENCES distribution_of_specialities(id_distribution_of_specialities)
);

INSERT INTO subscription (id_subscription,name,milking,price,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'Базовый','1 месяц',3000,'2026-01-01 10:00:00','admin','2026-01-01 10:00:00','admin',TRUE),
(2,'Стандарт','3 месяца',8000,'2026-01-02 11:00:00','admin','2026-01-02 11:00:00','admin',TRUE),
(3,'Премиум','6 месяцев',15000,'2026-01-03 12:00:00','admin','2026-01-03 12:00:00','admin',TRUE),
(4,'VIP','12 месяцев',25000,'2026-01-04 13:00:00','admin','2026-01-04 13:00:00','admin',TRUE),
(5,'Студенческий','1 месяц',2500,'2026-01-05 14:00:00','admin','2026-01-05 14:00:00','admin',TRUE),
(6,'Утренний','3 месяца',7000,'2026-01-06 15:00:00','admin','2026-01-06 15:00:00','admin',TRUE),
(7,'Вечерний','3 месяца',7500,'2026-01-07 16:00:00','admin','2026-01-07 16:00:00','admin',TRUE),
(8,'Выходной','1 месяц',2000,'2026-01-08 17:00:00','admin','2026-01-08 17:00:00','admin',TRUE),
(9,'Семейный','6 месяцев',26000,'2026-01-09 18:00:00','admin','2026-01-09 18:00:00','admin',TRUE),
(10,'Пробный','7 дней',500,'2026-01-10 19:00:00','admin','2026-01-10 19:00:00','admin',TRUE);


INSERT INTO table_ (id_table,date_and_time,type,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'2026-02-01 09:00:00','Тренажёрный зал','2026-01-20 10:00:00','admin','2026-01-20 10:00:00','admin',TRUE),
(2,'2026-02-01 10:00:00','Кардио-зона','2026-01-20 10:10:00','admin','2026-01-20 10:10:00','admin',TRUE),
(3,'2026-02-01 11:00:00','Бассейн','2026-01-20 10:20:00','admin','2026-01-20 10:20:00','admin',TRUE),
(4,'2026-02-01 12:00:00','Зал йоги','2026-01-20 10:30:00','admin','2026-01-20 10:30:00','admin',TRUE),
(5,'2026-02-01 13:00:00','Зал сайкла','2026-01-20 10:40:00','admin','2026-01-20 10:40:00','admin',TRUE),
(6,'2026-02-01 14:00:00','Бокс','2026-01-20 10:50:00','admin','2026-01-20 10:50:00','admin',TRUE),
(7,'2026-02-01 15:00:00','Кроссфит','2026-01-20 11:00:00','admin','2026-01-20 11:00:00','admin',TRUE),
(8,'2026-02-01 16:00:00','Пилатес','2026-01-20 11:10:00','admin','2026-01-20 11:10:00','admin',TRUE),
(9,'2026-02-01 17:00:00','Танцы','2026-01-20 11:20:00','admin','2026-01-20 11:20:00','admin',TRUE),
(10,'2026-02-01 18:00:00','Растяжка','2026-01-20 11:30:00','admin','2026-01-20 11:30:00','admin',TRUE);


INSERT INTO equipment (id_equipment,model,state,name,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'TM-100','Работает','Беговая дорожка','2026-01-05 09:00:00','admin','2026-01-05 09:00:00','admin',TRUE),
(2,'EB-200','Работает','Велотренажёр','2026-01-05 09:05:00','admin','2026-01-05 09:05:00','admin',TRUE),
(3,'EL-300','Работает','Эллиптический тренажёр','2026-01-05 09:10:00','admin','2026-01-05 09:10:00','admin',TRUE),
(4,'RM-400','Работает','Гребной тренажёр','2026-01-05 09:15:00','admin','2026-01-05 09:15:00','admin',TRUE),
(5,'BP-500','Работает','Скамья для жима','2026-01-05 09:20:00','admin','2026-01-05 09:20:00','admin',TRUE),
(6,'SQ-600','Работает','Рама для приседаний','2026-01-05 09:25:00','admin','2026-01-05 09:25:00','admin',TRUE),
(7,'MP-700','На обслуживании','Мультистанция','2026-01-05 09:30:00','admin','2026-01-05 09:30:00','admin',TRUE),
(8,'DB-800','Работает','Гантели','2026-01-05 09:35:00','admin','2026-01-05 09:35:00','admin',TRUE),
(9,'KB-900','Работает','Гири','2026-01-05 09:40:00','admin','2026-01-05 09:40:00','admin',TRUE),
(10,'SM-1000','Не работает','Смит-машина','2026-01-05 09:45:00','admin','2026-01-05 09:45:00','admin',FALSE);


INSERT INTO class (id_class,milking,name,date_and_time,table_id_table,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'60 минут','Йога утренняя','2026-02-02 08:00:00',4,'2026-01-25 10:00:00','admin','2026-01-25 10:00:00','admin',TRUE),
(2,'60 минут','Йога вечерняя','2026-02-02 19:00:00',4,'2026-01-25 10:10:00','admin','2026-01-25 10:10:00','admin',TRUE),
(3,'45 минут','Сайкл','2026-02-02 18:00:00',5,'2026-01-25 10:20:00','admin','2026-01-25 10:20:00','admin',TRUE),
(4,'60 минут','Кроссфит','2026-02-02 17:00:00',7,'2026-01-25 10:30:00','admin','2026-01-25 10:30:00','admin',TRUE),
(5,'45 минут','Пилатес','2026-02-02 09:00:00',8,'2026-01-25 10:40:00','admin','2026-01-25 10:40:00','admin',TRUE),
(6,'60 минут','Танцы','2026-02-02 20:00:00',9,'2026-01-25 10:50:00','admin','2026-01-25 10:50:00','admin',TRUE),
(7,'90 минут','Силовая тренировка','2026-02-02 16:00:00',1,'2026-01-25 11:00:00','admin','2026-01-25 11:00:00','admin',TRUE),
(8,'60 минут','Бокс групповой','2026-02-02 15:00:00',6,'2026-01-25 11:10:00','admin','2026-01-25 11:10:00','admin',TRUE),
(9,'45 минут','Стретчинг','2026-02-02 14:00:00',10,'2026-01-25 11:20:00','admin','2026-01-25 11:20:00','admin',TRUE),
(10,'30 минут','Экспресс-тренировка','2026-02-02 13:00:00',1,'2026-01-25 11:30:00','admin','2026-01-25 11:30:00','admin',TRUE);

INSERT INTO clients (id_clients,surname,name_,patronymic,gender,number_,subscription_id_subscription,class_id_class,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'Иванов','Иван','Иванович','М',8234,1,1,'2026-01-15 09:00:00','admin','2026-01-15 09:00:00','admin',TRUE),
(2,'Петров','Пётр','Петрович','М',8234,2,3,'2026-01-15 09:05:00','admin','2026-01-15 09:05:00','admin',TRUE),
(3,'Сидорова','Анна','Сергеевна','Ж',8234,3,2,'2026-01-15 09:10:00','admin','2026-01-15 09:10:00','admin',TRUE),
(4,'Кузнецов','Алексей','Игоревич','М',8234,4,4,'2026-01-15 09:15:00','admin','2026-01-15 09:15:00','admin',TRUE),
(5,'Соколова','Мария','Андреевна','Ж',8234,5,5,'2026-01-15 09:20:00','admin','2026-01-15 09:20:00','admin',TRUE),
(6,'Новикова','Елена','Павловна','Ж',8234,6,6,'2026-01-15 09:25:00','admin','2026-01-15 09:25:00','admin',TRUE),
(7,'Морозов','Дмитрий','Олегович','М',8234,7,7,'2026-01-15 09:30:00','admin','2026-01-15 09:30:00','admin',TRUE),
(8,'Фёдорова','Ольга','Викторовна','Ж',8234,8,8,'2026-01-15 09:35:00','admin','2026-01-15 09:35:00','admin',TRUE),
(9,'Орлов','Сергей','Николаевич','М',8234,9,9,'2026-01-15 09:40:00','admin','2026-01-15 09:40:00','admin',TRUE),
(10,'Васильев','Игорь','Романович','М',8234,10,10,'2026-01-15 09:45:00','admin','2026-01-15 09:45:00','admin',TRUE);


INSERT INTO distribution_of_specialities (id_distribution_of_specialities,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'2026-01-10 10:00:00','admin','2026-01-10 10:00:00','admin',TRUE),
(2,'2026-01-10 10:05:00','admin','2026-01-10 10:05:00','admin',TRUE),
(3,'2026-01-10 10:10:00','admin','2026-01-10 10:10:00','admin',TRUE),
(4,'2026-01-10 10:15:00','admin','2026-01-10 10:15:00','admin',TRUE),
(5,'2026-01-10 10:20:00','admin','2026-01-10 10:20:00','admin',TRUE),
(6,'2026-01-10 10:25:00','admin','2026-01-10 10:25:00','admin',TRUE),
(7,'2026-01-10 10:30:00','admin','2026-01-10 10:30:00','admin',TRUE),
(8,'2026-01-10 10:35:00','admin','2026-01-10 10:35:00','admin',TRUE),
(9,'2026-01-10 10:40:00','admin','2026-01-10 10:40:00','admin',TRUE),
(10,'2026-01-10 10:45:00','admin','2026-01-10 10:45:00','admin',TRUE);

INSERT INTO trainer (id_trainer,surname,name_,patronymic,nationality,gender,date_of_birth,number_,clients_id_clients,class_id_class,distribution_of_specialities_id_distribution_of_specialities,CreatedAt,CreatedBy,UpdatedAt,UpdatedBy,IsActive) VALUES
(1,'Смирнов','Александр','Петрович','Россия','М','1990-03-10',111,1,1,1,'2026-01-12 10:00:00','admin','2026-01-12 10:00:00','admin',TRUE),
(2,'Егорова','Татьяна','Игоревна','Россия','Ж','1988-07-21',111,2,3,2,'2026-01-12 10:05:00','admin','2026-01-12 10:05:00','admin',TRUE),
(3,'Ким','Владимир','Олегович','Россия','М','1985-11-02',111,3,2,3,'2026-01-12 10:10:00','admin','2026-01-12 10:10:00','admin',TRUE),
(4,'Лебедева','Екатерина','Сергеевна','Россия','Ж','1992-01-15',111,4,4,4,'2026-01-12 10:15:00','admin','2026-01-12 10:15:00','admin',TRUE),
(5,'Алиев','Рустам','Рашидович','Азербайджан','М','1987-05-09',111,5,5,5,'2026-01-12 10:20:00','admin','2026-01-12 10:20:00','admin',TRUE),
(6,'Ковалёва','Наталья','Алексеевна','Россия','Ж','1991-09-18',111,6,6,6,'2026-01-12 10:25:00','admin','2026-01-12 10:25:00','admin',TRUE),
(7,'Михайлов','Игорь','Владимирович','Россия','М','1984-04-30',111,7,7,7,'2026-01-12 10:30:00','admin','2026-01-12 10:30:00','admin',TRUE),
(8,'Попова','Оксана','Романовна','Россия','Ж','1993-06-11',111,8,8,8,'2026-01-12 10:35:00','admin','2026-01-12 10:35:00','admin',TRUE),
(9,'Ахмедов','Самир','Ильханович','Узбекистан','М','1986-12-03',111,9,9,9,'2026-01-12 10:40:00','admin','2026-01-12 10:40:00','admin',TRUE),
(10,'Зайцева','Ирина','Михайловна','Россия','Ж','1989-08-25',111,10,10,10,'2026-01-12 10:45:00','admin','2026-01-12 10:45:00','admin',TRUE);


SELECT * FROM subscription;
SELECT * FROM table_;
SELECT * FROM equipment; 
SELECT * FROM class;
SELECT * FROM clients;
SELECT * FROM distribution_of_specialities;
SELECT * FROM trainer;

drop user 'administrator'@'localhost';
drop user 'contributor'@'localhost';
drop user 'trainer'@'localhost';


create user 'administrator'@'localhost' identified by '1234';
create user 'contributor'@'localhost' identified by '1234';
create user 'trainer'@'localhost' identified by '1234';


grant all privileges on fitness.* to 'administrator'@'localhost';
grant select, insert, delete on fitness.class to 'trainer'@'localhost';
grant select, insert, delete on fitness.trainer to 'trainer'@'localhost';
grant select on fitness.table_ to 'contributor'@'localhost';

flush privileges;

create table subscription_change_log (
log_id int primary key,
subscription_id int,
old_price int,
old_milking varchar(45),
new_price int,
new_milking varchar(45)
);

delimiter //
create trigger update_trigger
after update on subscription
for each row
begin
	if not(NEW.price <=> OLD.price and NEW.milking <=> OLD.milking) then
    insert into subscription_change_log (subscription_id,old_price, old_milking, new_price, new_milking, changed_at)
    values (NEW.subscription_id, OLD.price, OLD.milking, NEW.price, NEW.milking, NOW());
    END if;
END//

select * from subscription_change_log