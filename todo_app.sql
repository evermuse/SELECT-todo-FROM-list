\c bryan;


-- 1 Write a query to delete a user named michael if it exists

drop role if exists 'michael';


-- 2 Write a query to create a user named michael with an encrypted password stonebreaker

create user michael with encrypted password 'stonebreaker';


-- 3 Write a query to drop a database named todo_app if it exists

drop database if exists todo_app;


-- 4 Write a query to create a database named todo_app

create database todo_app;


-- 5 Connect to the newly created database

\c todo_app;


-- 6 Write a query to create a table named tasks using the Initial columns detailed below

create table tasks (

  id serial,
  title varchar(255),
  description text,
  created_at timestamp,  -- default is no time zone but can explicitly say [without time zone]
  updated_at timestamp,
  completed boolean

);


-- 7 Define column id as the table's primary key

alter table tasks add primary key (id);


-- 8.i remove the column named completed

ALTER TABLE tasks DROP COLUMN completed;


-- 8.ii add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL


alter table tasks add column completed_at timestamp null; -- can add null after timestamp to make null


-- 8.iii change the updated_at column to not allow NULL values, and have a default value of now()

alter table tasks alter column updated_at set not null;
alter table tasks alter column updated_at set default now();


-- 8.iv create a new task, by only setting values (not defining which columns)

insert into tasks values (default, 'Study SQL', 'Complete this exercise', now(), now(), null);


-- 8.v create a new task

insert into tasks (title, description) values ('Study PostgreSQL', 'read all the documentation');


-- 8.vi select all the titles of tasks that are not yet completed

select title from tasks where completed_at is null;


-- 8.vii update the task with a title of 'Study SQL' to be completed as of now

update tasks set title = 'Study SQL' where completed_at = now();


-- 8.viii select all titles and descriptions of tasks that are not yet completed

select title, description from tasks where completed_at is null;


-- 8.ix select all fields of every task sorted by creation date in descending order

select * from tasks order by created_at desc;


-- 8.x, 8.xi, & 8.xii create a new task

insert into tasks (title, description) values ('mistake 1', 'a test entry');
insert into tasks (title, description) values ('mistake 2', 'another test entry');
insert into tasks (title, description) values ('third mistake', 'another test entry');


-- 8.xiii select title fields of all tasks with a title that includes the word 'mistake'

select title from tasks where title like '%mistake%'; -- % is wildcard


-- 8.xiv delete the task that has a title of mistake 1

delete from tasks where title like 'mistake 1';


-- 8.xv select title and description fields of all tasks with a title that includes the word 'mistake'

select title, description from tasks where title like '%mistake%';


-- 8.xvi delete all tasks that includes the word 'mistake' in the title

delete from tasks where title like '%mistake%';


-- 8.xvii select all fields of all tasks sorted by title in ascending order

select * from tasks order by title desc;


-- run code and import file
