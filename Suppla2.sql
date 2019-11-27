drop database if exists suppla2;
create database suppla2 default character set utf8; ;
use suppla2;

# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < c:\suppla2.sql



create table profiles(
    profiles_id int not null primary key auto_increment,
    passwords varchar (30) not null,
    email varchar (40) not null,
    artist_name varchar (30) not null,
    bio varchar (100),
    profiles_pic int,     
    postovi int,        
    locations int not null,
    supp int,
    category int ,
    administrator boolean
);

create table post (
    post_id int not null primary key auto_increment,
    pic int,                      
    profiles int not null,
    opis varchar(200),
    vrijeme datetime ,
    buy boolean,
    category varchar (50),
    locations int not null

);

create table supp (
    supp_id int not null primary key auto_increment,
    post int not null,
    vrijeme datetime,
    profiles int 
);

create table buy(
    buy_id int not null primary key auto_increment,
    profiles int not null,
    post int not null,
    price decimal (18.2),
    vrijeme datetime
);
 
 create table locations (
     locations_id int not null primary key auto_increment,
     city varchar (30) not null,
     country varchar (50) not null
 );

alter table supp add foreign key (profiles) references profiles (profiles_id);
 
 alter table post add foreign key (profiles) references profiles (profiles_id);

 alter table supp add foreign key (post) references post (post_id);

 alter table buy add foreign key (post) references post (post_id);
 alter table buy add foreign key (profiles) references profiles  (profiles_id);

 alter table profiles add foreign key (locations) references locations (locations_id);

 alter table post add foreign key (locations) references locations (locations_id);