-- link to Chinook Database: https://github.com/lerocha/chinook-database


-- Structured Query Language (SQL)
-- SQL is used in Relational Databases to provide a consistent language for interacting with 
-- said databases

-- Relational Databases allow you to create "relationships" between your tables that allows
-- for not needing monolithic tables or redundant data

-- All data in your Relational Databases will be stored in a Schema. Schemas allow you to group
-- like data together,and allows for a consistent level of constraints

-- All of our data is going inside of a schema, and we can manipulate this data using the
-- various sublanguages of SQL
-- Data Definition Language
-- Data Manipulation Language
-- Data Query Language
-- Data Control Language
-- Transactional Control Language

----------------------------------------------------------------------------------------------

-- DATA DEFINITION LANGUAGE
-- anytime you are creating your tables or manipulating the table structure in some way you are
-- working with DDL
-- create table {table name} (column one, column two, etc);
create table public.students(
	name varchar(20)
);

alter table public.students add column student_id int; -- you can add columns

alter table public.students add column age varchar(10); -- adding for line below

alter table public.students alter age type int using age::integer; -- you can alter data types

alter table public.students drop column age; -- you can remove columns

drop table public.students; -- this deletes the table from the database

truncate table public.students; -- this clears the data from the table, database remains

-- there is no rollback option for drop or truncate, be careful using them

--------------------------------------------------------------------------------------------

-- DATA MANIPULATION LANGUAGE
-- DML comes into play when you want to do something with your tables, inserting, updating, 
-- deleting, and selecting data from your tables in particular

insert into public.students (name, student_id) values ('Billy', 1);

insert into public.students (student_id, name) values (2, 'Sally');

-- if the column you provide does not exist, query will fail
insert into public.students (age) values (50);

-- if you are providing data for all the columns then you don't need to specify columns
insert into public.students values ('Teddy', 3);

-- you can provide data for multiple columns
insert into public.students values
('John', 4),
('Jeffery', 5),
('Bob', 6);

-- Anytime you need to change a record that already exists you will make an update query
update public.students set name = 'Geffery'; -- this will change ALL record names

-- this will only change the record with the student_id of 1
update public.students set name = 'Billy' where student_id = 1;

-- this will change multiple columns, can even change a column targeted by your where statement
update public.students set name = 'Sally', student_id = 7 where student_id = 2;

delete from public.students where student_id = 3;

-- used this to create an extra record to be deleted
insert into public.students values ('Billy', 5);

-- separate your where targets with the "and" keyword
delete from public.students where student_id = 5 and name = 'Billy';

-- If you want to query data you use the select keyword
-- some people think this rightly falls under Data Query Language as its own sublanguage
-- others think it falls under DML

-- get all data
select * from public.students;

-- get all data for specified record/s
select * from public.students where student_id = 1;
select * from public.students where name = 'Geffery';

select name from public.students where student_id = 1;

----------------------------------------------------------------------------------------------
-- CONSTRAINTS
-- constraints help determine what can and can't go inside a table
-- some common constraints are "unique" and "not null"
-- unique makes it so a column must have unique values (no repeats)
-- not null makes it so a value must be provided for the column

-- in our student example we can provide a name but no id
INSERT INTO public.students (name) values ('Virgil');

-- this will work, the student_id column will have a NULL value
select * from public.students where name = 'Virgil';

-- constraints are created when a table is created, though you can add constraints on later
-- serial is a data type that tells postgres to provide the value (1, then 2, then 3, etc)
-- for records created in this table

-- you can make a column unique and not null by labeling it "primary key"
-- drop table public.teams;
create table public.teams(
	team_id serial primary key,
	team_name varchar(20)
);

-- if your database is providing a value (like for a serial type) you can provide "default"
insert into public.teams values 
(default, 'Volcanoes'),
(default, 'Mountains');

insert into public.teams (team_name) 
values ('Range'),
('Hills');

insert into public.teams values (0, 'Free Agent');


 drop table public.players;
create table public.players(
	player_id serial primary key,
	team_id int not null default 0,
	player_name varchar(20),
	-- foreign key constraints are nullable by default, mark the column not null if you want
	-- to change that
	
	--note this foreign key constraint will change the value of any column that points to a
	-- non-existant foreign key to the column's default value
	constraint team_id_foreign_key foreign key (team_id) references public.teams(team_id) on delete set default
);

-- this will not work, no team is referenced, so the record is not created
insert into public.players (player_name) values ('Billy');

insert into public.players (team_id, player_name) values (4, 'Billy');
insert into public.players (team_id, player_name) values
(1, 'Sally'),
(2, 'Teddy'),
(3, 'John'),
(4, 'Geffery');

-- because we have player records that reference the team we are trying to delete
-- the operation will fail by default
delete from public.teams where team_id = 4;

-- if we wanted to be able to delete the referenced record there are a few options
-- on delete restrict is default, see above
-- on delete cascade will delete any records that reference the deleted record/s
-- on delete set lets you create a default fallback value




