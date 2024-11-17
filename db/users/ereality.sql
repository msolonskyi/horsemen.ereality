-- Create the user 
create user EREALITY
  default tablespace DATA
  temporary tablespace TEMP
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant select_catalog_role to EREALITY;
-- Grant/Revoke system privileges 
grant alter any table to EREALITY;
grant alter session to EREALITY;
grant comment any table to EREALITY;
grant create any index to EREALITY;
grant create any table to EREALITY;
grant create any view to EREALITY;
grant create procedure to EREALITY;
grant create public synonym to EREALITY;
grant create sequence to EREALITY;
grant create session to EREALITY;
grant create table to EREALITY;
grant create trigger to EREALITY;
grant create type to EREALITY;
grant create view to EREALITY;
grant debug connect session to EREALITY;
grant restricted session to EREALITY;
grant select any dictionary to EREALITY;
grant select any table to EREALITY;
grant unlimited tablespace to EREALITY;