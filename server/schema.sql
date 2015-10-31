CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  username varchar(15), /* this is the foreign key */
  text varchar(180), /* this is the primary key */
  roomname varchar(15)  /* this is the foreign key */
);

CREATE TABLE users (
  username varchar(15) /* this is the primary key */
);

CREATE TABLE rooms (
  roomname varchar(15),/* this is the primary key */
  username varchar(15) /* this is the foreign key */
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

CREATE TABLE `mesasges` (
  `username` varchar(15) NOT NULL DEFAULT 'anonymousUser',
  `text` varchar(180) NOT NULL AUTO_INCREMENT DEFAULT 'New User Message',
  `roomname` varchar(15) NOT NULL DEFAULT 'chatterbox',
  PRIMARY KEY (`text`)
);

CREATE TABLE `users` (
  `username` varchar(15) NOT NULL AUTO_INCREMENT DEFAULT 'anonymousUser',
  PRIMARY KEY (`username`)
);

CREATE TABLE `rooms` (
  `roomname` varchar(15) NOT NULL AUTO_INCREMENT DEFAULT 'chatterbox',
  `username` varchar(15) NOT NULL DEFAULT 'anonymousUser',
  PRIMARY KEY (`roomname`)
);

ALTER TABLE `mesasges` ADD CONSTRAINT `mesasges_fk0` FOREIGN KEY (`username`) REFERENCES `users`(`username`);

ALTER TABLE `mesasges` ADD CONSTRAINT `mesasges_fk1` FOREIGN KEY (`roomname`) REFERENCES `rooms`(`roomname`);

ALTER TABLE `rooms` ADD CONSTRAINT `rooms_fk0` FOREIGN KEY (`username`) REFERENCES `users`(`username`);

/* 
TO DO LIST:
BRING DOWN SOLUTION VERSION of client.
LOOK UP DB, EXPRESS, MORGAN, PARSER, ROUTER?

2 tables want to extract data from both

Describe rooms:
- Every room will have at least 1 user ; users can also be in multiple rooms.
There is a many to many relationship there. So we need a joined table

What users are in x room?
  Then display them
What messages belong to x user?
  (Then I could implement the friends option later)

The key that should join them is their common key.

select users.username, rooms.username
from users, rooms
where customers.
from chats
where 
*/
