create database store;
# DDL
 create  table countries(
    code  int unique primary key,
    name  varchar(20) ,
    continent_name varchar(20)  not null

 );
Create table users(
    id int primary key ,
    full_name varchar(20),
    email varchar(20) unique,
    gender char(1) check (gender='m'or gender= 'f'),
    date_of_brith varchar(15),
    created_at datetime ,
    country_code int ,
    foreign key (country_code) references countries(code)

);

 create  table orders(
    id int primary key ,
    user_id int  ,
    status  varchar(6)check ( status='start' or status='finish') ,
   created_at datetime,
    foreign key (user_id) references users(id)

 );
create  table products(
    id int primary key ,
    name  varchar(10) not null ,
    price  int  default 0,
    status  varchar(10)check ( status='valid' or  status='expired') ,
   created_at datetime


 );
 create  table order_items(
    order_id int primary key ,
    product_id int  ,
   quantity int default 0,
    foreign key (order_id) references orders(id),
foreign key ( product_id) references products(id)
 );

ALTER TABLE orders ALTER COLUMN created_at SET DEFAULT now();
# DML
insert  into countries values ('1','saudi','asia');
insert  into users values ('1','seren','seren.com','f','11/1',sysdate(),'1');
insert  into orders values ('1','1','start',sysdate());
insert  into products values ('1','dress',100,'valid',sysdate());
insert  into products values ('2','dress',110,'expired',sysdate());
insert  into order_items values ('1','1',10);

update  countries set  name='sara' where code='1';
delete from  products where id='2';
select *  from orders;
select *  from order_items;
select *  from products;
select *  from users;
select *  from countries;
