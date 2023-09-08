--liquibase formatted sql
--changeset elina:v.0.1.0-ddl



create table if not exists bank.managers
(
    id         bigint primary key auto_increment,
    firs_name  varchar(50) not null,
    last_name  varchar(50) not null,
    status     int(1)      not null,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table if not exists bank.clients
(
    id         binary(16) primary key,
    status     int(1)      not null,
    tax_code   varchar(20) not null,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    email      varchar(60) not null,
    address    varchar(80) not null,
    phone      varchar(16) not null,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at  timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    unique (tax_code, email)
);

create table if not exists bank.accounts
(
    id             binary(16) primary key,
    client_id      binary(16)               not null,
    manager_id     bigint                   not null,
    account_number varchar(20)              not null,
    type           int(1)                   not null,
    status         int(1)                   not null,
    balance        decimal(15, 2) DEFAULT 0 not null,
    currency_code  int(2)                   not null,
    created_at     timestamp      DEFAULT CURRENT_TIMESTAMP,
    update_at      timestamp      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (manager_id) references managers (id),
    foreign key (client_id) references clients (id),
    unique (account_number)
);

create table if not exists bank.transactions
(
    id                binary(16) primary key,
    debit_account_id  binary(16)     not null,
    credit_account_id binary(16)     not null,
    type              int(1)     not null,
    amount            decimal(12, 4) not null,
    description       varchar(255)   not null,
    created_at        timestamp DEFAULT CURRENT_TIMESTAMP,
    foreign key (debit_account_id) references accounts (id),
    foreign key (credit_account_id) references accounts (id)
);

create table if not exists bank.products
(
    id            bigint primary key auto_increment,
    product_typ   varchar(70)   not null,
    status        int(1)    not null,
    currency_code int(2)    not null,
    interest_rate decimal(6, 4) not null,
    product_limit int       not null,
    created_at    timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at     timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    unique (product_typ)
);

create table if not exists bank.agreements
(
    id            bigint primary key auto_increment,
    account_id    binary(16)     not null,
    product_id    bigint         not null,
    interest_rate decimal(6, 4)  not null,
    status        int(1)     not null,
    sum           decimal(15, 2) not null,
    created_at    timestamp DEFAULT CURRENT_TIMESTAMP,
    update_at     timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (account_id) references accounts (id),
    foreign key (product_id) references products (id)
);