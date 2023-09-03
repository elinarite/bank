--liquibase formatted sql
--changeset elina:v.0.1.0-test-data

INSERT INTO bank.manager (firs_name, last_name, status)
VALUES ('John', 'Doe', 1),
       ('Alice', 'Smith', 0),
       ('Michael', 'Johnson', 2),
       ('Emily', 'Brown', 0),
       ('David', 'Davis', 1),
       ('Sarah', 'Miller', 1),
       ('James', 'Wilson', 0),
       ('Olivia', 'Taylor', 1),
       ('Daniel', 'Jones', 1),
       ('Ava', 'White', 0);

INSERT INTO bank.client (id, manager_id, status, tax_code, first_name, last_name, email, address, phone)
VALUES (UUID_TO_BIN(UUID()), 1, 1, '321-12345-321', 'John', 'Doe', 'john.doe@example.com',
        'Alexanderplatz 7, 10178 Berlin', '+1234567890'),
       (UUID_TO_BIN(UUID()), 1, 1, '123-12345-123', 'Alice', 'Johnson', 'alice.johnson@example.com',
        'Kurfürstendamm 216, 10719 Berlin', '+1234567999'),
       (UUID_TO_BIN(UUID()), 2, 2, '123-34234-123', 'Michael', 'Smith', 'michael.smith@example.com',
        'Marienplatz 22, 80331 München', '+9876543210'),
       (UUID_TO_BIN(UUID()), 2, 2, '123-12345-123', 'Emily', 'Brown', 'emily.brown@example.com',
        'Unter den Linden 77, 10117 Berlin', '+4444444444'),
       (UUID_TO_BIN(UUID()), 3, 1, '123-12345-123', 'David', 'Wilson', 'david.wilson@example.com',
        'Heerstraße 12, 14052 Berlin', '+5555555555'),
       (UUID_TO_BIN(UUID()), 3, 1, '123-12345-123', 'Sophia', 'Miller', 'sophia.miller@example.com',
        'Schlossplatz 1, 70173 Stuttgart', '+6666666666'),
       (UUID_TO_BIN(UUID()), 4, 3, '123-12345-123', 'James', 'Anderson', 'james.anderson@example.com',
        'Friedrichstraße 96, 10117 Berlin', '+7777777777'),
       (UUID_TO_BIN(UUID()), 4, 3, '123-12345-123', 'Olivia', 'Martinez', 'olivia.martinez@example.com',
        'Am Zirkus 1, 10117 Berlin', '+8888888888'),
       (UUID_TO_BIN(UUID()), 5, 1, '123-12345-123', 'Alexander', 'Lee', 'alexander.lee@example.com',
        'Goethestraße 25, 60313 Frankfurt am Main', '+1234567890'),
       (UUID_TO_BIN(UUID()), 5, 1, '123-12345-123', 'Ava', 'Garcia', 'ava.garcia@example.com',
        'Goethestraße 20, 60313 Frankfurt am Main', '+1010101010');

INSERT INTO bank.account (id, client_id, name, type, status, balance, currency_code)
VALUES (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26dd1e-498c-11ee-bbf9-10d0e2fa4154'), 'Savings Account', 1, 1, 1000.00, 1),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e002-498c-11ee-bbf9-10d0e2fa4154'), 'Personal Current Account', 2, 1,
        2500.50, 1),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e124-498c-11ee-bbf9-10d0e2fa4154'), 'Personal Current Account', 1, 1,
        1500.25, 2),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e1c4-498c-11ee-bbf9-10d0e2fa4154'), 'Personal Current Account', 1, 1,
        2000.00, 3),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e246-498c-11ee-bbf9-10d0e2fa4154'), 'Business Account', 2, 1, 3000.75, 1),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e2d2-498c-11ee-bbf9-10d0e2fa4154'), 'Business Account', 1, 1, 500.00, 2),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e354-498c-11ee-bbf9-10d0e2fa4154'), 'Business Account', 2, 1, 700.00, 1),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e3d6-498c-11ee-bbf9-10d0e2fa4154'), 'Business Account', 1, 1, 1200.00, 3),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e462-498c-11ee-bbf9-10d0e2fa4154'), 'Personal Current Account', 2, 1,
        800.25, 2),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('2c26e4ee-498c-11ee-bbf9-10d0e2fa4154'), 'Savings Account', 1, 1, 3500.00, 1);

INSERT INTO bank.transaction (id, debit_account_id, credit_account_id, type, amount, description)
VALUES (UUID_TO_BIN(UUID()), UUID_TO_BIN('38529bfe-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a1a8-498d-11ee-bbf9-10d0e2fa4154'), 1, 50.00, 'Test1'),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('38529f5a-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a220-498d-11ee-bbf9-10d0e2fa4154'), 2, 500.50, 'Test2'),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('3852a02c-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a298-498d-11ee-bbf9-10d0e2fa4154'), 1, 20.25, 'Test3'),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('3852a0b8-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a310-498d-11ee-bbf9-10d0e2fa4154'), 2, 200.00, 'Test4'),
       (UUID_TO_BIN(UUID()), UUID_TO_BIN('3852a130-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a3e2-498d-11ee-bbf9-10d0e2fa4154'), 3, 100.75, 'Test5');

INSERT INTO bank.product (manager_id, name, status, currency_code, interest_rate, product_limit)
VALUES (1, 'Auto Loan', 2, 2, 5.07, 50000),
       (2, 'Personal Loans', 2, 2, 4.5, 10000),
       (3, 'Investment Products', 2, 2, 1.2, 5000000),
       (3, 'Home Loan', 2, 2, 3, 500000),
       (1, 'Overdraft', 2, 2, 7.00, 500000);

INSERT INTO bank.agreement (account_id, product_id, interest_rate, status, sum)
VALUES (UUID_TO_BIN('38529bfe-498d-11ee-bbf9-10d0e2fa4154'), 1, 5.00, 1, 5000),
       (UUID_TO_BIN('38529f5a-498d-11ee-bbf9-10d0e2fa4154'), 2, 3.00, 2, 7000),
       (UUID_TO_BIN('3852a02c-498d-11ee-bbf9-10d0e2fa4154'), 3,  1.00, 1, 25000),
       (UUID_TO_BIN('3852a0b8-498d-11ee-bbf9-10d0e2fa4154'), 1, 5.00, 1, 5000),
       (UUID_TO_BIN('3852a130-498d-11ee-bbf9-10d0e2fa4154'), 5, 5.00, 1, 500000)




