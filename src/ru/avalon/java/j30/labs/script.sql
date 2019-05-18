/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
drop table Users; drop table users_info; drop table Roles; drop table Orders; drop table Orders2Product; drop table Product; drop table Supplier;

create table Users
(
    user_id integer,
    email varchar(255) not null,
    password varchar(255),
    info integer,
    role integer,
    constraint pk_users primary key (email)
);
 

create table users_info
(
    users_info_id integer generated always 
        as identity (start with 1, increment by 1) 
        unique,
    name varchar(255),
    surname varchar(255),
    constraint pk_users_info primary key (users_info_id),
    constraint fk_users_info foreign key (users_info_id)
                             references users(user_id) references roles(roles_id)
);


create table Roles
(
    roles_id integer,
    name varchar(255) primary key
);

create table Orders
(
    orders_id integer,
    users integer,
    created timestamp,
    
    constraint pk_orders primary key (orders_id)
);

create table Orders2Product
(
    orders integer,
    poduct integer
);


create table Product
(
    product_id integer,
    code varchar(255) primary key,
    title varchar(255),
    supplier integer,
    initial_price double,
    retail_value double    
);

create table Supplier
(
    supplier_id integer,
    name varchar(255) primary key,
    address varchar(255),
    phone varchar(255),
    representative varchar(255)
);




insert into Users(email, password,info,role) 
    values  ('1@1', '1', 1, 1),
            ('2@2', '2', 2, 2),
            ('3@3', '3', 3, 3);
