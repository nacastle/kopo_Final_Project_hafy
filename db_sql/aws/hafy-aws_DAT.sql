delete hf_a_account;
delete hf_m_account;
update Hf_M_Account set Balance = 10000000;
delete hf_a_tranz;
delete hf_like;
delete hf_member;
delete hf_auc_goods;
delete HF_GOODS_PHOTO;
delete HF_return_goods;
delete HF_return_photo;
delete HF_notice;

select * from hf_member;
select * from hf_m_account;
select * from Hf_Auc_Goods;

update hf_auc_goods set end_date = '2020-10-06 10:17' where no = 59;
commit;
insert into hf_group_code values('gc','경매상품 카테고리','y');
	insert into hf_notice(noti_no, noti_member_nick, noti_type, noti_content_no, noti_msg, noti_method)
		values(seq_hf_notice_no.nextval, '123', '123', '12', 'asd','');
        
        
update hf_member set phone = '01042115171';
select * from hf_member where nickname = 'nacastle';

select * from Hf_Notice order by noti_no desc;
SELECT *
		FROM
		(
		SELECT ROWNUM AS RNUM, A.*
		FROM (
		select no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid,
		(select count(*) from hf_a_tranz t where t.auc_no = g.no and tranz_type =
		'입금') as bid_cnt,
		(select count(*) from hf_a_account a where a.auc_no = g.no) as bidder_cnt
		from hf_auc_goods g
		where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:ss')
		order by bidder_cnt desc, bid_cnt desc, like_cnt desc, view_cnt desc,
		no desc
		)
        A
		WHERE ROWNUM  <= 
		10 * 1
		)
		WHERE RNUM > 10 * 0;
        
select no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid,
		(select count(*) from hf_a_tranz t where t.auc_no = g.no and tranz_type =
		'입금') as bid_cnt,
		(select count(*) from hf_a_account a where a.auc_no = g.no) as bidder_cnt
		from hf_auc_goods g
		where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:ss')
		order by bidder_cnt desc, bid_cnt desc, like_cnt desc, view_cnt desc,
		no desc;
  select no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
        from hf_auc_goods g
		where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI');

select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') from dual;

update Hf_M_Account set balance = 10000000;

delete Hf_Auc_Goods where no = 15;

desc hf_auc_goods;        
select * from hf_auc_goods order by no desc;
select * from hf_notice where Noti_Member_Nick = 'test' order by noti_no;

select tranz_member_nick, sum(tranz_money) as member_balance
	from hf_a_tranz	
	where auc_no = 29 and to_char(tranz_date,'YYYY-MM-DD HH24:MI') < (select end_date from hf_auc_goods where no = 29)
	group by tranz_member_nick
	order by sum(tranz_money) desc;
  desc hf_a_tranz;  
    select tranz_member_nick, sum(tranz_money) as member_balance
	from hf_a_tranz	
	where auc_no = 7 and to_char(tranz_date,'YYYY-MM-DD HH24:MI') < (select to_date(end_date,'YYYY-MM-DD HH24:MI') from hf_auc_goods where no = 7)
	group by tranz_member_nick
	order by sum(tranz_money) desc;
    
select to_date(end_date,'YYYY-MM-DD HH24:MI') from hf_auc_goods where no = 21;

update hf_auc_goods set end_date = '2020-10-03 05:20' where no = 29;

desc hf_a_tranz;
select * from Hf_M_Account;
update Hf_M_Account set balance = 980000 where Member_Nick = 'test';


select * from hf_member;
select * from hf_a_tranz;
select * from hf_a_account;
select    to_date(tranz_date,'YYYY-MM-DD HH24:MI:SS') as tranz_date, tranz_account_no, tranz_money,    tranz_member_nick, tranz_type, auc_no, member_balance   from hf_a_tranz  where auc_no = 4  order by tranz_date desc;
insert into hf_a_tranz(Tranz_Account_No, tranz_money, tranz_member_nick, tranz_type, auc_no, member_balance)
values('19381624', 1000, 'test', '입금', 3, 12000);



truncate table hf_auc_goods;
truncate table hf_a_account;
truncate table hf_a_tranz;
truncate table hf_goods_photo;
truncate table hf_notice;

delete hf_auc_goods;

select * from hf_member;
select * from hf_notice_setting;
select * from hf_notice  order by noti_no desc;
select * from hf_auc_goods where no = 27;

select *
		from HF_AUC_GOODS g,
		(select auc_no, first_bid_date
		from hf_a_account
		where bidder_nick = 'js1'
		);
SELECT 
		no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
		FROM (
		select *
		from HF_AUC_GOODS g,
		(select auc_no, first_bid_date
		from hf_a_account
		where bidder_nick = 'js1'
		) a
		where a.auc_no = g.no and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
        order by a.first_bid_date desc
		)
		union all
		SELECT 
		no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
		FROM (
		select *
		from
		HF_AUC_GOODS g,
		(select auc_no, first_bid_date
		from hf_a_account
		where bidder_nick = 'js1'
		) a
		where a.auc_no = g.no and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi') 
        order by a.first_bid_date desc
		);
        
        select auc_no, first_bid_date
		from hf_a_account
		where bidder_nick = 'js1'
		order by first_bid_date desc;



insert into hf_detail_code values(1,'인기경매','gc', 'hot','y');
insert into hf_detail_code values(2,'최신경매','gc', 'recommend','y');
insert into hf_detail_code values(3,'생활/가공식품','gc', 'life','y');
insert into hf_detail_code values(4,'여성의류','gc', 'women1','y');
insert into hf_detail_code values(5,'여성잡화','gc', 'women2','y');
insert into hf_detail_code values(6,'뷰티미용','gc', 'beauty','y');
insert into hf_detail_code values(7,'남성패션/잡화','gc', 'man1','y');
insert into hf_detail_code values(8,'디지털/가전','gc', 'digital','y');
insert into hf_detail_code values(9,'가구/인테리어','gc', 'furniture','y');
insert into hf_detail_code values(10,'게임/취미','gc', 'game','y');
insert into hf_detail_code values(11,'스포츠/레저','gc', 'sports','y');

select * from hf_like; 

