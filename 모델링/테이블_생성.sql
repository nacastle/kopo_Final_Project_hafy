--회원 테이블
CREATE TABLE member_t
(
    member_id    VARCHAR2(30) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    social_security_no    CHAR(20) NOT NULL,
    sex    VARCHAR2(3) NOT NULL,
    cell_phone_no    VARCHAR2(19) NOT NULL,
    email    VARCHAR2(50) NOT NULL,
    address    VARCHAR2(200) NOT NULL,
    account_no    VARCHAR2(40) NOT NULL,
    account_bank    VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN member_t.member_id IS '회원 아이디';

COMMENT ON COLUMN member_t.name IS '이름';

COMMENT ON COLUMN member_t.social_security_no IS '주민등록번호';

COMMENT ON COLUMN member_t.sex IS '성별(코드)';

COMMENT ON COLUMN member_t.cell_phone_no IS '핸드폰';

COMMENT ON COLUMN member_t.email IS '이메일';

COMMENT ON COLUMN member_t.address IS '주소';

COMMENT ON COLUMN member_t.account_no IS '계좌번호';

COMMENT ON COLUMN member_t.account_bank IS '계좌은행(코드)';

COMMENT ON TABLE member_t IS '회원';

ALTER TABLE member_t
 ADD CONSTRAINT MEMBER_T_PK PRIMARY KEY ( member_id );
 
 
--경매 테이블
CREATE TABLE auction_t
(
    bid_mode    VARCHAR2(10) NOT NULL,
    start_date    DATE NOT NULL,
    close_date    DATE NOT NULL,
    status    VARCHAR2(10) NOT NULL,
    start_price    INTEGER NOT NULL,
    bid_unit    INTEGER NOT NULL,
    auction_seq    NUMBER NOT NULL
);

COMMENT ON COLUMN auction_t.bid_mode IS '입찰방식(코드: 공개입찰/비공개입찰)';

COMMENT ON COLUMN auction_t.start_date IS '경매시작일';

COMMENT ON COLUMN auction_t.close_date IS '경매마감일';

COMMENT ON COLUMN auction_t.status IS '경매 처리상태(코드: 대기/입찰진행/마감)';

COMMENT ON COLUMN auction_t.start_price IS '경매시작가';

COMMENT ON COLUMN auction_t.bid_unit IS '입찰단위(코드)';

COMMENT ON COLUMN auction_t.auction_seq IS '경매 번호';

COMMENT ON TABLE auction_t IS '경매';

ALTER TABLE auction_t
 ADD CONSTRAINT AUCTION_T_PK PRIMARY KEY ( auction_seq );
 
 
--참여자 테이블
CREATE TABLE participant_t
(
    member_id    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL,
    member_type    VARCHAR2(10) NOT NULL    
);

COMMENT ON COLUMN participant_t.member_id IS '경매에 참여한 참가자(판매자/입찰자)의 ID';

COMMENT ON COLUMN participant_t.auction_seq IS '참가자가 참여한 경매번호';

COMMENT ON COLUMN participant_t.member_type IS '회원유형(판매자/입찰자)';

COMMENT ON TABLE participant_t IS '경매참여자';

ALTER TABLE participant_t
 ADD CONSTRAINT PARTICIPANT_T_PK PRIMARY KEY ( member_id,auction_seq,member_type );
 
ALTER TABLE participant_t
 ADD CONSTRAINT AUCTION_SEQ_FK FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);
 
 
 --경매상품 테이블
 CREATE TABLE goods_t
(
    category    VARCHAR2(10) NOT NULL,
    feature    VARCHAR2(10) NOT NULL,
    registration_date    DATE NOT NULL,
    name    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL
);

COMMENT ON COLUMN goods_t.category IS '상품 카테고리(코드: 의류, 생활용품, 도서 등)';

COMMENT ON COLUMN goods_t.feature IS '상품 특징(코드: 온도에 민감한, 깨지기 쉬운 등)';

COMMENT ON COLUMN goods_t.registration_date IS '상품등록일';

COMMENT ON COLUMN goods_t.name IS '상품명';

COMMENT ON COLUMN goods_t.auction_seq IS '경매 번호';

COMMENT ON TABLE goods_t IS '경매상품';

ALTER TABLE goods_t
 ADD CONSTRAINT AUCTION_SEQ_FK2 FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);

ALTER TABLE goods_t
 ADD CONSTRAINT GOODS_T_PK PRIMARY KEY ( auction_seq );


--경매모임계좌 테이블
CREATE TABLE auction_meeting_account_t
(
    bid_account_no    VARCHAR2(40) NOT NULL,
    create_date    DATE NOT NULL,
    account_name    NUMBER NOT NULL,
    account_holder    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN auction_meeting_account_t.bid_account_no IS '경매 모임통장의 계좌번호';

COMMENT ON COLUMN auction_meeting_account_t.create_date IS '계좌생성일';

COMMENT ON COLUMN auction_meeting_account_t.account_name IS '계좌명(경매번호와 동일)';

COMMENT ON COLUMN auction_meeting_account_t.account_holder IS '계좌주명';

COMMENT ON TABLE auction_meeting_account_t IS '경매모임계좌';

ALTER TABLE auction_meeting_account_t
 ADD CONSTRAINT auction_meeting_account_t_PK PRIMARY KEY ( bid_account_no );

ALTER TABLE auction_meeting_account_t
 ADD CONSTRAINT AUCTION_SEQ_FK3 FOREIGN KEY (account_name) REFERENCES auction_t(auction_seq);
 commit;
 
--낙찰자 테이블
CREATE TABLE winner_t
(
    win_price    NUMBER NOT NULL,
    win_date    DATE NOT NULL,
    member_id    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL,
    member_type    VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN winner_t.win_price IS '낙찰가';

COMMENT ON COLUMN winner_t.win_date IS '낙찰일시';

COMMENT ON COLUMN winner_t.member_id IS '낙찰자 회원 아이디';

COMMENT ON COLUMN winner_t.auction_seq IS '경매 번호';

COMMENT ON COLUMN winner_t.member_type IS '회원 유형(입찰자)';

COMMENT ON TABLE winner_t IS '낙찰자';

ALTER TABLE winner_t
 ADD CONSTRAINT WINNER_T_PK PRIMARY KEY ( member_id,auction_seq );

ALTER TABLE winner_t
 ADD CONSTRAINT MEMBER_ID_FK FOREIGN KEY (member_id) REFERENCES member_t(member_id);

ALTER TABLE winner_t
 ADD CONSTRAINT AUCTION_SEQ_FK4 FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);
 
 
 --입출금 거래내역 테이블
 CREATE TABLE account_transaction_t
(
    transaction_date    DATE NOT NULL,
    transaction_account_no    VARCHAR2(40) NOT NULL,
    transaction_amount    NUMBER NOT NULL,
    transaction_name    VARCHAR2(20) NOT NULL,
    bid_account_no    VARCHAR2(40) NOT NULL,
    category    VARCHAR2(10) NOT NULL,
    transaction_seq    NUMBER NOT NULL
);

COMMENT ON COLUMN account_transaction_t.transaction_date IS '입출금 거래 일시';

COMMENT ON COLUMN account_transaction_t.transaction_account_no IS '입출금 대상 계좌번호';

COMMENT ON COLUMN account_transaction_t.transaction_amount IS '입추금 거래 금액';

COMMENT ON COLUMN account_transaction_t.transaction_name IS '입출금 거래자명';

COMMENT ON COLUMN account_transaction_t.bid_account_no IS '경매 모임계좌번호';

COMMENT ON COLUMN account_transaction_t.category IS '거래유형(코드: 입금/출금)';

COMMENT ON COLUMN account_transaction_t.transaction_seq IS '거래 번호';

COMMENT ON TABLE account_transaction_t IS '입출금 거래내역';

ALTER TABLE account_transaction_t
 ADD CONSTRAINT ACCOUNT_TRANSACTION_T_PK PRIMARY KEY ( transaction_seq );

ALTER TABLE account_transaction_t
 ADD CONSTRAINT BID_ACCOUNT_NO_FK FOREIGN KEY (bid_account_no) REFERENCES auction_meeting_account_t(bid_account_no);

 
 --그룹코드 테이블
 CREATE TABLE group_code_t
(
    code_category    VARCHAR2(10) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN group_code_t.code_category IS '그룹코드 분류(속성 기준)';

COMMENT ON COLUMN group_code_t.code_name IS '그룹코드명';

COMMENT ON TABLE group_code_t IS '그룹코드';

ALTER TABLE group_code_t
 ADD CONSTRAINT GROUP_CODE_T_PK PRIMARY KEY ( code_category );
 
 
 --상세코드 테이블
 CREATE TABLE detail_code_t
(
    code_no    VARCHAR2(10) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL,
    code_category    VARCHAR2(10) NOT NULL,
    usage_status    VARCHAR2(5) NOT NULL
);

COMMENT ON COLUMN detail_code_t.code_no IS '상세코드 분류';

COMMENT ON COLUMN detail_code_t.code_name IS '상세코드명';

COMMENT ON COLUMN detail_code_t.code_category IS '그룹코드 분류';

COMMENT ON COLUMN detail_code_t.usage_status IS '상세코드 사용여부(Y/N)';

COMMENT ON TABLE detail_code_t IS '상세코드';

ALTER TABLE detail_code_t
 ADD CONSTRAINT DETAIL_CODE_T_PK PRIMARY KEY ( code_category,code_no );

ALTER TABLE detail_code_t
 ADD CONSTRAINT CODE_CATEGORY_FK FOREIGN KEY (code_category) REFERENCES group_code_t(code_category);
 
 
 -----------------------------------------------------------------------------------------------------------------------------
 
 --member_t 테이블 데이터 생성
INSERT ALL 
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('burce','이진희','990717-2342945','F','010-4211-1928','burce@gmail.com','서울특별시 서초구 양재동 275','923-1827-19273','01')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('dannath','전혜원','910226-2981599','F','010-9182-9381','dannath@naver.com','서울특별시 강남구 도곡동 467-6','8472-18273-1826','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('domine','이상현','900824-1619654','M','010-3927-1927','domine@daum.net','서울특별시 서초구 양재동 67-5','7162-18263-192','03')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('gunnocoxus','김혜주','980405-2980640','F','010-7162-3912','gunnocoxus@gmail.com','서울특별시 강남구 도곡1동 도곡로 204','1827-5736-1823','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('handil','박진우','950113-1929114','M','010-9217-5638','handil@naver.com','서울특별시 강남구 개포4동 언주로 101','192-5736-18263','04')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('lorian','박천호','940120-1372926','M','010-1726-1528','lorian@hanmail.net','경기도 성남시 분당구 삼평동 대왕판교로 670','8173-18263-182','04')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('maiven','김윤후','931017-1811575','M','010-9381-2936','maiven@gmail.com','경기도 성남시 분당구 삼평동','37162-172635-172','05')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('paroc','정승원','940415-2351829','F','010-1527-5821','paroc@naver.com','서울특별시 강남구 일원동 일원로 37','8562-28163-1827','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('sinkin','양은희','940807-2082430','F','010-1726-5927','sinkin@gmail.com','서울특별시 강남구 대치1동 선릉로 224','6737-18253-182','01')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('tessa','소재원','930221-1185074','M','010-5972-9172','tessa@gmail.com','서울특별시 강남구 개포동 12-4','5836-18273-182','03')
    SELECT * FROM DUAL;
    

--group_code_t 테이블 데이터 생성
INSERT ALL
    INTO group_code_t(code_category,code_name)
    VALUES('100','성별')
    INTO group_code_t(code_category,code_name)
    VALUES('200','계좌은행')
    INTO group_code_t(code_category,code_name)
    VALUES('300','회원유형')
    INTO group_code_t(code_category,code_name)
    VALUES('400','상품카테고리')
    INTO group_code_t(code_category,code_name)
    VALUES('500','상품특징')
    INTO group_code_t(code_category,code_name)
    VALUES('600','입찰방식')
    INTO group_code_t(code_category,code_name)
    VALUES('700','처리상태')
    INTO group_code_t(code_category,code_name)
    VALUES('800','거래유형')
    SELECT * FROM DUAL;
    

--detail_code_t 테이블 데이터 생성
INSERT ALL
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('100','M','남자','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('100','F','여자','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','01','하나은행','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','02','국민은행','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','03','기업은행','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','04','신한은행','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','05','우리은행','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('300','S','SELLER','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('300','B','BIDDER','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('400','FA','FASHION','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('400','BE','BEAUTY','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('400','FO','FOOD','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('400','HA','HOME_APPLIANCES','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('500','FR','FRAGLE','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('500','PE','PERISHABLE','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('600','O','OPEN','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('600','C','CLOSE','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('700','ST','STANDBY','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('700','ON','ONGOING','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('700','CL','CLOSE','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('800','D','DEPOSIT','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('800','W','WITHDRAW','Y')
    SELECT * FROM DUAL;


--auction_t 테이블 데이터 생성
INSERT ALL
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-06 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-10 23:59','RRRR-MM-DD HH24:MI'),'ON',50000,10000,1)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-10 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-20 23:59','RRRR-MM-DD HH24:MI'),'ST',30000,10000,2)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-04 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-08 23:59','RRRR-MM-DD HH24:MI'),'ON',20000,10000,3)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('C',TO_DATE('2020-06-03 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-07 23:59','RRRR-MM-DD HH24:MI'),'CL',10000,5000,4)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('C',TO_DATE('2020-06-02 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-06 23:59','RRRR-MM-DD HH24:MI'),'CL',100000,20000,5)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-01 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-05 23:59','RRRR-MM-DD HH24:MI'),'CL',60000,30000,6)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-05-31 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-04 23:59','RRRR-MM-DD HH24:MI'),'CL',30000,10000,7)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('C',TO_DATE('2020-05-30 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-03 23:59','RRRR-MM-DD HH24:MI'),'CL',40000,10000,8)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-05-29 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-02 23:59','RRRR-MM-DD HH24:MI'),'CL',50000,10000,9)
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-05-28 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-01 23:59','RRRR-MM-DD HH24:MI'),'CL',200000,20000,10)
    SELECT * FROM DUAL;
    

--participant_t 테이블 데이터 생성
INSERT ALL
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('burce',4,'S')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('dannath',4,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('domine',4,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('gunnocoxus',4,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('lorian',4,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('handil',5,'S')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('maiven',5,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('paroc',5,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('sinkin',5,'B')
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('tessa',5,'B')
    SELECT * FROM DUAL;


--winner_t 테이블 데이터 생성
INSERT ALL
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(100000,TO_DATE('2020-06-07 22:32','RRRR-MM-DD HH24:MI'),'gunnocoxus',4,'B')
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(200000,TO_DATE('2020-06-06 23:52','RRRR-MM-DD HH24:MI'),'sinkin',5,'B')
    SELECT * FROM DUAL;


--goods_t 테이블 데이터 생성
INSERT ALL
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-25 12:32','RRRR-MM-DD HH24:MI'),'자라 셔츠',1)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-24 13:24','RRRR-MM-DD HH24:MI'),'지오다노 셔츠',2)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-23 09:12','RRRR-MM-DD HH24:MI'),'유니클로 히트텍',3)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FO','PE',TO_DATE('2020-05-22 17:02','RRRR-MM-DD HH24:MI'),'영광굴비',4)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FO','PE',TO_DATE('2020-05-21 18:09','RRRR-MM-DD HH24:MI'),'나주배',5)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('HA','FR',TO_DATE('2020-05-20 20:03','RRRR-MM-DD HH24:MI'),'선풍기',6)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('HA','FR',TO_DATE('2020-05-19 17:38','RRRR-MM-DD HH24:MI'),'전자레인지',7)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('BE','NONE',TO_DATE('2020-05-18 17:23','RRRR-MM-DD HH24:MI'),'선크림',8)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('BE','NONE',TO_DATE('2020-05-17 15:42','RRRR-MM-DD HH24:MI'),'핸드크림',9)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-16 14:03','RRRR-MM-DD HH24:MI'),'구찌 목걸이',10)
    SELECT * FROM DUAL;
    

--auction_meeting_account_t 테이블 데이터 생성
INSERT ALL
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('182-1837-19573',TO_DATE('2020-06-06 00:00','RRRR-MM-DD HH24:MI'),1,'행원A')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('176-3716-18263',TO_DATE('2020-06-10 00:00','RRRR-MM-DD HH24:MI'),2,'행원B')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('563-16351-5826',TO_DATE('2020-06-04 00:00','RRRR-MM-DD HH24:MI'),3,'행원C')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('7263-1826-19273',TO_DATE('2020-06-03 00:00','RRRR-MM-DD HH24:MI'),4,'행원D')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('8165-28162-381',TO_DATE('2020-06-02 00:00','RRRR-MM-DD HH24:MI'),5,'행원E')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('5763-72631-18731',TO_DATE('2020-06-01 00:00','RRRR-MM-DD HH24:MI'),6,'행원F')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('17653-17263-182',TO_DATE('2020-05-31 00:00','RRRR-MM-DD HH24:MI'),7,'행원G')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('726-17263-1875',TO_DATE('2020-05-30 00:00','RRRR-MM-DD HH24:MI'),8,'행원H')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('5826-71623-1827',TO_DATE('2020-05-29 00:00','RRRR-MM-DD HH24:MI'),9,'행원I')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('523-17263-1872',TO_DATE('2020-05-28 00:00','RRRR-MM-DD HH24:MI'),10,'행원J')
    SELECT * FROM DUAL;    
    



--account_transaction_t 테이블 데이터 생성
INSERT ALL
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 12:23','RRRR-MM-DD HH24:MI'),'1827-5736-1823',100000,'김혜주','7263-1826-19273','D',1)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 15:33','RRRR-MM-DD HH24:MI'),'7162-18263-192',70000,'이상현','7263-1826-19273','D',2)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-04 16:53','RRRR-MM-DD HH24:MI'),'8472-18273-1826',60000,'전혜원','7263-1826-19273','D',3)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-05 15:37','RRRR-MM-DD HH24:MI'),'8173-18263-182',20000,'박천호','7263-1826-19273','D',4)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'7162-18263-192',70000,'이상현','7263-1826-19273','W',5)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'8472-18273-1826',60000,'전혜원','7263-1826-19273','W',6)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'8173-18263-182',20000,'박천호','7263-1826-19273','W',7)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-11 10:00','RRRR-MM-DD HH24:MI'),'923-1827-19273',100000,'이진희','7263-1826-19273','W',8)
    SELECT * FROM DUAL;    


 
 

 
 


