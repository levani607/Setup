create database user_db;
create database order_db;

\connect user_db;

create schema user_service;
create type user_service.user_status as enum ('ACTIVE', 'DELETED');

alter type user_service.user_status owner to postgres;
create type user_service.user_role as enum ('ROLE_ADMIN', 'ROLE_USER');

alter type user_service.user_role owner to postgres;
create table user_service.application_user
(
    id          bigint
        constraint application_user_pk
            primary key,
    username    varchar(256),
    firstname   varchar(256),
    password    varchar(1024),
    email       varchar(256),
    status user_service.user_status,
    role user_service.user_role
);

create sequence user_service.application_user_id_seq;

alter sequence user_service.application_user_id_seq owner to postgres;

alter sequence user_service.application_user_id_seq owned by user_service.application_user.id;

insert into user_service.application_user values (nextval('user_service.application_user_id_seq'),'test','string','$2a$10$vt1GByJSJ7lyfVWvVTQXRefGxPpTLQP5ipuoMxRf5RqZKMZ/0LH.W','string','ACTIVE','ROLE_ADMIN'
                                                 );
\connect order_db
create schema order_service;

create type order_service.order_status as enum ('ACTIVE', 'DELETED');
alter type order_service.order_status owner to postgres;

create table order_service.orders
(
    id          bigint
        constraint orders_pk
            primary key,
    user_id    bigint,
    product   varchar(256),
    quantity    int,
    price       numeric,
    status order_service.order_status
);

create sequence order_service.order_id_seq;

alter sequence order_service.order_id_seq owner to postgres;

alter sequence order_service.order_id_seq owned by order_service.orders.id;

