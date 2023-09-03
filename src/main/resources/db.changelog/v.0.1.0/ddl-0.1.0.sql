--liquibase formatted sql
--changeset elina:v.0.1.0-ddl



create table if not exists bank.manager
(
    id         bigint primary key auto_increment,
    firs_name  varchar(50) not null,
    last_name  varchar(50) not null,
    status     integer(1)  not null,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table if not exists bank.client
(
    id         binary(16) primary key,
    manager_id bigint      not null,
    status     integer(1)  not null,
    tax_code   varchar(20) not null,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    email      varchar(60) not null,
    address    varchar(80) not null,
    phone      varchar(20) not null,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (manager_id) references manager (id),
    unique (tax_code, id)
);

create table if not exists bank.account
(
    id            binary(16) primary key,
    client_id     binary(16)               not null,
    name          varchar(100)             not null,
    type          integer(1)               not null,
    status        integer(1)               not null,
    balance       decimal(15, 2) DEFAULT 0 not null,
    currency_code integer(2)               not null,
    created_at    timestamp      DEFAULT CURRENT_TIMESTAMP,
    update_at     timestamp      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (client_id) references client (id)
);

create table if not exists bank.transaction
(
    id                binary(16) primary key,
    debit_account_id  binary(16)     not null,
    credit_account_id binary(16)     not null,
    type              integer(1)     not null,
    amount            decimal(12, 4) not null,
    description       varchar(255)   not null,
    created_at        timestamp DEFAULT CURRENT_TIMESTAMP,
    foreign key (debit_account_id) references account (id),
    foreign key (credit_account_id) references account (id)
);

create table if not exists bank.product
(
    id            bigint primary key auto_increment,
    manager_id    bigint        not null,
    name          varchar(70)   not null,
    status        integer(1)    not null,
    currency_code integer(2)    not null,
    interest_rate decimal(6, 4) not null,
    product_limit integer       not null,
    created_at    timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at     timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (manager_id) references manager (id)
);

create table if not exists bank.agreement
(
    id            bigint primary key auto_increment,
    account_id    binary(16)     not null,
    product_id    bigint         not null,
    interest_rate decimal(6, 4)  not null,
    status        integer(1)     not null,
    sum           decimal(15, 2) not null,
    created_at    timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at     timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (account_id) references account (id),
    foreign key (product_id) references product (id)
);