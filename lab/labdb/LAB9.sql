create table Reviewer(
rID serial Primary key,
	name varchar(25)
);
create table Rating(
rID serial references Reviewer,
	mID serial primary key,
	stars integer,
	ratingDate date
);
create table Movie(
mID serial references Rating,
	title varchar(25),
	year integer,
	director varchar(25)
);

create view Name as select name from Reviewer,(select rID, count(stars) 
from Rating group by rID ) rc 
where Reviewer.rID = rc.rID and rc.count > 2;

create index name_name on Reviewer(name);

create role root;

create role smth login createrole;

grant all privileges from root to smth;

reassigned owned by root to smth;