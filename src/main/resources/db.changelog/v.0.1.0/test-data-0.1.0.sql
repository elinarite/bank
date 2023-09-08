--liquibase formatted sql
--changeset elina:v.0.1.0-test-data

    INSERT INTO bank.managers (id, firs_name, last_name, status)
VALUES (1, 'John', 'Doe', 1),
       (2, 'Alice', 'Smith', 0),
       (3, 'Michael', 'Johnson', 2),
       (4, 'Emily', 'Brown', 0),
       (5, 'David', 'Davis', 1),
       (6, 'Sarah', 'Miller', 1),
       (7, 'James', 'Wilson', 0),
       (8, 'Olivia', 'Taylor', 1),
       (9, 'Daniel', 'Jones', 1),
       (10, 'Ava', 'White', 0);

INSERT INTO bank.clients (id, status, tax_code, first_name, last_name, email, address, phone)
VALUES (UUID_TO_BIN('2c26dd1e-498c-11ee-bbf9-10d0e2fa4154'), 1, '321-12345-321', 'John', 'Doe', 'john.doe@example.com',
        'Alexanderplatz 7, 10178 Berlin', '+1234567890'),
       (UUID_TO_BIN('2c26e002-498c-11ee-bbf9-10d0e2fa4154'), 1, '123-12345-123', 'Alice', 'Johnson', 'alice.johnson@example.com',
        'Kurfürstendamm 216, 10719 Berlin', '+1234567999'),
       (UUID_TO_BIN('2c26e124-498c-11ee-bbf9-10d0e2fa4154'), 2, '123-34234-123', 'Michael', 'Smith', 'michael.smith@example.com',
        'Marienplatz 22, 80331 München', '+9876543210'),
       (UUID_TO_BIN('2c26e1c4-498c-11ee-bbf9-10d0e2fa4154'), 2, '123-12345-123', 'Emily', 'Brown', 'emily.brown@example.com',
        'Unter den Linden 77, 10117 Berlin', '+4444444444'),
       (UUID_TO_BIN('2c26e246-498c-11ee-bbf9-10d0e2fa4154'), 1, '123-12345-123', 'David', 'Wilson', 'david.wilson@example.com',
        'Heerstraße 12, 14052 Berlin', '+5555555555'),
       (UUID_TO_BIN('2c26e2d2-498c-11ee-bbf9-10d0e2fa4154'), 1, '123-12345-123', 'Sophia', 'Miller', 'sophia.miller@example.com',
        'Schlossplatz 1, 70173 Stuttgart', '+6666666666'),
       (UUID_TO_BIN('2c26e354-498c-11ee-bbf9-10d0e2fa4154'), 3, '123-12345-123', 'James', 'Anderson', 'james.anderson@example.com',
        'Friedrichstraße 96, 10117 Berlin', '+7777777777'),
       (UUID_TO_BIN('2c26e3d6-498c-11ee-bbf9-10d0e2fa4154'), 3, '123-12345-123', 'Olivia', 'Martinez', 'olivia.martinez@example.com',
        'Am Zirkus 1, 10117 Berlin', '+8888888888'),
       (UUID_TO_BIN('2c26e462-498c-11ee-bbf9-10d0e2fa4154'), 1, '123-12345-123', 'Alexander', 'Lee', 'alexander.lee@example.com',
        'Goethestraße 25, 60313 Frankfurt am Main', '+1234567890'),
       (UUID_TO_BIN('2c26e4ee-498c-11ee-bbf9-10d0e2fa4154'), 1, '123-12345-123', 'Ava', 'Garcia', 'ava.garcia@example.com',
        'Goethestraße 20, 60313 Frankfurt am Main', '+1010101010');

INSERT INTO bank.accounts (id, client_id, manager_id, account_number, type, status, balance, currency_code)
VALUES (UUID_TO_BIN('38529bfe-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26dd1e-498c-11ee-bbf9-10d0e2fa4154'), 1,  '111122223333', 1, 1, 1000.00, 1),
       (UUID_TO_BIN('3852a1a8-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e002-498c-11ee-bbf9-10d0e2fa4154'), 2, '111122224444', 2, 1,
        2500.50, 1),
       (UUID_TO_BIN('38529f5a-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e124-498c-11ee-bbf9-10d0e2fa4154'),2,  '111122225555', 1, 1,
        1500.25, 2),
       (UUID_TO_BIN('3852a220-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e1c4-498c-11ee-bbf9-10d0e2fa4154'), 1,  '111122226666', 1, 1,
        2000.00, 3),
       (UUID_TO_BIN('3852a02c-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e246-498c-11ee-bbf9-10d0e2fa4154'), 2,  '777722223333', 2, 1, 3000.75, 1),
       (UUID_TO_BIN('3852a298-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e2d2-498c-11ee-bbf9-10d0e2fa4154'), 4, '111122228888', 1, 1, 500.00, 2),
       (UUID_TO_BIN('3852a0b8-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e354-498c-11ee-bbf9-10d0e2fa4154'), 3, '111144443333', 2, 1, 700.00, 1),
       (UUID_TO_BIN('3852a310-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e3d6-498c-11ee-bbf9-10d0e2fa4154'), 4,  '888822223333', 1, 1, 1200.00, 3),
       (UUID_TO_BIN('3852a130-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e462-498c-11ee-bbf9-10d0e2fa4154'), 5,  '999922223333', 2, 1,
        800.25, 2),
       (UUID_TO_BIN('3852a3e2-498d-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('2c26e4ee-498c-11ee-bbf9-10d0e2fa4154'), 1, '333322223333', 1, 1, 3500.00, 1);

INSERT INTO bank.transactions (id, debit_account_id, credit_account_id, type, amount, description)
VALUES (UUID_TO_BIN('d5ad9b48-4b3a-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('38529bfe-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a1a8-498d-11ee-bbf9-10d0e2fa4154'), 1, 50.00, 'Test1'),
       (UUID_TO_BIN('d5ad9d14-4b3a-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('38529f5a-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a220-498d-11ee-bbf9-10d0e2fa4154'), 2, 500.50, 'Test2'),
       (UUID_TO_BIN('d5ad9df0-4b3a-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('3852a02c-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a298-498d-11ee-bbf9-10d0e2fa4154'), 1, 20.25, 'Test3'),
       (UUID_TO_BIN('d5ad9e7c-4b3a-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('3852a0b8-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a310-498d-11ee-bbf9-10d0e2fa4154'), 2, 200.00, 'Test4'),
       (UUID_TO_BIN('d5ad9f08-4b3a-11ee-bbf9-10d0e2fa4154'), UUID_TO_BIN('3852a130-498d-11ee-bbf9-10d0e2fa4154'),
        UUID_TO_BIN('3852a3e2-498d-11ee-bbf9-10d0e2fa4154'), 3, 100.75, 'Test5');

INSERT INTO bank.products (id, product_typ, status, currency_code, interest_rate, product_limit)
VALUES (1, 'Auto Loan', 2, 2, 5.07, 50000),
       (2, 'Personal Loans', 2, 2, 4.5, 10000),
       (3, 'Investment Products', 2, 2, 1.2, 5000000),
       (4, 'Home Loan', 2, 2, 3, 500000),
       (5, 'Overdraft', 2, 2, 7.00, 500000);

INSERT INTO bank.agreements (id, account_id, product_id, interest_rate, status, sum)
VALUES (1, UUID_TO_BIN('38529bfe-498d-11ee-bbf9-10d0e2fa4154'), 1, 5.00, 1, 5000),
       (2, UUID_TO_BIN('38529f5a-498d-11ee-bbf9-10d0e2fa4154'), 2, 3.00, 2, 7000),
       (3, UUID_TO_BIN('3852a02c-498d-11ee-bbf9-10d0e2fa4154'), 3,  1.00, 1, 25000),
       (4, UUID_TO_BIN('3852a0b8-498d-11ee-bbf9-10d0e2fa4154'), 1, 5.00, 1, 5000),
       (5, UUID_TO_BIN('3852a130-498d-11ee-bbf9-10d0e2fa4154'), 5, 5.00, 1, 500000);