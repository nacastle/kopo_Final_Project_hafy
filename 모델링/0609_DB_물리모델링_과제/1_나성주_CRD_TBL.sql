------테이블 생성-----------------------------------------------------------------
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
 
 





 
 

 
 


