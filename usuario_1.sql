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


