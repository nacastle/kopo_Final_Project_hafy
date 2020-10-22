

-- hafy 회원 테이블

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

ALTER TABLE hf_member ADD CONSTRAINT uk_hf_member_phone UNIQUE(phone);

select * from hf_member;

update hf_member set phone = '01042115172' where nickname = 'jk';
update hf_member set phone = '01042113372' where nickname = 'john';
update hf_member set phone = '01042445172' where nickname = 'daniel';
update hf_member set phone = '01042166172' where nickname = 'thomas';
update hf_member set phone = '01042177172' where nickname = 'adam';
update hf_member set phone = '01042115332' where nickname = 'hana1';
update hf_member set phone = '01042115122' where nickname = 'hana2';
update hf_member set phone = '01042116332' where nickname = 'hana3';
update hf_member set phone = '01054152172' where nickname = 'hana4';
update hf_member set phone = '01042115171' where nickname = 'nacastle';
update hf_member set phone = '01054117572' where nickname = 'hana5';
update hf_member set phone = '01054119972' where nickname = 'hana6';
commit;



CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_1_PK8 ON hf_member
( nickname );

ALTER TABLE hf_member
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_1_PK8 PRIMARY KEY ( nickname )
 USING INDEX 엔터티1_1_1_1_1_1_1_PK8;
 
----------------------------------------------------------------------------------
-----회원 계좌 테이블

DROP TABLE hf_m_account;

CREATE TABLE hf_m_account
(
    account_no    VARCHAR2(30) NOT NULL,
    bank    VARCHAR2(30) NOT NULL,
    member_nick    VARCHAR2(30) NOT NULL,
    balance     NUMBER(12) DEFAULT 10000000 not null
);


alter table hf_m_account rename column nickname to member_nick;

alter table hf_m_account modify balance DEFAULT 10000000;


CREATE UNIQUE INDEX 엔터티2_PK ON hf_m_account
( account_no );

ALTER TABLE hf_m_account
 ADD CONSTRAINT 엔터티2_PK PRIMARY KEY ( account_no )
 USING INDEX 엔터티2_PK;
 
 ALTER TABLE hf_m_account ADD CONSTRAINT hf_m_account_member_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname) on delete cascade;

 
----------------------------------------------------------------------------------------------------------------------------------
 --경매 상품 테이블----------------------------------------------------------------
DROP TABLE hf_auc_goods;

CREATE TABLE hf_auc_goods
(
    category    VARCHAR2(100) NOT NULL,
    reg_date    VARCHAR2(100) default sysdate NOT NULL ,
    name    VARCHAR2(100) NOT NULL,
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
    refund_status VARCHAR2(50) DEFAULT '미환급' NOT NULL,
    purchase_confirm VARCHAR2(50) DEFAULT '미확정' NOT NULL,
    confirm_date VARCHAR2(100),
    return_request_date varchar2(100)
);

alter table hf_auc_goods add return_request_date varchar2(100);

alter table hf_auc_goods modify name VARCHAR2(100); 
alter table hf_auc_goods modify detail VARCHAR2(1000); 
alter table hf_auc_goods add confirm_date VARCHAR2(100);

alter table hf_auc_goods modify purchase_confirm default '미확정'; 

alter table hf_auc_goods add view_cnt number(10) default 0 not null;
alter table hf_auc_goods add like_cnt number(10) default 0 not null;
alter table hf_auc_goods add winning_bid NUMBER(12) DEFAULT 0 NOT NULL;

CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_1_1_PK1 ON hf_auc_goods
( no );

ALTER TABLE hf_auc_goods
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_1_1_PK1 PRIMARY KEY ( no )
 USING INDEX 엔터티1_1_1_1_1_1_1_1_PK1;

create sequence seq_hf_auc_goods_no nocache;

ALTER TABLE hf_auc_goods ADD CONSTRAINT hf_auc_goods_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname);


----------------------------------------------------------------------------------------------------------------------------------------------------
--상품 사진 테이블 ---------------------------------------------------------------

DROP TABLE hf_goods_photo;
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

CREATE UNIQUE INDEX 엔터티2_PK1 ON hf_goods_photo
( no );

ALTER TABLE hf_goods_photo
 ADD CONSTRAINT 엔터티2_PK1 PRIMARY KEY ( no )
 USING INDEX 엔터티2_PK1;

------------------------------------------------------------------------------------------
---좋아요 목록------------------------------------------------------------------

DROP TABLE hf_like;

CREATE TABLE hf_like
(
    member_nick    VARCHAR2(100) NOT NULL,
    auc_no    NUMBER(5) NOT NULL,
    reg_date VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') NOT NULL
);
ALTER TABLE hf_like modify reg_date VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss');

CREATE UNIQUE INDEX 엔터티2_PK2 ON hf_like
( auc_no,member_nick );

ALTER TABLE hf_like
 ADD CONSTRAINT 엔터티2_PK2 PRIMARY KEY ( auc_no,member_nick )
 USING INDEX 엔터티2_PK2;
 
 ALTER TABLE hf_like ADD CONSTRAINT hf_like_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no) on delete cascade;


----경매모임계좌------------------------------------------------------------------------

DROP TABLE hf_a_account;

CREATE TABLE hf_a_account
(
    bidder_nick    VARCHAR2(100) NOT NULL,
    auc_no    NUMBER(5) NOT NULL,
    bid_money NUMBER(12) DEFAULT 0 NOT NULL,
    first_bid_date varchar2(100) not null
);


ALTER TABLE hf_a_account ADD bid_money NUMBER(12) DEFAULT 0 NOT NULL;

CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_1_PK2 ON hf_a_account
( auc_no,bidder_nick );

ALTER TABLE hf_a_account
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_1_PK2 PRIMARY KEY ( auc_no,bidder_nick )
 USING INDEX 엔터티1_1_1_1_1_1_1_PK2;
 
  ALTER TABLE hf_a_account ADD CONSTRAINT hf_a_account_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no);


---경매모임계좌 거래내역------------------------------------------------------------------------

DROP TABLE hf_a_tranz;

CREATE TABLE hf_a_tranz
(
    tranz_date    date DEFAULT SYSDATE NOT NULL,
    tranz_account_no    VARCHAR2(40) NOT NULL,
    tranz_money    NUMBER(12) NOT NULL,
    tranz_member_nick    VARCHAR2(20) NOT NULL,
    tranz_type    VARCHAR2(10) NOT NULL,
    auc_no    NUMBER(12) NOT NULL,
    member_balance NUMBER(12) NOT NULL
);

alter table hf_a_tranz modify (tranz_date date  DEFAULT sysdate );

alter table hf_a_tranz add member_balance NUMBER(12) NOT NULL;

CREATE UNIQUE INDEX 엔터티1_1_1_1_1_PK ON hf_a_tranz
( auc_no,tranz_type,tranz_account_no,tranz_date );

ALTER TABLE hf_a_tranz
 ADD CONSTRAINT 엔터티1_1_1_1_1_PK PRIMARY KEY ( auc_no,tranz_type,tranz_account_no,tranz_date )
 USING INDEX 엔터티1_1_1_1_1_PK;

    
-------그룹코드---------------------------------------------- --------------------
DROP TABLE hf_group_code;

CREATE TABLE hf_group_code
(
    code_category    VARCHAR2(10) NOT NULL,
    category_name    VARCHAR2(30) NOT NULL,
    usage            VARCHAR2(10) NOT NULL
);

CREATE UNIQUE INDEX 엔터티1_1_1_PK ON hf_group_code
( code_category );

ALTER TABLE hf_group_code
 ADD CONSTRAINT 엔터티1_1_1_PK PRIMARY KEY ( code_category )
 USING INDEX 엔터티1_1_1_PK;


-------그룹상세코드------------------------------------------------------------------
DROP TABLE hf_detail_code;

CREATE TABLE hf_detail_code
(
    code_no    number(5) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL,
    code_category    VARCHAR2(10) NOT NULL,
    uri_name        VARCHAR2(100) NOT NULL,
    usage    VARCHAR2(5) DEFAULT 'y' NOT NULL
);

CREATE UNIQUE INDEX 엔터티1_1_1_1_1_1_PK6 ON hf_detail_code
( code_category,code_no );

alter table hf_detail_code
add unique (uri_name);

ALTER TABLE hf_detail_code
 ADD CONSTRAINT 엔터티1_1_1_1_1_1_PK6 PRIMARY KEY ( code_category,code_no )
 USING INDEX 엔터티1_1_1_1_1_1_PK6;
 
ALTER TABLE hf_detail_code
    ADD CONSTRAINT hf_detail_code_category_fk
    FOREIGN KEY(code_category) REFERENCES hf_group_code(code_category);

----알림----------------------------------------------------------------------------
DROP TABLE hf_notice;

CREATE TABLE hf_notice
(
    noti_no    NUMBER(10) NOT NULL,
    noti_member_nick    VARCHAR2(50) NOT NULL,
    noti_type    VARCHAR2(100) NOT NULL,
    noti_content_no    NUMBER(10) NOT NULL,
    noti_msg    VARCHAR2(500) NOT NULL,
    noti_method    VARCHAR2(200) DEFAULT 'app' NOT NULL,
    noti_datetime    VARCHAR2(200) DEFAULT TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss') NOT NULL,
    noti_read_datetime    VARCHAR2(200)
    
);

update hf_notice set noti_method = 'app';
commit;
ALTER TABLE hf_notice modify noti_method VARCHAR2(200) DEFAULT 'app' NOT NULL ;

create sequence seq_hf_notice_no nocache;

ALTER TABLE hf_notice ADD CONSTRAINT hf_notice_noti_member_nick_fk   
FOREIGN KEY(noti_member_nick) REFERENCES hf_member(nickname) on delete cascade;

CREATE UNIQUE INDEX 엔터티2_PK3 ON hf_notice
( noti_no );

ALTER TABLE hf_notice
 ADD CONSTRAINT 엔터티2_PK3 PRIMARY KEY ( noti_no )
 USING INDEX 엔터티2_PK3;


---알림 설정 --------------------------------------------------------------------
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

ALTER TABLE hf_notice_setting add SMSNotice VARCHAR2(20) DEFAULT 'true' NOT NULL;

ALTER TABLE hf_notice_setting add bidder_return_approve_notice VARCHAR2(20) DEFAULT 'true' NOT NULL;
ALTER TABLE hf_notice_setting add seller_return_request_notice VARCHAR2(20) DEFAULT 'true' NOT NULL;

ALTER TABLE hf_notice_setting ADD CONSTRAINT hf_notice_setting_nick_fk   
FOREIGN KEY(member_nick) REFERENCES hf_member(nickname) on delete cascade;

CREATE UNIQUE INDEX 엔터티2_PK4 ON hf_notice_setting
( member_nick );

ALTER TABLE hf_notice_setting
 ADD CONSTRAINT 엔터티2_PK4 PRIMARY KEY ( member_nick )
 USING INDEX 엔터티2_PK4;
 
 
-- 환불글 ------------------------------------------------------------------------- 
 DROP TABLE hf_return_goods;

CREATE TABLE hf_return_goods
(
    auc_no    NUMBER(5) NOT NULL,
    title    VARCHAR2(100) NOT NULL,
    detail    VARCHAR2(1000) NOT NULL,
    writer    VARCHAR2(100) NOT NULL,
    reg_date    VARCHAR2(100) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') NOT NULL 
);

CREATE UNIQUE INDEX 엔터티2_PK5 ON hf_return_goods
( auc_no );

ALTER TABLE hf_return_goods
 ADD CONSTRAINT 엔터티2_PK5 PRIMARY KEY ( auc_no )
 USING INDEX 엔터티2_PK5;
 
ALTER TABLE hf_return_goods ADD CONSTRAINT hf_return_goods_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_auc_goods(no);


-- 환불사진 -------------------------------------------------------------------------
DROP TABLE hf_return_photo;

CREATE TABLE hf_return_photo
(
    no    NUMBER(10) NOT NULL,
    ori_name    VARCHAR2(200) NOT NULL,
    save_name    VARCHAR2(200) NOT NULL,
    file_size    NUMBER(10) NOT NULL,
    auc_no    NUMBER(5) NOT NULL
    
);

CREATE UNIQUE INDEX 엔터티2_1_PK1 ON hf_return_photo
( no );

ALTER TABLE hf_return_photo
 ADD CONSTRAINT 엔터티2_1_PK1 PRIMARY KEY ( no )
 USING INDEX 엔터티2_1_PK1;
 
 ALTER TABLE hf_return_photo ADD CONSTRAINT hf_return_photo_auc_no_fk   
FOREIGN KEY(auc_no) REFERENCES hf_return_goods(auc_no);

create sequence seq_hf_return_photo_no nocache;


















