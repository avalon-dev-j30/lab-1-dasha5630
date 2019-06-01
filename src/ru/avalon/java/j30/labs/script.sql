/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.

drop table Users; drop table users_info; drop table Roles; drop table Orders; drop table Orders2Product; drop table Product; drop table Supplier;

 */

create table Roles
(
    id integer generated always 
        as identity (start with 1, increment by 1) 
        unique,
    name varchar(255) primary key
);

create table users_info
(
    id integer generated always 
        as identity (start with 1, increment by 1),
    name varchar(255),
    surname varchar(255),
    constraint pk_users_info_id primary key (id)
    
);

create table Users
(
    id integer generated always 
        as identity (start with 1, increment by 1) 
        unique,
    email varchar(255) not null,
    password varchar(255),
    info integer unique,
    role integer,
    constraint pk_users primary key (email),
    constraint fk_users_info foreign key (info) references users_info(id), 
    constraint fk_users_role foreign key (role) references Roles(id)
);
 






create table Orders
(
    id integer generated always 
        as identity (start with 1, increment by 1),
    users integer,
    created timestamp,
    
    constraint pk_orders primary key (id),
    constraint fk_users_id foreign key (users) references Users(id)
);

create table Supplier
(
    id integer generated always 
        as identity (start with 1, increment by 1) 
        unique,
    name varchar(255) primary key,
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null
);

create table Product
(
    id integer generated always 
        as identity (start with 1, increment by 1) 
        unique,
    code varchar(255) primary key,
    title varchar(255),
    supplier integer,
    initial_price double,
    retail_value double,    
    constraint fk_supplier_id foreign key (supplier) references Supplier(id) 

);

create table Orders2Product
(
    orders integer,
    product integer,
    constraint pk_order_2_product primary key (orders, product),
    constraint fk_Orders2Product_orders_id foreign key (orders) references Orders(id),
    constraint fk_Orders2Product_product_id foreign key (product) references Product(id)
);






insert into roles(name) values 'D','E','F';

insert into users_info(name, surname) values
('A','A'),
('B','B'),
('C','C');

insert into Users(email, password, info, role) 
    values  ('1@1', '1', 1, 1),
            ('2@2', '2', 2, 2),
            ('3@3', '3', 3, 3);




insert into Orders(users, created) values 
(1,'1971-03-03 00:00:01'),
(2,'1971-02-02 00:00:01'),
(3,'1971-01-01 00:00:01');


insert into supplier(name, address, phone, representative) values
('J','M','111','A A'),
('K','N','222','B B'),
('L','O','333','C C');

insert into Product(code, title, supplier, initial_price, retail_value) values
('1','product G', 1 ,1.1 ,11.11),
('2','product H', 2 ,2.2 ,22.22),
('3','product I', 3 ,3.3 ,33.33);

insert into Orders2Product(orders, product) values
(1,3),
(2,2),
(3,1);



