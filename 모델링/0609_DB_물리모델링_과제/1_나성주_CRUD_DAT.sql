 -------데이터 생성------------------------------------------------------------------
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

-----테이블당 CRUD 작성---------------------------------------------------------------
--member_t 테이블 CRUD 작성
REM 회원가입
INSERT ALL 
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('kevin','나경주','970212-1442125','M','010-3224-4228','kevin@gmail.com','서울특별시 서초구 양재동 275','321-2347-72312','05')
    SELECT * FROM DUAL;
    
REM 회원의 주소 조회
SELECT address
FROM member_t
WHERE member_id = 'kevin';

REM 회원정보 수정
UPDATE member_t SET cell_phone_no = '010-1928-4228' WHERE member_id = 'kevin';    
    
REM 회원탈퇴
DELETE FROM member_t WHERE MEMBER_ID = 'kevin';

--group_code_t 테이블 CRUD 작성
REM 그룹코드 추가
INSERT ALL
    INTO group_code_t(code_category,code_name)
    VALUES('900','추가그룹코드')
    SELECT * FROM DUAL;
    
REM 그룹코드명 조회
SELECT code_name
FROM group_code_t
WHERE code_category = '900';

REM 그룹코드명 수정
UPDATE group_code_t SET code_name = '입금방식' WHERE code_category = '900';

REM 그룹코드 삭제
DELETE FROM group_code_t WHERE code_category = '900';


--detail_code_t 테이블 CRUD 작성
REM 상세코드 추가
INSERT ALL
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('900','01','신용카드','Y')
    SELECT * FROM DUAL;
    
REM 상세코드명 조회
SELECT code_name
FROM detail_code_t
WHERE code_category = '900' AND code_no = '01';

REM 상세코드명 수정
UPDATE detail_code_t SET code_name = '무통장입금' WHERE code_category = '900' AND code_no = '01';

REM 상세코드 삭제
DELETE FROM detail_code_t WHERE code_category = '900' AND code_no = '01';


--auction_t 테이블 CRUD 작성
REM 새로운 경매 열림
INSERT ALL
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-07 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-12 23:59','RRRR-MM-DD HH24:MI'),'ON',70000,10000,11)
    SELECT * FROM DUAL;
    
REM 경매 시작가 조회
SELECT start_price
FROM auction_t
WHERE auction_seq = 11;

REM 경매 시작가 수정
UPDATE auction_t SET start_price = 100000 WHERE auction_seq = 11;

REM 경매 철회
DELETE FROM auction_t WHERE auction_seq = 11;



--participant_t 테이블 CRUD 작성 (U가 없는 문제 발생!)
REM 회원이 경매 입찰자로 참여
INSERT ALL
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('kevin',5,'B')
    SELECT * FROM DUAL;

REM 경매에 참여한 경매입찰자 목록 조회
SELECT member_id
FROM participant_t
WHERE auction_seq = 5;

REM 해당 경매건에 대한 입찰 철회 
DELETE FROM participant_t WHERE auction_seq = 5;


--goods_t 테이블 CRUD 작성
REM 경매상품 등록
INSERT ALL
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-06-08 09:42','RRRR-MM-DD HH24:MI'),'칼하트 맨투맨',11)
    SELECT * FROM DUAL;
    
REM 경매상품의 상품명 조회
SELECT name
FROM goods_t
WHERE auction_seq = 11;

REM 경매상품의 상품특징 변경
UPDATE goods_t SET feature = 'PE' WHERE auction_seq = 11;

REM 경매상품 취소
DELETE FROM goods_t WHERE auction_seq = 11;


--winner_t 테이블 CRUD 작성 (U가 없는 문제 발생!)
REM 낙찰자 발생
INSERT ALL
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(300000,TO_DATE('2020-06-10 23:59','RRRR-MM-DD HH24:MI'),'maiven',1,'B')
    SELECT * FROM DUAL;
    
REM 낙찰자의 낙찰가 조회
SELECT win_price
FROM winner_t
WHERE auction_seq = 1;

REM 낙찰 철회
DELETE FROM winner_t WHERE auction_seq = 1;


--auction_meeting_account_t 테이블 CRUD 작성
REM 경매모임계좌 생성
INSERT ALL
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('232-1537-12143',TO_DATE('2020-06-07 00:00','RRRR-MM-DD HH24:MI'),11,'행원Z')
    SELECT * FROM DUAL;
    
REM 경매모임계좌의 관리 행원 조회
SELECT account_holder
FROM auction_meeting_account_t
WHERE auction_seq = 11;

REM 경매모임계좌의 관리 행원 변경
UPDATE auction_meeting_account_t SET account_holder = '행원Y' WHERE auction_seq = 11;

REM 경매모임계좌 삭제
DELETE FROM auction_meeting_account_t WHERE auction_seq = 11;


--account_transaction_t 테이블 CRUD 작성 (U,D가 없는 문제 발생!)
REM 경매모임계좌로 입금 거래 발생
INSERT ALL
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 13:57','RRRR-MM-DD HH24:MI'),'321-2347-72312',100000,'나경주','17653-17263-182','D',9)
    SELECT * FROM DUAL;
    
REM 해당 경매모임계좌의 입금내역 조회
SELECT transaction_date, transaction_account_no, transaction_name, transaction_amount
FROM account_transaction_t
WHERE bid_account_no = '7263-1826-19273' and category = 'D' ;























    
    
 
