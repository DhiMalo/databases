CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  username varchar(15),
  text varchar(180),
  roomname varchar(15)  
);

CREATE TABLE users (
  username varchar(15)
);

CREATE TABLE friends (
  username varchar(15)
);


/*  
sample message:
        var message = {
          username: 'Mel Brooks',
          text: 'It\'s good to be the king',
          roomname: 'lobby'
        };



Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/



