

-- hafy ȸ�� ���̺�
select * from hf_member;
select sysdate from dual;
DROP TABLE hf_member;

CREATE TABLE hf_member
(
    nickname    VARCHAR2(30) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    sex      VARCHAR2(5) NOT NULL,
    res_no    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(19) NOT NULL,
    address1    VARCHAR2(200) NOT NULL,   
    phone_company    VARCHAR2(10) NOT NULL,
    address2    VARCHAR2(200) NOT NULL,
    tranz_pwd VARCHAR2(30) NOT NULL   
    
);

CREATE UNIQUE INDEX ����Ƽ1_1_1_1_1_1_1_PK8 ON hf_member
( nickname );

ALTER TABLE hf_member
 ADD CONSTRAINT ����Ƽ1_1_1_1_1_1_1_PK8 PRIMARY KEY ( nickname )
 USING INDEX ����Ƽ1_1_1_1_1_1_1_PK8;
 
desc hf_member;


insert into hf_member values('123','123','123','123','123','123','123','123');
delete hf_member;
commit;

----------------------------------------------------------------------------------
-----ȸ�� ���� ���̺�

select * from hf_m_account;

truncate table hf_m_account;

DROP TABLE hf_m_account;

CREATE TABLE hf_m_account
(
    account_no    VARCHAR2(30) NOT NULL,
    bank    VARCHAR2(30) NOT NULL,
    member_nick    VARCHAR2(30) NOT NULL,
    balance     NUMBER(12) DEFAULT 1000000 not null
);

desc hf_m_account;
commit;
alter table hf_m_account rename column nickname to member_nick;

alter table hf_m_account add balance NUMBER(12) DEFAULT 1000000 not null;

CREATE UNIQUE INDEX ����Ƽ2_PK ON hf_m_account
( account_no );

ALTER TABLE hf_m_account
 ADD CONSTRAINT ����Ƽ2_PK PRIMARY KEY ( account_no )
 USING INDEX ����Ƽ2_PK;
 
 ALTER TABLE hf_m_account ADD CONSTRAINT hf_m_account_member_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname) on delete cascade;

desc hf_member;
 
 commit;
 
 
----------------------------------------------------------------------------------------------------------------------------------
 --��� ��ǰ ���̺�----------------------------------------------------------------

select * from hf_auc_goods;
select * from hf_goods_photo;
select no, save_name    from hf_goods_photo    where auc_no = 120;

select * from 
(select * from hf_goods_photo where auc_no = 114 order by no) where rownum = 1;

desc hf_goods_photo;
		select save_name from 
(select save_name from hf_goods_photo where auc_no = 120 order by no) where rownum = 1;

select * from hf_goods_photo;

select * from hf_goods_photo;

select a.no, a.name, a.end_date, a.start_price, g.save_name, g.no  from hf_auc_goods a
join hf_goods_photo g
on a.no = g.auc_no;

delete hf_auc_goods;
commit;
truncate table hf_goods_photo;
select * from hf_goods_photo;

desc hf_auc_goods;
select sysdate from dual;
select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')) from dual;

DROP TABLE hf_auc_goods;

CREATE TABLE hf_auc_goods
(
    category    VARCHAR2(100) NOT NULL,
    reg_date    VARCHAR2(100) default sysdate NOT NULL ,
    name    VARCHAR2(30) NOT NULL,
    no    NUMBER(5) NOT NULL,
    method    VARCHAR2(20) NOT NULL,
    start_price    NUMBER(12) NOT NULL,
    start_date    VARCHAR2(100) NOT NULL,
    end_date    VARCHAR2(100) NOT NULL,
    detail    VARCHAR2(1000) NOT NULL,
    member_nick    VARCHAR2(30) NOT NULL,
    view_cnt NUMBER(10) DEFAULT 0 NOT NULL,
    like_cnt NUMBER(10) DEFAULT 0 NOT NULL,
    winning_bid NUMBER(12) DEFAULT 0 NOT NULL,
    refund_status VARCHAR2(50) DEFAULT '��ȯ��' NOT NULL,
    purchase_confirm VARCHAR2(50) DEFAULT '��Ȯ��' NOT NULL,
    confirm_date VARCHAR2(100),
    return_request_date varchar2(100)
);

alter table hf_auc_goods add return_request_date varchar2(100);

alter table hf_auc_goods modify detail VARCHAR2(1000); 
alter table hf_auc_goods add confirm_date VARCHAR2(100);

alter table hf_auc_goods modify purchase_confirm default '��Ȯ��'; 
alter table hf_auc_goods add purchase_confirm varchar2(50) default '������' not null;
select to_char(sysdate) from dual;

alter table hf_auc_goods add view_cnt number(10) default 0 not null;
alter table hf_auc_goods add like_cnt number(10) default 0 not null;
alter table hf_auc_goods add winning_bid NUMBER(12) DEFAULT 0 NOT NULL;


CREATE UNIQUE INDEX ����Ƽ1_1_1_1_1_1_1_1_PK1 ON hf_auc_goods
( no );

ALTER TABLE hf_auc_goods
 ADD CONSTRAINT ����Ƽ1_1_1_1_1_1_1_1_PK1 PRIMARY KEY ( no )
 USING INDEX ����Ƽ1_1_1_1_1_1_1_1_PK1;

create sequence seq_hf_auc_goods_no nocache;

select seq_hf_auc_goods_no.nextval from dual;
commit;
rollback;

ALTER TABLE hf_auc_goods ADD CONSTRAINT hf_auc_goods_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname);


----------------------------------------------------------------------------------------------------------------------------------------------------
--��ǰ ���� ���̺� ---------------------------------------------------------------
select * from hf_goods_photo;
DROP TABLE hf_goods_photo;

desc hf_goods_photo;


CREATE TABLE hf_goods_photo
(
    no    NUMBER(10) NOT NULL,
    ori_name    VARCHAR2(200) NOT NULL,
    save_name    VARCHAR2(200) NOT NULL,
    file_size    NUMBER(15) NOT NULL,
    auc_no    NUMBER(5) NOT NULL
);


CREATE SEQUENCE seq_hf_goods_photo_no NOCACHE;


ALTER TABLE hf_goods_photo ADD CONSTRAINT hf_goods_photo_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no) on delete cascade;

CREATE UNIQUE INDEX ����Ƽ2_PK1 ON hf_goods_photo
( no );

ALTER TABLE hf_goods_photo
 ADD CONSTRAINT ����Ƽ2_PK1 PRIMARY KEY ( no )
 USING INDEX ����Ƽ2_PK1;


commit;

------------------------------------------------------------------------------------------
---���ƿ� ���------------------------------------------------------------------

DROP TABLE hf_like;
select * from hf_like;

CREATE TABLE hf_like
(
    member_nick    VARCHAR2(100) NOT NULL,
    auc_no    NUMBER(5) NOT NULL,
    reg_date VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') NOT NULL
);
ALTER TABLE hf_like modify reg_date VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss');

desc hf_like;

select * from hf_like;

CREATE UNIQUE INDEX ����Ƽ2_PK2 ON hf_like
( auc_no,member_nick );

ALTER TABLE hf_like
 ADD CONSTRAINT ����Ƽ2_PK2 PRIMARY KEY ( auc_no,member_nick )
 USING INDEX ����Ƽ2_PK2;
 
 ALTER TABLE hf_like ADD CONSTRAINT hf_like_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no) on delete cascade;

commit;


----��Ÿ��Ӱ���------------------------------------------------------------------------

DROP TABLE hf_a_account;
select * from hf_a_account;
CREATE TABLE hf_a_account
(
    bidder_nick    VARCHAR2(100) NOT NULL,
    auc_no    NUMBER(5) NOT NULL,
    bid_money NUMBER(12) DEFAULT 0 NOT NULL,
    first_bid_date varchar2(100) not null
);

ALTER TABLE hf_a_account rename column firt_bid_date to first_bid_date;
ALTER TABLE hf_a_account ADD bid_money NUMBER(12) DEFAULT 0 NOT NULL;

CREATE UNIQUE INDEX ����Ƽ1_1_1_1_1_1_1_PK2 ON hf_a_account
( auc_no,bidder_nick );

ALTER TABLE hf_a_account
 ADD CONSTRAINT ����Ƽ1_1_1_1_1_1_1_PK2 PRIMARY KEY ( auc_no,bidder_nick )
 USING INDEX ����Ƽ1_1_1_1_1_1_1_PK2;
 
  ALTER TABLE hf_a_account ADD CONSTRAINT hf_a_account_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no);


---��Ÿ��Ӱ��� �ŷ�����------------------------------------------------------------------------

DROP TABLE hf_a_tranz;

select * from hf_a_tranz;
delete hf_a_tranz;

CREATE TABLE hf_a_tranz
(
    tranz_date    varchar2(100) DEFAULT SYSDATE NOT NULL,
    tranz_account_no    VARCHAR2(40) NOT NULL,
    tranz_money    NUMBER(12) NOT NULL,
    tranz_member_nick    VARCHAR2(20) NOT NULL,
    tranz_type    VARCHAR2(10) NOT NULL,
    auc_no    NUMBER(12) NOT NULL,
    member_balance NUMBER(12) NOT NULL
);

alter table hf_a_tranz modify (tranz_date varchar2(100)  DEFAULT sysdate );

alter table hf_a_tranz add member_balance NUMBER(12) NOT NULL;

CREATE UNIQUE INDEX ����Ƽ1_1_1_1_1_PK ON hf_a_tranz
( auc_no,tranz_type,tranz_account_no,tranz_date );

ALTER TABLE hf_a_tranz
 ADD CONSTRAINT ����Ƽ1_1_1_1_1_PK PRIMARY KEY ( auc_no,tranz_type,tranz_account_no,tranz_date )
 USING INDEX ����Ƽ1_1_1_1_1_PK;

    
-------�׷��ڵ�---------------------------------------------- --------------------
DROP TABLE hf_group_code;

CREATE TABLE hf_group_code
(
    code_category    VARCHAR2(10) NOT NULL,
    category_name    VARCHAR2(30) NOT NULL,
    usage            VARCHAR2(10) NOT NULL
);

CREATE UNIQUE INDEX ����Ƽ1_1_1_PK ON hf_group_code
( code_category );

ALTER TABLE hf_group_code
 ADD CONSTRAINT ����Ƽ1_1_1_PK PRIMARY KEY ( code_category )
 USING INDEX ����Ƽ1_1_1_PK;


-------�׷���ڵ�------------------------------------------------------------------
DROP TABLE hf_detail_code;

CREATE TABLE hf_detail_code
(
    code_no    number(5) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL,
    code_category    VARCHAR2(10) NOT NULL,
    uri_name        VARCHAR2(100) NOT NULL,
    usage    VARCHAR2(5) DEFAULT 'y' NOT NULL
);

alter table hf_detail_code rename column url_name to uri_name;

CREATE UNIQUE INDEX ����Ƽ1_1_1_1_1_1_PK6 ON hf_detail_code
( code_category,code_no );

alter table hf_detail_code
add unique (uri_name);

ALTER TABLE hf_detail_code
 ADD CONSTRAINT ����Ƽ1_1_1_1_1_1_PK6 PRIMARY KEY ( code_category,code_no )
 USING INDEX ����Ƽ1_1_1_1_1_1_PK6;
 
ALTER TABLE hf_detail_code
    ADD CONSTRAINT hf_detail_code_category_fk
    FOREIGN KEY(code_category) REFERENCES hf_group_code(code_category);




----�˸�----------------------------------------------------------------------------
DROP TABLE hf_notice;

CREATE TABLE hf_notice
(
    noti_no    NUMBER(10) NOT NULL,
    noti_member_nick    VARCHAR2(50) NOT NULL,
    noti_type    VARCHAR2(100) NOT NULL,
    noti_content_no    NUMBER(10) NOT NULL,
    noti_msg    VARCHAR2(500) NOT NULL,
    noti_method    VARCHAR2(200) DEFAULT 'app' NOT NULL ,
    noti_datetime    VARCHAR2(200) DEFAULT TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss') NOT NULL,
    noti_read_datetime    VARCHAR2(200)
    
);

ALTER TABLE hf_notice rename column noti_url to noti_method;
update hf_notice set noti_method = 'app';
commit;
ALTER TABLE hf_notice modify noti_method VARCHAR2(200) DEFAULT 'app' NOT NULL ;


ALTER TABLE hf_notice ADD CONSTRAINT hf_notice_noti_member_nick_fk   
FOREIGN KEY(noti_member_nick) REFERENCES hf_member(nickname) on delete cascade;

CREATE UNIQUE INDEX ����Ƽ2_PK3 ON hf_notice
( noti_no );

ALTER TABLE hf_notice
 ADD CONSTRAINT ����Ƽ2_PK3 PRIMARY KEY ( noti_no )
 USING INDEX ����Ƽ2_PK3;
 
 create sequence seq_hf_notice_no nocache;



---�˸� ���� --------------------------------------------------------------------
DROP TABLE hf_notice_setting;

CREATE TABLE hf_notice_setting
(
    member_nick    VARCHAR2(100) NOT NULL,
    bidder_bid_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    bidder_imminent_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    bidder_imminent_time    number(10) DEFAULT 60 NOT NULL,
    bidder_closed_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    bidder_return_approve_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    seller_bid_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    seller_like_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    seller_closed_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    seller_purchase_confirm_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    seller_return_request_notice    VARCHAR2(20) DEFAULT 'true' NOT NULL,
    sms_notice VARCHAR2(20) DEFAULT 'true' NOT NULL
);


ALTER TABLE hf_notice_setting add sms_notice VARCHAR2(20) DEFAULT 'true' NOT NULL;

ALTER TABLE hf_notice_setting modify bidder_imminent_time number(10);

ALTER TABLE hf_notice_setting add bidder_return_approve_notice VARCHAR2(20) DEFAULT 'true' NOT NULL;
ALTER TABLE hf_notice_setting add seller_return_request_notice VARCHAR2(20) DEFAULT 'true' NOT NULL;

ALTER TABLE hf_notice_setting ADD CONSTRAINT hf_notice_setting_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname) on delete cascade;

CREATE UNIQUE INDEX ����Ƽ2_PK4 ON hf_notice_setting
( member_nick );

ALTER TABLE hf_notice_setting
 ADD CONSTRAINT ����Ƽ2_PK4 PRIMARY KEY ( member_nick )
 USING INDEX ����Ƽ2_PK4;
 
 
-- ȯ�ұ� ------------------------------------------------------------------------- 
 DROP TABLE hf_return_goods;

CREATE TABLE hf_return_goods
(
    auc_no    NUMBER(5) NOT NULL,
    title    VARCHAR2(100) NOT NULL,
    detail    VARCHAR2(1000) NOT NULL,
    writer    VARCHAR2(100) NOT NULL,
    reg_date    VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') NOT NULL 
);

CREATE UNIQUE INDEX ����Ƽ2_PK5 ON hf_return_goods
( auc_no );

ALTER TABLE hf_return_goods
 ADD CONSTRAINT ����Ƽ2_PK5 PRIMARY KEY ( auc_no )
 USING INDEX ����Ƽ2_PK5;
 
ALTER TABLE hf_return_goods ADD CONSTRAINT hf_return_goods_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no);


-- ȯ�һ��� -------------------------------------------------------------------------
DROP TABLE hf_return_photo;

CREATE TABLE hf_return_photo
(
    no    NUMBER(10) NOT NULL,
    ori_name    VARCHAR2(200) NOT NULL,
    save_name    VARCHAR2(200) NOT NULL,
    file_size    NUMBER(10) NOT NULL,
    auc_no    NUMBER(5) NOT NULL
    
);

CREATE UNIQUE INDEX ����Ƽ2_1_PK1 ON hf_return_photo
( no );

ALTER TABLE hf_return_photo
 ADD CONSTRAINT ����Ƽ2_1_PK1 PRIMARY KEY ( no )
 USING INDEX ����Ƽ2_1_PK1;
 
 ALTER TABLE hf_return_photo ADD CONSTRAINT hf_return_photo_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_return_goods(auc_no);

create sequence seq_hf_return_photo_no nocache;


















