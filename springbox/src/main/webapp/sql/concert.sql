
create table seat (
  seat_num number primary key, 
  payment_num number references payment(payment_num),  
  seat_seat varchar2(30) not null
);

create sequence seat_seq
start with 1
increment by 1
nocache;

select * from users;

select * from payment;

select * from payment;

select * from seat;

delete from seat;
alter table payment drop column cancel;

alter table seat drop column payment_num;
alter table seat add(
payment_num references payment(payment_num));

select * from seat;

	update payment set payment_check='무통장입금' where concert_num=30;
		
alter table seat modify(seat_seat varchar2(200));


select * from concert;



select max(payment_num) from payment;





