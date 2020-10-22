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








    
    
 
