delete hf_a_account;
delete hf_m_account;
delete hf_a_tranz;
delete hf_like;
delete hf_member;
delete hf_auc_goods;
delete HF_GOODS_PHOTO;
delete HF_return_goods;
delete HF_return_photo;
delete HF_notice;
commit;

select * from hf_a_tranz;
select * from hf_a_account;

select sysdate from dual;

select * from hf_like;
select * from hf_a_account;

select to_date(end_date,'yyyy-mm-dd hh24:mi:ss') from Hf_Auc_Goods;

select * from hf_return_goods;
select * from hf_return_photo;

select to_char(sysdate) from dual;

select * from hf_a_account order by auc_no desc;
select * from hf_m_account order by MEMBER_NICK;
select * from hf_member; 
select * from hf_a_tranz order by tranz_date;
select * from HF_AUC_GOODS order by no desc;
update HF_AUC_GOODS set end_date = '2020-09-30 11:45' where no = 252;
commit;
rollback;

select * from hf_like;
update hf_auc_goods set start_date = '2020-09-30 07:00';

select
		no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
		from hf_auc_goods
		where end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		order by reg_date desc;

select 
		no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
		from
		(select *
		from hf_auc_goods
		where member_nick = 'nacastle' and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		order by reg_date desc)
		union all
		select 
        no, name, category, reg_date, to_date(start_date,'yyyy-mm-dd hh24:mi:ss') as start_date, to_date(end_date,'yyyy-mm-dd hh24:mi:ss') as end_date, start_price,
		member_nick, method, detail,
		view_cnt, like_cnt , winning_bid
        from
		(select *
		from hf_auc_goods
		where member_nick = 'nacastle' and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		order by end_date desc);
        
select *
		from hf_auc_goods
		where member_nick = 'nacastle' and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		order by reg_date desc;
select * from
		(select *
		from hf_auc_goods
		where member_nick = 'nacastle' and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		order by reg_date desc)
		union all
		select * from
		(select *
		from hf_auc_goods
		where member_nick = 'nacastle' and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		order by end_date desc);

select * from HF_AUC_GOODS where no = 249;
update hf_auc_goods set end_date = '2020-09-26 04:14' where no = 177;
commit;
select * from hf_auc_goods
		where end_date = TO_CHAR(SYSDATE -
		2 ,'yyyy-mm-dd hh24:mi');
select sysdate from dual;
select TO_CHAR(SYSDATE + 1 ,'yyyy/mm/dd hh24:mi:ss') from dual;
        
select * from hf_auc_goods where no = 218;
where end_date = TO_CHAR(SYSDATE + 60/24/60 ,'yyyy-mm-dd hh24:mi');
select sysdate from dual;
select TO_CHAR(SYSDATE + 60/24/60 ,'yyyy-mm-dd hh24:mi:ss') from dual;
select * from hf_like;
select * from hf_detail_code;
SELECT * FROM HF_NOTICE_SETTING;
SELECT * FROM HF_NOTICE order by noti_no desc;
select * from hf_like where auc_no = 228;
        
		select *
		from HF_AUC_GOODS 
		where member_nick = 'drziq' and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		ORDER BY REG_DATE desc;

		select *
		from HF_AUC_GOODS 
		where member_nick = 'drziq' and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi')
		ORDER BY REG_DATE desc;
        
		select *
		 from hf_auc_goods
		 where start_date <= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') and  
		 		end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI');
update hf_auc_goods set Purchase_Confirm = '미확정' where no = 219;

update hf_auc_goods set Purchase_Confirm = '미확정' where no = 220;
update hf_auc_goods set return_request_date = '' where no = 219;
update hf_auc_goods set return_request_date = '' where no = 220;
commit;
delete hf_Return_goods where title = 'ㅁㅇㄴㄹ';
rollback;
select * from hf_return_goods;
select * from hf_goods_photo order by auc_no desc;



delete hf_return_photo;
update hf_auc_goods 
set  confirm_date = to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), purchase_confirm = '확정' where no = 219;
update hf_auc_goods 
set  confirm_date = to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), purchase_confirm = '확정' where no = 218;
select purchase_confirm, confirm_date, return_request_date from HF_AUC_GOODS where no in(227,220,218) order by no desc;

select * from hf_return_goods;
delete hf_return_goods where title = 'ㅁㅇㅇㄼㄷ';


rollback;

update hf_auc_goods 
			set purchase_confirm = #{content} and confirm_date = to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
		where no = #{aucNo}

select * from Hf_A_Tranz;
	select *
	from 
	    HF_AUC_GOODS g,
	    (select auc_no from HF_A_ACCOUNT
	    where bidder_nick = 'nacastle') s
	where s.auc_no = g.no and g.end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi')
	order by g.end_date desc;
                
select * 
    from HF_AUC_GOODS g, 
        (select auc_no
             from hf_a_account
                where bidder_nick = 'nacastle') a
                where a.auc_no = g.no and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi') ORDER BY REG_DATE desc;
                
select * from hf_auc_goods
		where
        (select bidder_imminent_notice from HF_NOTICE_SETTING where member_nick = 'test4') = 'true' and 
        no = 227 and end_date = TO_CHAR(SYSDATE + 32/24/60 ,'yyyy-mm-dd hh24:mi');

select bidder_imminent_notice from HF_NOTICE_SETTING where member_nick = 'test4';

		update hf_notice 
			set noti_read_datetime = null;

select *
		 from hf_notice
		 where noti_member_nick = 'nsq3391'
		 order by noti_datetime desc;
	select *
		 from hf_notice
		 where noti_member_nick = 'nsq3391'
		 order by noti_datetime desc;
select * from hf_notice;
select count(noti_no)
		 from hf_notice
		 where noti_member_nick = 'nsq3391' and noti_read_datetime is null;
	select *
			from hf_like
		where member_nick = 'nacastle'
		 order by reg_date desc;
         
         insert into hf_like(member_nick, auc_no, reg_date) 
			values('nacastle', 161, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'));
            rollback;
            
            delete hf_like where auc_no = 161;
            
select *
			from hf_like
		where member_nick = 'nacastle' and auc_no = 161
		 order by to_date(reg_date,'YYYY-MM-DD HH24:MI:SS') desc;
         
         select *
			from hf_like
		where member_nick = 'nacastle';
		 
         
         select *
			from hf_like
		where member_nick = 'nacastle';
		 
         
         select sysdate from dual;

select 
		to_char(tranz_date,'YYYY-MM-DD HH24:MI:SS') as tranz_date, tranz_account_no, tranz_money, 
		tranz_member_nick, tranz_type, auc_no, member_balance 
	from hf_a_tranz
	where auc_no = 181
	order by tranz_date desc;



        select *
		 from hf_auc_goods
		 where end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		 order by reg_date desc;

update HF_AUC_GOODS set END_DATE = '2020-09-24 12:09' where no = 227;


update hf_notice 
			set noti_read_datetime = to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
		where noti_member_nick = 'nacastle' and noti_read_datetime is null;
        rollback;

select * from hf_notice where noti_member_nick = 'nsq3391';
select count(no)
		 from hf_auc_goods g
		 where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI');
		

        select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt , winning_bid, 
                (select count(*) from hf_a_tranz t where t.auc_no = g.no and tranz_type = '입금') as bid_cnt,
                (select count(*) from hf_a_account a where a.auc_no = g.no) as bidder_cnt
		 from hf_auc_goods g
		 where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		 order by bidder_cnt desc, bid_cnt desc, like_cnt desc, view_cnt desc, reg_date desc;
------------레이지 로딩-----------------------------

SELECT * 
FROM
    ( 
    SELECT ROWNUM AS RNUM, A.* 
    FROM (
        select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt , winning_bid, 
                (select count(*) from hf_a_tranz t where t.auc_no = g.no and tranz_type = '입금') as bid_cnt,
                (select count(*) from hf_a_account a where a.auc_no = g.no) as bidder_cnt
		 from hf_auc_goods g
		 where g.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		 order by bidder_cnt desc, bid_cnt desc, like_cnt desc, view_cnt desc, reg_date desc
            ) A 
    WHERE ROWNUM <= 몇개로드? * ?
    )
WHERE RNUM > 몇개로드? *(?-1);
                        
-----------------------------------------------------            

SELECT * FROM TEMP_VIEW
ORDER BY REG_DATE DESC ;

SELECT * FROM (
select * 
    from HF_AUC_GOODS g, 
        (select auc_no
             from hf_a_account
                where bidder_nick = 'nacastle') a
                where a.auc_no = g.no and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi') ORDER BY REG_DATE      
) 
union all
SELECT * FROM (
 select * 
    from 
        HF_AUC_GOODS g, 
        (select auc_no
             from hf_a_account
                where bidder_nick = 'nacastle') a
                where a.auc_no = g.no and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi') order by reg_date
);
            ---------------
            
            	select *
		 from hf_auc_goods
		 where end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		 order by reg_date desc;
         
------------------------------         
select * from             
(select *
		 from hf_auc_goods
			where member_nick = 'nacastle' and end_date > to_char(sysdate, 'yyyy-mm-dd hh24:mi')
			order by reg_date desc)  
        union all    
select * from
(select *
		 from hf_auc_goods
			where member_nick = 'nacastle' and end_date <= to_char(sysdate, 'yyyy-mm-dd hh24:mi')
			order by reg_date desc);                                   
            
            
		
        select *
		 from hf_auc_goods
			where member_nick = 'nacastle'
			order by refund_status, reg_date desc ;
            
        select auc_no
		 from hf_a_account
			where bidder_nick = 'nacastle';
            
          

            

update HF_M_ACCOUNT set balance = 1000000;

SELECT * FROM V$VERSION;
update HF_DETAIL_CODE set code_name = '최신경매', uri_name = 'recent' where uri_name = 'recommend';

select * from 
(
select *
from hf_auc_goods g
where g.name like '%test%' or g.detail like '%test%' 
order by g.reg_date desc
) a
where a.end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI');


			select *
		 from hf_auc_goods
		 where end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
		 order by reg_date desc;
select no
	from HF_AUC_GOODS
	where end_date <= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') and REFUND_STATUS = '미환급' and winning_bid != 0;
select no
from HF_AUC_GOODS
where end_date <= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI') and REFUND_STATUS = '미환급';

-- for문 돌면서 환급
update 

update HF_AUC_GOODS set refund_status = '환급' where auc_no = #{aucNo};


rollback;
select * from hf_m_account where member_nick = 'nacastle';
delete hf_a_tranz;

update HF_AUC_GOODS set purchase_confirm = '미확정';



		select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt, winning_bid
		 from hf_auc_goods
			where category = 'game' and end_date > TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
			order by reg_date desc;
            
select *
from HF_AUC_GOODS g
where g.end_date < TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
    and 

    and no = (최고입찰가의 주인공이 나인 번호);

select auc_no from HF_A_TRANZ
where;

select *
from HF_AUC_GOODS g
where g.end_date < TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI')
    and g.no = (select auc_no from;



select * 
from HF_A_TRANZ at,
(
    select tranz_member_nick, auc_no from
    (	
        select tranz_member_nick,  sum(tranz_money) as member_balance, auc_no
        from hf_a_tranz t	
        where t.auc_no = at.auc_no and to_char(t.tranz_date,'YYYY-MM-DD HH24:MI') < (select g2.end_date from hf_auc_goods g2 where g2.no = at.auc_no)
        group by t.tranz_member_nick, t.auc_no
        order by sum(t.tranz_money) desc
    ) r
    where rownum = 1
) 
;

select auc_no
from 
    HF_AUC_GOODS g,
    (select auc_no from HF_A_ACCOUNT
    where bidder_nick = 'nacastle') s
where s.auc_no = g.no and g.end_date < to_char(sysdate, 'yyyy-mm-dd hh24:mi')
order by auc_no desc
;

select auc_no from HF_A_ACCOUNT
where bidder_nick = 'nacastle';


-- 얘가 그나마 쓸모있는 쿼리
select tranz_member_nick, auc_no from
(	
	select tranz_member_nick,  sum(tranz_money) as member_balance, auc_no
	from hf_a_tranz t	
	where t.auc_no = 131 and to_char(t.tranz_date,'YYYY-MM-DD HH24:MI') < (select g2.end_date from hf_auc_goods g2 where g2.no = 131)
	group by t.tranz_member_nick, t.auc_no
	order by sum(t.tranz_money) desc
) r
where rownum = 1
;


select *
from hf_a_tranz t2
where;

select tranz_member_nick,  sum(tranz_money) as member_balance, auc_no
	from hf_a_tranz t	
	where t.auc_no = 131 and to_char(t.tranz_date,'YYYY-MM-DD HH24:MI') < (select g2.end_date from hf_auc_goods g2 where g2.no = 131)
	group by t.tranz_member_nick, t.auc_no
	order by sum(t.tranz_money) desc;

    
    

select  TO_char(SYSDATE,'YYYY-MM-DD HH24:MI:SS') from dual;
delete hf_a_tranz;
select TO_char(tranz_date,'YYYY-MM-DD HH24:MI:SS') from hf_a_tranz;
rollback;

-- 입출금내역 테이블에서 => 경매마감 시간 전 / ('입금'인 것들) / 입금액 sum / group by 닉네임
select tranz_member_nick, sum(tranz_money) as member_balance
from hf_a_tranz
where auc_no = 131 and to_char(tranz_date,'YYYY-MM-DD HH24:MI') < (select end_date from hf_auc_goods where no = 131)
group by tranz_member_nick
order by sum(tranz_money) desc;

select end_date from hf_auc_goods where no = 131;


insert into hf_a_tranz values(sysdate, '123', 1000, 'nacastle','입금',131,145400);
rollback;

insert into hf_notice_setting(member_nick) values('nacastle');
insert into hf_notice_setting(member_nick) values('nsq3391');
insert into hf_notice_setting(member_nick) values('harnival');
insert into hf_notice_setting(member_nick) values('kyle');
insert into hf_notice_setting(member_nick) values('stlecana');
insert into hf_notice_setting(member_nick) values('lyla');
insert into hf_notice_setting(member_nick) values('test3');
insert into hf_notice_setting(member_nick) values('test4');
insert into hf_notice_setting(member_nick) values('drziq');
 
select * from hf_member;

select * from hf_notice_setting;





update hf_auc_goods set end_date = '2020-09-11 02:20' where no = 131;


select * from hf_a_tranz where auc_no = 132;

		select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt , winning_bid, 
                (select count(*) from hf_a_tranz t where t.auc_no = g.no and tranz_type = '입금') as bid_cnt,
                (select count(*) from hf_a_account a where a.auc_no = g.no) as bidder_cnt
		 from hf_auc_goods g
		 where to_date(g.end_date) > sysdate
		 order by bidder_cnt desc, bid_cnt desc, like_cnt desc, view_cnt desc, reg_date desc;
         

	select no, name, 
    (select code_name from hf_detail_code where uri_name =
        (select category from hf_auc_goods where no = 133)
    ) as category
    , reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt, winning_bid
		 from hf_auc_goods
			where no = 133;


select * from HF_AUC_GOODS
where name like '%사진%' or detail like ' ';


select * from HF_AUC_GOODS
 where (name, detail) in (('사진','tk'),('123','123'));


select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt , winning_bid
		 from hf_auc_goods
		 order by reg_date desc;
         
         		select *
			from hf_like
		where member_nick = 'nacastle'
		 order by auc_no desc;
         
	select member_nick, auc_no
			from hf_like
		where member_nick = 'nacastle' or auc_no = 124;
	

insert into hf_m_account values('555-222','하나','nacastle',1000000);
insert into hf_m_account values('777-223','하나','nacastle',1000000);
insert into hf_m_account values('912-312','신한','nacastle',1000000);
insert into hf_m_account values('1923-222','기업','nacastle',1000000);


delete hf_m_account
	where account_no = '123';
    
    rollback;

delete hf_auc_goods where no = 128;


delete HF_A_ACCOUNT;
delete HF_A_TRANZ;
delete HF_AUC_GOODS;
delete HF_GOODS_PHOTO;
delete HF_LIKE;



		select *
		 from hf_auc_goods
			where member_nick = 'nacastle'
			order by reg_date  desc;


	select *
	from hf_a_account
	where auc_no = 123
	order by bid_money desc;

desc hf_a_tranz;

desc hf_group_code;
desc hf_detail_code;

select * 
		from hf_detail_code 
		where code_category = 'gc' and usage = 'y' 
		order by code_no;


--그룹코드 관련------------------------------------------------------------------
insert into hf_group_code values('gc','경매상품 카테고리','y');

--그룹상세코드 관련
delete hf_detail_code;

insert into hf_detail_code values(1,'인기경매','gc', 'hot','y');
insert into hf_detail_code values(2,'추천경매','gc', 'recommend','y');
insert into hf_detail_code values(3,'생활/가공식품','gc', 'life','y');
insert into hf_detail_code values(4,'여성의류','gc', 'women1','y');
insert into hf_detail_code values(5,'여성잡화','gc', 'women2','y');
insert into hf_detail_code values(6,'뷰티미용','gc', 'beauty','y');
insert into hf_detail_code values(7,'남성패션/잡화','gc', 'man1','y');
insert into hf_detail_code values(8,'디지털/가전','gc', 'digital','y');
insert into hf_detail_code values(9,'가구/인테리어','gc', 'furniture','y');
insert into hf_detail_code values(10,'게임/취미','gc', 'game','y');
insert into hf_detail_code values(11,'스포츠/레저','gc', 'sports','y');
insert into hf_detail_code values(11,'스포츠/레저','gc', 'sports','y');




select code_name from hf_detail_code where code_category = 'gc' order by code_no;


insert into hf_a_tranz values('2020-12-12', '123-123', 10000, 'kiwi', '입금', 14, 10000); 


insert into hf_a_tranz values('2020-12-14', '123-123', 10000, 'kiwi', '입금', 14, 
(select bid_money from hf_a_account where bidder_nick = 'kiwi' and auc_no = 124 ) + 10000
); 

select bid_money from hf_a_account where bidder_nick = 'kiwi' and auc_no = 124;
		select * 
		from hf_detail_code 
		where uri_name = 'women1';

rollback;
select *
	from hf_a_account
	where bidder_nick = 'kiwi' and auc_no = 125;

	select *
		from hf_a_tranz
	where auc_no = 123
	order by tranz_date desc;

delete hf_m_account where member_nick = 'kiwi';
delete hf_member where nickname = 'kiwi';


delete hf_like where MEMBER_NICK = 'kiwi';

select * from hf_like;

delete hf_like;
select * from hf_auc_goods;

update HF_AUC_GOODS set like_cnt = 0;


select * from hf_goods_photo;
select * from hf_auc_goods;

select no, auc_no as aucNo, save_name as saveName, ori_name as oriName, file_size as fileSize
		 from hf_goods_photo
		 where auc_no = 120;
         
select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt 
		 from hf_auc_goods
			where no = 120;
            
update hf_m_account set balance = 1000000 where member_nick ='nacastle';

select * from hf_m_account;




select no, ori_name, auc_no
		 from hf_goods_photo
		 where auc_no = 120;
         
         select *
		 from hf_goods_photo
		 where auc_no = 120;

desc hf_goods_photo;


         