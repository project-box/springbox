
create table seat (
  seat_num number primary key, 
  payment_num number references payment(payment_num),  
  seat_seat varchar2(30) not null
);

create sequence seat_seq
start with 1
increment by 1
nocache;

select * from concert;
delete from concert where concert_num=67;
select * from users;

delete from payment;



select * from payment;

select * from seat;




delete from payment;
alter table payment drop column cancel;

alter table seat drop column payment_num;
alter table payment add(
payment_bank varchar2(200));
alter table payment add(
payment_account varchar2(200));


select * from payment;
delete from payment;
delete from seat;

	update payment set payment_registerdate='16/08/28' where payment_num=233;
		
	rollback;
alter table payment modify(payment_account number);

alter table payment 

select * from history;



select max(payment_num) from payment;





