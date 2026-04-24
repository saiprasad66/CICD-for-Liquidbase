--liquibase formatted sql

--changeset sai:003
CREATE INDEX idx_users_email
ON users(email);

--rollback DROP INDEX idx_users_email ON users;
