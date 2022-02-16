drop table if exists users;

create table users (
    id          bigint generated by default as identity,
    first_name  varchar(100) not null,
    last_name   varchar(100) not null,
    email       varchar(100) not null,
    role        varchar(10)  not null,
    usercode    varchar(255) not null,
    title       varchar(20),
    create_dts  timestamp    not null default CURRENT_TIMESTAMP,
    update_dts  timestamp,
    primary key (id)
);