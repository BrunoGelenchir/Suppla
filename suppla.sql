drop database if exists suppla;
create database suppla;
use suppla;



create table users(
    users_id int not null primary key auto_increment,
    email varchar (25) not null,
    passwords varchar (20) not null

);

create table profiles(
    profiles_id int not null primary key auto_increment,
    artist_name varchar (15) not null,
    users int not null,
    bio varchar (20),
    profiles_pic int,     
    postovi int,        
    locations int not null,
    suppla int,
    category int 
);
create table category_profiles (
    category_profiles_id int not null primary key auto_increment,
    profiles int not null,
    category int not null
);

create table category (
     category_id int not null primary key auto_increment,
     name_of_category varchar (20)
);

create table suppla (
    suppla_id int not null primary key auto_increment,
    users int not null,
    profiles int not null
);
create table profiles_post(
    profiles_postID int not null primary key auto_increment,
    post int not null,
    profiles int not null

);

create table post (
    post_id int not null primary key auto_increment,
    pic int,                      
    profiles int not null,
    opis varchar(50),
    vrijeme datetime ,
    buy boolean

);

create table supp (
    supp_id int not null primary key auto_increment,
    post int not null,
    users int not null
);

create table buy(
    buy_id int not null primary key auto_increment,
    profiles int not null,
    post int not null
);
 
 create table locations (
     locations_id int not null primary key auto_increment,
     city varchar (20) not null,
     country varchar (20) not null
 );


 alter table profiles add foreign key (users) references users (users_id);
 
 alter table suppla add foreign key (users) references users (users_id);

 alter table post add foreign key (profiles) references profiles (profiles_id);

 alter table supp add foreign key (post) references post (post_id);
 alter table supp add foreign key (users) references users (users_id);

 alter table buy add foreign key (post) references post (post_id);
 alter table buy add foreign key (profiles) references profiles  (profiles_id);

 alter table suppla add foreign key (profiles) references profiles (profiles_id);
 alter table suppla add foreign key (users) references users (users_id);

 alter table category_profiles add foreign key (profiles) references profiles (profiles_id);
 alter table category_profiles add foreign key (category) references category (category_id);

 alter table profiles_post add foreign key (profiles) references profiles (profiles_id);
 alter table profiles_post add foreign key (post) references post (post_id);

 alter table profiles add foreign key (locations) references locations (locations_id);