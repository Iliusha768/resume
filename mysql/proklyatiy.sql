
CREATE database mydb;
USE mydb;


-- Table храм

CREATE TABLE IF NOT EXISTS храм (
  id_храм INT NOT NULL,
  название VARCHAR(45),
  адрес VARCHAR(45),
  описание VARCHAR(45),
  дата_основания DATE NULL,
  PRIMARY KEY (id_храм));




-- Table статус_духа

CREATE TABLE IF NOT EXISTS статус_духа (
  id_статус_духа INT NOT NULL,
  название_статуса VARCHAR(45),
  PRIMARY KEY (id_статус_духа));




-- Table дух

CREATE TABLE IF NOT EXISTS дух (
  id_дух INT NOT NULL,
  имя VARCHAR(45),
  фамилия VARCHAR(45),
  имя_при_жизни VARCHAR(45),
  дата_смерти DATE NULL,
  дата_прибытия DATE NULL,
  примечание VARCHAR(100) NULL,
  храм_id_храм INT NOT NULL,
  статус_духа_id_статус_духа INT NOT NULL,
  PRIMARY KEY (id_дух),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм),
    FOREIGN KEY (статус_духа_id_статус_духа)
    REFERENCES статус_духа (id_статус_духа)
    
    );




-- Table роль_сотрудника

CREATE TABLE IF NOT EXISTS роль_сотрудника (
  id_роль_сотрудника INT NOT NULL,
  название_роли VARCHAR(45),
  PRIMARY KEY (id_роль_сотрудника));




-- Table отдел

CREATE TABLE IF NOT EXISTS отдел (
  id_отдел INT NOT NULL,
  название VARCHAR(45),
  описание VARCHAR(45),
  старший_работник_код INT NULL,
  храм_id_храм INT NOT NULL,
  PRIMARY KEY (id_отдел),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм)
    
    );




-- Table работник

CREATE TABLE IF NOT EXISTS работник (
  id_работник INT NOT NULL,
  имя VARCHAR(45),
  фамилия VARCHAR(45),
  телефон VARCHAR(45),
  дата_найма DATE NULL,
  активен VARCHAR(45),
  храм_id_храм INT NOT NULL,
  роль_сотрудника_id_роль_сотрудника INT NOT NULL,
  отдел_id_отдел INT NOT NULL,
  PRIMARY KEY (id_работник),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм),
    FOREIGN KEY (роль_сотрудника_id_роль_сотрудника)
    REFERENCES роль_сотрудника (id_роль_сотрудника),
    FOREIGN KEY (отдел_id_отдел)
    REFERENCES отдел (id_отдел)
    
    );




-- Table тип_служения

CREATE TABLE IF NOT EXISTS тип_служения (
  id_тип_служения INT NOT NULL,
  название_служения VARCHAR(45),
  PRIMARY KEY (id_тип_служения));




-- Table служение

CREATE TABLE IF NOT EXISTS служение (
  id_служение INT NOT NULL,
  название VARCHAR(45),
  дата_и_время varchar(45) NOT NULL,
  статус VARCHAR(45),
  храм_id_храм INT NOT NULL,
  тип_служения_id_тип_служения INT NOT NULL,
  PRIMARY KEY (id_служение),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм),
    FOREIGN KEY (тип_служения_id_тип_служения)
    REFERENCES тип_служения (id_тип_служения)
    
    );




-- Table тип_ритуала

CREATE TABLE IF NOT EXISTS тип_ритуала (
  id_тип_ритуала INT NOT NULL,
  название_типа VARCHAR(45),
  PRIMARY KEY (id_тип_ритуала));




-- Table ритуал

CREATE TABLE IF NOT EXISTS ритуал (
  id_ритуал INT NOT NULL,
  название_ритуала VARCHAR(45),
  dlitelnost_rituala VARCHAR(45),
  описание VARCHAR(45),
  тип_ритуала_id_тип_ритуала INT NOT NULL,
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_ритуал),
    FOREIGN KEY (тип_ритуала_id_тип_ритуала)
    REFERENCES тип_ритуала (id_тип_ритуала),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table расписание

CREATE TABLE IF NOT EXISTS расписание (
  id_расписание INT NOT NULL,
  время_начала VARCHAR(45),
  время_окончания VARCHAR(45),
  правило_повтора VARCHAR(45),
  храм_id_храм INT NOT NULL,
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_расписание),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table служение_при_отделе

CREATE TABLE IF NOT EXISTS служение_при_отделе (
  id_служение_отдела INT NOT NULL,
  название VARCHAR(45),
  цель VARCHAR(45),
  отдел_id_отдел INT NOT NULL,
  PRIMARY KEY (id_служение_отдела),
    FOREIGN KEY (отдел_id_отдел)
    REFERENCES отдел (id_отдел)
    
    );




-- Table участие_в_служении

CREATE TABLE IF NOT EXISTS участие_в_служении (
  id_участник INT NOT NULL,
  дата_вступления DATE NULL,
  основной VARCHAR(45),
  служение_при_отделе_id_служение_отдела INT NOT NULL,
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_участник),
    FOREIGN KEY (служение_при_отделе_id_служение_отдела)
    REFERENCES служение_при_отделе (id_служение_отдела),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table участник_служения_отдела

CREATE TABLE IF NOT EXISTS участник_служения_отдела (
  id_участник INT NOT NULL,
  дата_вступления DATE NULL,
  основной VARCHAR(45),
  PRIMARY KEY (id_участник));




-- Table должность

CREATE TABLE IF NOT EXISTS должность (
  id_должность INT NOT NULL,
  название_должности VARCHAR(45),
  PRIMARY KEY (id_должность));




-- Table помещение

CREATE TABLE IF NOT EXISTS помещение (
  id_помещение INT NOT NULL,
  название VARCHAR(45),
  этаж INT NULL,
  вместимость INT NULL,
  храм_id_храм INT NOT NULL,
  PRIMARY KEY (id_помещение),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм)
    
    );




-- Table тип_помещения

CREATE TABLE IF NOT EXISTS тип_помещения (
  id_тип_помещения INT NOT NULL,
  название_типа VARCHAR(45),
  PRIMARY KEY (id_тип_помещения));




-- Table оборудование

CREATE TABLE IF NOT EXISTS оборудование (
  id_оборудование INT NOT NULL,
  название_оборудования VARCHAR(45),
  количество INT NULL,
  состояние VARCHAR(45),
  PRIMARY KEY (id_оборудование));




-- Table просьба

CREATE TABLE IF NOT EXISTS просьба (
  id_просьба INT NOT NULL,
  статус VARCHAR(45),
  тип_просьбы VARCHAR(45),
  содержание VARCHAR(45),
  дата_создания VARCHAR(45),
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_просьба),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table исповедь

CREATE TABLE IF NOT EXISTS исповедь (
  id_исповедь INT NOT NULL,
  текст_исповеди VARCHAR(45),
  дата_исповеди varchar(45),
  дух_id_дух INT NOT NULL,
  PRIMARY KEY (id_исповедь),
    FOREIGN KEY (дух_id_дух)
    REFERENCES дух (id_дух)
    
    );




-- Table подношение

CREATE TABLE IF NOT EXISTS подношение (
  id_подношение INT NOT NULL,
  тип_подношения VARCHAR(45),
  сумма INT NULL,
  дата_подношения VARCHAR(45),
  примечание VARCHAR(45),
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_подношение),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table благословение

CREATE TABLE IF NOT EXISTS благословение (
  id_благословение INT NOT NULL,
  дата_благословеня VARCHAR(45),
  тип_благословения VARCHAR(45),
  результат VARCHAR(45),
  дух_id_дух INT NOT NULL,
  PRIMARY KEY (id_благословение),
    FOREIGN KEY (дух_id_дух)
    REFERENCES дух (id_дух)
    
    );




-- Table проклятие

CREATE TABLE IF NOT EXISTS проклятие (
  id_проклятие INT NOT NULL,
  дата_события VARCHAR(45),
  уровень_опасности VARCHAR(45),
  описание VARCHAR(45),
  дух_id_дух INT NOT NULL,
  PRIMARY KEY (id_проклятие),
    FOREIGN KEY (дух_id_дух)
    REFERENCES дух (id_дух)
    
    );




-- Table путь духа

CREATE TABLE IF NOT EXISTS путь_духа (
  id_путь_духа INT NOT NULL,
  путь_idl VARCHAR(45),
  текущий_этапl VARCHAR(45),
  следующий_этап VARCHAR(45),
  дата_обновления VARCHAR(45),
  дух_id_дух INT NOT NULL,
  PRIMARY KEY (id_путь_духа),
    FOREIGN KEY (дух_id_дух)
    REFERENCES дух (id_дух)
    
    );




-- Table посещаемость

CREATE TABLE IF NOT EXISTS посещаемость (
  id_посещаемость INT NOT NULL,
  посещаемость_id VARCHAR(45),
  время_входа VARCHAR(45),
  время_выхода VARCHAR(45),
  статус VARCHAR(45),
  служение_id_служение INT NOT NULL,
  PRIMARY KEY (id_посещаемость),
    FOREIGN KEY (служение_id_служение)
    REFERENCES служение (id_служение)
    
    );




-- Table сообщение

CREATE TABLE IF NOT EXISTS сообщение (
  id_сообщение INT NOT NULL,
  сообщение_id VARCHAR(45),
  содержание VARCHAR(45),
  дата_отправки VARCHAR(45),
  тип_сообщения VARCHAR(45),
  PRIMARY KEY (id_сообщение));




-- Table объявление

CREATE TABLE IF NOT EXISTS объявление (
  id_объявление INT NOT NULL,
  объявление_id VARCHAR(45),
  заголовок VARCHAR(45),
  содержание VARCHAR(45),
  дата_публикацииl VARCHAR(45),
  активно VARCHAR(45),
  храм_id_храм INT NOT NULL,
  PRIMARY KEY (id_объявление),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм)
    
    );




-- Table событие

CREATE TABLE IF NOT EXISTS событие (
  id_событие INT NOT NULL,
  событие_id VARCHAR(45),
  название_события VARCHAR(45),
  тип_события VARCHAR(45),
  дата_начала VARCHAR(45),
  дата_окончания VARCHAR(45),
  храм_id_храм INT NOT NULL,
  PRIMARY KEY (id_событие),
    FOREIGN KEY (храм_id_храм)
    REFERENCES храм (id_храм)
    
    );




-- Table  участник события

CREATE TABLE IF NOT EXISTS  участник_события (
  id_участник_события INT NOT NULL,
  участник_события_id VARCHAR(45),
  роль_в_событии VARCHAR(45),
  дух_id_дух INT NOT NULL,
  работник_id_работник INT NOT NULL,
  PRIMARY KEY (id_участник_события),

    FOREIGN KEY (дух_id_дух)
    REFERENCES дух (id_дух),
    FOREIGN KEY (работник_id_работник)
    REFERENCES работник (id_работник)
    
    );

