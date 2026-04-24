--liquibase formatted sql

--include file:001-create-users-table.sql
--include file:002-add-email-column.sql
--include file:003-create-index.sql
