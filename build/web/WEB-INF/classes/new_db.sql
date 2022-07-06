drop database mytest;
create database mytest;
use mytest;

CREATE TABLE test(
    id int,
    userid int,
    name VARCHAR(45),
    location VARCHAR(100),
    PRIMARY KEY (id)
);
INSERT INTO test VALUES(1,11,'a','aa');
INSERT INTO test VALUES(2,11,'a','aa');
INSERT INTO test VALUES(3,11,'a','aa');
INSERT INTO test VALUES(4,14,'a','aa');
INSERT INTO test VALUES(5,15,'a','aa');
INSERT INTO test VALUES(6,16,'a','aa');
INSERT INTO test VALUES(7,17,'a','aa');
INSERT INTO test VALUES(8,18,'a','aa');
INSERT INTO test VALUES(9,19,'a','aa');
INSERT INTO test VALUES(10,20,'a','aa');
INSERT INTO test VALUES(11,21,'a','aa');
INSERT INTO test VALUES(12,22,'a','aa');

DELETE FROM test WHERE  id IN (SELECT id from test ORDER BY id LIMIT 3);
select*from test where userid = 11 IN (DELETE FROM test ORDER BY id LIMIT 3);
delete from test where id IN(select*from test where userid = 11);

DELETE FROM test ORDER BY id LIMIT 3;

delete from test where userid=11 IN (
    select id from test userid=17 order by id limit 10);
////////////////////////////////////////
DROP DATABASE hotelspro;
CREATE DATABASE hotelspro;
USE hotelspro;

CREATE TABLE hotel(
    hotelId int NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    location VARCHAR(100),
    address VARCHAR(100),
    descreption VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(45),
    star VARCHAR(1),
    enabled VARCHAR(1),
    PRIMARY KEY (hotelId)
);

CREATE  TABLE room(
    roomId int NOT NULL AUTO_INCREMENT,
    room_code VARCHAR(45)NOT NULL,  
    room_type VARCHAR(45)NOT NULL,  
    bed_type VARCHAR(45)NOT NULL,
    room_enabled VARCHAR(1),
    room_price decimal NOT NULL,
    hotelId int NOT NULL,
    PRIMARY KEY (roomId),
    CONSTRAINT FOREIGN KEY (hotelId) REFERENCES hotel (hotelId)
    ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB;

CREATE  TABLE inventory(
    inventoryId int NOT NULL AUTO_INCREMENT,
    inventory_from VARCHAR(45)NOT NULL,  
    inventory_to VARCHAR(100)NOT NULL,  
    inventory_count int NOT NULL,
    inventory_dates VARCHAR(100)NOT NULL,
    roomId int NOT NULL,  
    PRIMARY KEY (inventoryId),
    CONSTRAINT FOREIGN KEY (roomId) REFERENCES room (roomId)
    ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE payment(
    paymentId int NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    country VARCHAR(100),
    address VARCHAR(100),
    descreption VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(45),
    confirm VARCHAR(1),
    bookingType VARCHAR(45),
    
    hotelID VARCHAR(100),
    hotelName VARCHAR(100),
    hotelLocation VARCHAR(100),
    hotelAddress VARCHAR(100),
    hotelPhone VARCHAR(100),
    hotelEmail VARCHAR(100),
    hotelStar VARCHAR(100),
    hotelEnabled VARCHAR(100),

    roomId int(100),
    roomCode VARCHAR(100),  
    roomType VARCHAR(100),  
    bedType VARCHAR(100),
    roomEnabled VARCHAR(100),
    allRoomsPrice decimal(65),

    inventoryId int(100),
    inventoryFrom VARCHAR(100),  
    inventoryTo VARCHAR(100),  
    inventoryCount int(100),
    inventoryDates VARCHAR(100),

    PRIMARY KEY (paymentId)
);

CREATE TABLE user(
    userId int NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    userName VARCHAR(45),
    password VARCHAR(45),
    country VARCHAR(100),
    address VARCHAR(100),
    descreption VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(45),
    userType VARCHAR(45),
    status VARCHAR(1),
    PRIMARY KEY (userId)
);
CREATE TABLE password_history(
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    userName VARCHAR(45),
    userPassword VARCHAR(45),
    PRIMARY KEY (id)
);

INSERT INTO room VALUES(2,'R002','luxery','single','Y',5000);

SELECT h.hotelID,r.roomId,i.inventoryId
FROM hotel h
    JOIN room r ON h.hotelId=r.hotelId
    JOIN inventory i ON i.roomId=r.roomId;

SELECT h.hotelID,r.roomId,i.inventoryId,
h.name,h.location,h.address,h.phone,h.email,h.star,h.enabled,
r.room_code,r.room_type,r.bed_type,r.room_enabled,r.room_price,
i.inventory_dates
FROM hotel h
    JOIN room r ON h.hotelId=r.hotelId
    JOIN inventory i ON i.roomId=r.roomId;