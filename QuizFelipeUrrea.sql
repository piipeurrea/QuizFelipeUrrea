--PARTE 1-------------------------------------------------

--se crea tablespase
create tablespace tsquiz
 datafile 'dfquiz1' size 15M,
 'dfquiz2' size 15M,
 'dfquiz3' size 15M;

--Se crea perfil 
create profile student limit
    IDLE_TIME 20;
 
--Se crea usuario   
create user usuario_1
identified by usuario_1
default tablespace tsquiz
quota unlimited on tsquiz;

--permisos de coneccion al usuario
grant connect to usuario_1;
--se asocia el perfil al usuario
alter user usuario_1 profile student; 
--se agrega rol de dba al usuario_1
grant dba to usuario_1;

--se crea el segundo usuario
create user usuario_2
identified by usuario_2
default tablespace tsquiz
quota unlimited on tsquiz;
--se dan permisos de conexion
grant connect to usuario_2;
--se asocia el pefil al ususrio
alter user usuario_2 profile student;
--se dan permisos de crear al usuario
grant create table to usuario_2;

--PARTE 2-------------------------------------
create table attacks (
id integer,
url varchar2(2048),
ip_address varchar2(255),
number_of_attacks integer,
time_of_last_attacks timestamp
)

grant select to usuario_2;

select * from  attacks;

--Count the urls which have been attacked and have the protocol 'https'
select count(1) from attacks
where url like 'https%';

--List the records where the URL attacked matches with google (it does not matter if it is google.co.jp, google.es, google.pt, etc) order by number of attacks ascendent
select * from attacks
where url like '%google%';

--List the ip addresses and the time of the last attack if the attack has been produced the last year (2017) (Hint: https://stackoverflow.com/a/30071091)
select ip_address, time_of_last_attacks from attacks
where year(time_of_last_attacks) = 2017





 
 