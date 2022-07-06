/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Gimhana Sandakelum
 * Created: Mar 7, 2020
 */
drop database hotelspro;
create database hotelspro;
use hotelspro;

CREATE TABLE hotel(
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    address VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(45),
    enabled VARCHAR(1),
    CONSTRAINT PRIMARY KEY (id)
);
