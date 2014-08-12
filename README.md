# WebDev Bootcamp
## About
This project is for [Epicodus'](http://www.epicodus.com/) [Database basics assessment](http://www.learnhowtoprogram.com/lessons/database-basics-assessment).
This project allows users to add bootcamps to the system, add courses' length and technologies. They can also add technologies and length to a specific bootcamp, list them, update and delete them.

## Setup
Clone this repository or download the .zip.

* CREATE DATABASE programming_bootcamps;
* CREATE TABLE bootcamps (id serial PRIMARY KEY, name varchar, length_id int);
* CREATE TABLE lengths (id serial PRIMARY KEY, length int);
* CREATE TABLE technologies (id serial PRIMARY KEY, name varchar);
* CREATE TABLE curriculum (id serial PRIMARY KEY, bootcamp_id int, technology_id int);
* CREATE DATABASE programming_bootcamps_test WITH TEMPLATE programming_bootcamps;

## Author
Sergii Mertsalov

## License
MIT
