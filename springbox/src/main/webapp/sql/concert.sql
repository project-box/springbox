
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

delete from seat;
alter table payment drop column payment_seat;

alter table seat drop column payment_num;
alter table seat add(
seat_time varchar2(200));

select * from seat;


alter table seat modify(seat_seat varchar2(200));


select * from concert;


