--liquibase formatted sql

--changeset sai:001
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255),
    created_at DATETIME DEFAULT GETDATE()
);

--rollback DROP TABLE users;
