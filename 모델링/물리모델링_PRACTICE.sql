DELETE FROM detail_code_t;
DELETE FROM GROUP_code_t;
DELETE FROM PARTICIPANT_t;
COMMIT;

SELECT * FROM AUCTION_MEETING_ACCOUNT_T;
SELECT * FROM AUCTION_T;
SELECT * FROM WINNER_T;
SELECT * FROM MEMBER_T;
SELECT * FROM PARTICIPANT_T;
SELECT * FROM account_transaction_t;

select * from member_t;
select * from winner_t;
select * from participant_t;
select * from auction_meeting_account_t where account_name = 4;


SELECT * FROM     GROUP_code_t;

TRUNCATE TABLE AUCTION_T;

CREATE TABLE TEST1
( TEST_COL DATE);

CREATE TABLE TEST2
( TEST_COL TIMESTAMP);

INSERT INTO TEST1 VALUES(TO_TIMESTAMP('2020-12-22 12:32:12','RR-MM-DD HH24:MI:SS'));
INSERT INTO TEST2 VALUES((TO_TIMESTAMP(TRUNCATE('2020-12-22 12:32:12','RR-MM-DD HH24:MI:SS')));
SELECT * FROM TEST2;

SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(systimestamp, 'YYYY/MM/DD HH24:MI:SS:FF2') FROM DUAL;


SELECT * FROM account_transaction_t;
SELECT * FROM AUCTION_t;


    SELECT SUM(transaction_amount)
    FROM account_transaction_t
    WHERE transaction_date < '20/06/07'
      AND category = 'D'
      AND transaction_account_no = '1827-5736-1823'
      AND bid_account_no = '7263-1826-19273';
      
      
      V_transaction_amount        account_transaction_t.transaction_amount%TYPE;
    V_category                  account_transaction_t.category%TYPE;
    V_transaction_date          account_transaction_t.transaction_date%TYPE;
    V_transaction_account_no    account_transaction_t.transaction_account_no%TYPE;
    V_bid_account_no            account_transaction_t.bid_account_no%TYPE;




CREATE TABLE TEST_LEE (

    WORDS VARCHAR2(200)
);

INSERT INTO TEST_LEE VALUES('������ ���� ��ǰ������ ����');
SELECT * FROM TEST_LEE;

SELECT * FROM TEST_LEE WHERE WORDS LIKE '%��ǰ������ ����%';


    SELECT SUM(AT.transaction_amount) INTO  V_SUM_DEPOSIT 
    FROM account_transaction_t AT
    WHERE (AT.transaction_date < (SELECT A.close_date FROM auction_t A WHERE A.auction_seq = (SELECT AM.auction_seq FROM auction_meeting_account_t AM WHERE AM.bid_account_no = P_bid_account_no))
      AND (AT.category = 'D')
      AND (AT.transaction_account_no = P_transaction_account_no)
      AND (AT.bid_account_no = P_bid_account_no);
      


SELECT DISTINCT transaction_account_no
        FROM account_transaction_t M
        WHERE bid_account_no = '7263-1826-19273'
          AND category = 'D';
--------------------------------------------------------------------      
DECLARE
    CURSOR CUR_DEPOSIT IS
    SELECT DISTINCT M.name MNAME, AT.transaction_account_no TRANS_ACCOUNT 
    FROM account_transaction_t AT JOIN member_t M
    ON AT.transaction_account_no = M.account_no
    WHERE AT.bid_account_no = '7263-1826-19273'
    AND AT.category = 'D';
    R_CUR_DEPOSIT   CUR_DEPOSIT%ROWTYPE;
    
BEGIN
    OPEN CUR_DEPOSIT;
    LOOP
        FETCH CUR_DEPOSIT INTO R_CUR_DEPOSIT;
        EXIT WHEN CUR_DEPOSIT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(R_CUR_DEPOSIT.MNAME);
        DBMS_OUTPUT.PUT_LINE(R_CUR_DEPOSIT.TRANS_ACCOUNT);
        DBMS_OUTPUT.PUT_LINE(SUM_DEPOSIT(R_CUR_DEPOSIT.TRANS_ACCOUNT, '7263-1826-19273', '20/06/07'));
        
        
     END LOOP;  
    CLOSE CUR_DEPOSIT;
END;
/
-----�̰� ����-----------------------------------------------------------------------
DECLARE
    CURSOR CUR_DEPOSIT IS
        SELECT DISTINCT M.name MNAME, AT.transaction_account_no TRANS_ACCOUNT 
        FROM account_transaction_t AT JOIN member_t M
        ON AT.transaction_account_no = M.account_no
        WHERE AT.bid_account_no = '7263-1826-19273'
        AND AT.category = 'D';
        R_CUR_DEPOSIT   CUR_DEPOSIT%ROWTYPE;    
BEGIN
    OPEN CUR_DEPOSIT;
    LOOP
        FETCH CUR_DEPOSIT INTO R_CUR_DEPOSIT;
        EXIT WHEN CUR_DEPOSIT%NOTFOUND;
        
        INSERT INTO DEPOSIT_TEST
        VALUES((SELECT account_name FROM auction_meeting_account_t WHERE bid_account_no = '7263-1826-19273'),'7263-1826-19273',R_CUR_DEPOSIT.MNAME, R_CUR_DEPOSIT.TRANS_ACCOUNT, SUM_DEPOSIT('7263-1826-19273',R_CUR_DEPOSIT.TRANS_ACCOUNT, '20/06/07'));
        
     END LOOP;  
    CLOSE CUR_DEPOSIT;
END;
/
----------------------------------------------------------------------------
----------------------------------------------------------------------------
DECLARE
    CURSOR CUR_DEPOSIT IS
        SELECT DISTINCT  M.name MNAME, AT.transaction_account_no TRANS_ACCOUNT 
        FROM account_transaction_t AT JOIN member_t M
        ON AT.transaction_account_no = M.account_no
        WHERE AT.bid_account_no = '7263-1826-19273'
        AND AT.category = 'D';
        R_CUR_DEPOSIT   CUR_DEPOSIT%ROWTYPE;    
BEGIN
    OPEN CUR_DEPOSIT;
    LOOP
        FETCH CUR_DEPOSIT INTO R_CUR_DEPOSIT;
        EXIT WHEN CUR_DEPOSIT%NOTFOUND;
        
        SELECT R_CUR_DEPOSIT.MNAME, R_CUR_DEPOSIT.TRANS_ACCOUNT, SUM_DEPOSIT('7263-1826-19273',R_CUR_DEPOSIT.TRANS_ACCOUNT, '20/06/07') 
        INTO DEPOSIT_TEST
        FROM DUAL;
        
     END LOOP;  
    CLOSE CUR_DEPOSIT;
END;
/
----------------------------------------------------------------------------

CREATE TABLE DEPOSIT_SUMMARY_T (
    MEETING_ACCOUT_NAME  NUMBER NOT NULL,
    MEETING_ACCOUNT_NO  VARCHAR2(30),
    DEPOSITER VARCHAR2(20) NOT NULL,
    TRANSACTION_ACCOUNT_NO VARCHAR2(30),
    TOTAL_DEPOSIT_AMOUNT NUMBER
);
COMMENT ON COLUMN DEPOSIT_SUMMARY_T.MEETING_ACCOUT_NAME IS '��Ÿ��Ӱ����� �̸�(��Ź�ȣ�� ����)';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.MEETING_ACCOUNT_NO IS '��Ÿ��������� ���¹�ȣ';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.DEPOSITER IS '������忡 �Ա��� �Ա��ڸ�';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.TRANSACTION_ACCOUNT_NO IS '������忡 �Ա��� �Ա����� ���¹�ȣ';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.TOTAL_DEPOSIT_AMOUNT IS '������忡 �Ա��� �Ա����� �� �Աݾ� ';

COMMENT ON TABLE participant_t IS '��Ÿ������� �Աݿ��';

ALTER TABLE DEPOSIT_SUMMARY
 ADD CONSTRAINT DEPOSIT_SUMMARY_T_PK PRIMARY KEY ( MEETING_ACCOUNT_NO,TRANSACTION_ACCOUNT_NO );

SELECT * FROM DEPOSIT_TEST;

SELECT * FROM USER_SOURCE;

        DBMS_OUTPUT.PUT_LINE(R_CUR_DEPOSIT.MNAME);
        DBMS_OUTPUT.PUT_LINE(R_CUR_DEPOSIT.TRANS_ACCOUNT);
        DBMS_OUTPUT.PUT_LINE(SUM_DEPOSIT(R_CUR_DEPOSIT.TRANS_ACCOUNT, '7263-1826-19273', '20/06/07'));

DROP TABLE DEPOSIT_TEST;
CREATE TABLE DEPOSIT_TEST (
    AUCTION_SEQ  NUMBER,
    BID_ACCOUNT_NO  VARCHAR2(30),
    NAME VARCHAR2(20),
    ACCOUNT_NO VARCHAR2(30),
    DEPOSIT_AMOUNT NUMBER
);
SELECT * FROM DEPOSIT_TEST;
DELETE DEPOSIT_TEST;

SELECT DISTINCT M.name, R_CUR_DEPOSIT.transaction_account_no, SUM_DEPOSIT(R_CUR_DEPOSIT.transaction_account_no, '7263-1826-19273', '20/06/07') INTO TEST20

SET SERVEROUTPUT ON;

SELECT EMPNO
 INTO TEST_EMP
 FROM EMP;


SELECT INTO DISTINCT M.name, R_CUR_DEPOSIT.transaction_account_no, SUM_DEPOSIT(R_CUR_DEPOSIT.transaction_account_no, '7263-1826-19273', '20/06/07')
        FROM  member_t M
        WHERE M.account_no = R_CUR_DEPOSIT.transaction_account_no;
 
    SELECT R_CUR_DEPOSIT.MNAME, R_CUR_DEPOSIT.TRANS_ACCOUNT_NO, SUM_DEPOSIT(R_CUR_DEPOSIT.TRANS_ACCOUNT_NO, '7263-1826-19273', '20/06/07') INTO TEST10
        FROM  R_CUR_DEPOSIT;
        
SELECT * FROM member_t;

SELECT NAME, transaction_account_no, SUM_DEPOSIT(R_CUR_DEPOSIT.MNAME, P_transaction_account_no(�Ķ����), P_close_date(�Ķ����));

        
SELECT DISTINCT M.name, AT.transaction_account_no 
FROM account_transaction_t AT JOIN member_t M
ON AT.transaction_account_no = M.account_no
WHERE AT.bid_account_no = '7263-1826-19273'
    AND AT.category = 'D';


SELECT INTO DISTINCT M.name, R_CUR_DEPOSIT.transaction_account_no, SUM_DEPOSIT(R_CUR_DEPOSIT.transaction_account_no, '7263-1826-19273', '20/06/07')
        FROM account_transaction_t AT JOIN member_t M
        ON R_CUR_DEPOSIT.transaction_account_no = M.account_no
        WHERE AT.bid_account_no = '7263-1826-19273';

