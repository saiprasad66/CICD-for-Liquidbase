--liquibase formatted sql

--changeset sai:002
ALTER TABLE users
ADD email VARCHAR(255);

--rollback ALTER TABLE users DROP COLUMN email;
