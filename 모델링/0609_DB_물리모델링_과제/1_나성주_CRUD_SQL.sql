
--모든 테이블 조회-----------------------------------------------------------------
SELECT 
    transaction_date,
    transaction_account_no,
    transaction_amount,
    transaction_name,
    bid_account_no,
    category,
    transaction_seq
FROM account_transaction_t;


SELECT 
    bid_account_no,
    create_date,
    account_name,
    account_holder
FROM auction_meeting_account_t;


SELECT 
    bid_mode,
    start_date,
    close_date,
    status,
    start_price,
    bid_unit,
    auction_seq
FROM auction_t;


SELECT 
    code_no,
    code_name,
    code_category,
    usage_status
FROM detail_code_t;


SELECT 
    category,
    feature,
    registration_date,
    name,
    auction_seq
FROM goods_t;


SELECT 
    code_category,
    code_name
FROM group_code_t;


SELECT 
    member_id,
    name,
    social_security_no,
    sex,
    cell_phone_no,
    email,
    address,
    account_no,
    account_bank
FROM member_t;


SELECT 
    member_id,
    auction_seq,
    member_type
FROM participant_t;


SELECT 
    win_price,
    win_date,
    member_id,
    auction_seq,
    member_type
FROM winner_t;

-----JOIN 구문 2개---------------------------------------------------------------
REM 경매상품을 발송하기 위해 낙찰자의 이름, 집주소, 핸드폰 번호 조회하기
SELECT m.name, m.address, m.CELL_PHONE_NO
FROM winner_t w 
JOIN member_t m ON w.member_id = m.member_id
WHERE w.member_id = 'gunnocoxus';

REM 특정 경매상품을 등록한 판매자의 정보 조회
SELECT m.member_id,m.name,m.CELL_PHONE_NO, m.EMAIL, m.ACCOUNT_NO, m.ACCOUNT_BANK
FROM goods_t g 
JOIN participant_t p ON g.auction_seq = p.auction_seq
JOIN member_t m ON p.member_id = m.member_id
WHERE g.auction_seq = 4 AND p.member_type = 'S';


-----서브쿼리 구문 2개---------------------------------------------------------------
REM 경매상품을 발송하기 위해 낙찰자의 이름, 집주소, 핸드폰 번호 조회하기
SELECT name, address, CELL_PHONE_NO
FROM member_t m
WHERE m.member_id = (SELECT member_id FROM winner_t WHERE auction_seq = 4);

REM 특정 경매상품을 등록한 판매자의 정보 조회
SELECT m.member_id,m.name,m.CELL_PHONE_NO, m.EMAIL, m.ACCOUNT_NO, m.ACCOUNT_BANK
FROM member_t m
WHERE m.member_id = (SELECT p.member_id FROM participant_t p WHERE p.auction_seq = 
                        (SELECT auction_seq FROM goods_t WHERE auction_seq = 4) and p.member_type = 'S');
                        
                        






