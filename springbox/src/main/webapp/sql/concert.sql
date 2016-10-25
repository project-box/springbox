
create table seat (
  seat_num number primary key, 
  payment_num number references payment(payment_num),  
  seat_seat varchar2(30) not null
);

create sequence seat_seq
start with 1
increment by 1
nocache;

select * from payment;

select * from payment;

delete from payment;
alter table payment drop column payment_seat;

alter table seat drop column payment_num;
alter table seat add(
concert_num number references concert(concert_num));

select * from seat;