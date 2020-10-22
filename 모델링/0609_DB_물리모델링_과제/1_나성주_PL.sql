--STORED BLOCK 작성----------------------------------------------------------------------------------------------------------------------------------

-----STORED BLOCK 1-----
REM----------------------------------------------------------------------------------------------------------------------------------
REM 특정 일시 직전까지 모임계좌의 거래대상자가 모임계좌에 입금한 금액 총액
REM -> 특정 일시           = P_close_date
REM -> 모임계좌            = P_bid_account_no
REM -> 거래대상자(계좌번호)  = P_transaction_account_no
REM 선정사유: 총 입금액을 조회하는 기능은 다른 금융 관련 프로젝트를 진행중인 다른 동기들도 공통으로 필요하다 생각하여 선정
REM 이 프로그램에서는 주로 경매 마감일시 직후 특정 경매입찰자가 경매모임계좌에 입금한 총액을 구하기 위해 사용됨
REM----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION SUM_DEPOSIT(P_bid_account_no IN VARCHAR2, P_transaction_account_no IN VARCHAR2, P_close_date IN DATE)
RETURN NUMBER
IS
    V_SUM_DEPOSIT   NUMBER;
    
BEGIN
   
    SELECT SUM(AT.transaction_amount) INTO  V_SUM_DEPOSIT 
    FROM account_transaction_t AT
    WHERE (AT.transaction_date < P_close_date)
      AND (AT.category = 'D')
      AND (AT.transaction_account_no = P_transaction_account_no)
      AND (AT.bid_account_no = P_bid_account_no);
      
      RETURN V_SUM_DEPOSIT;
      
EXCEPTION 
      WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('OTHERS  =>: '||SQLERRM);
            ROLLBACK;
END SUM_DEPOSIT;
/


REM----------------------------------------------------------------------------------------------------------------------------------
REM SUM_DEPOSIT 함수 테스트
REM----------------------------------------------------------------------------------------------------------------------------------

SELECT SUM_DEPOSIT('7263-1826-19273','1827-5736-1823', '20/06/07') SUM_DEPOSIT FROM DUAL;






-----STORED BLOCK 2-----
REM----------------------------------------------------------------------------------------------------------------------------------
REM 특정 일시 직전까지 모임계좌에 입금한 모든 거래대상자의 입금총액 요약
REM -> 특정 일시           = P_close_date
REM -> 모임계좌의 계좌번호   = P_bid_account_no
REM 선정사유: 모임계좌 내 입금 요약 조회하는 기능은 다른 모임계좌 관련 프로젝트를 진행중인 다른 동기들도 공통으로 필요하다 생각하여 선정
REM 이 프로그램에서는 주로 경매 마감일시 직후 전체 입찰자의 입금액을 요약 정리하여 낙찰자를 구하기 위해 사용됨 (추후 순위매기는 함수까지 구현할 예정)
REM----------------------------------------------------------------------------------------------------------------------------------

--모임통장의 입금요약을 담기 위한 임의의 테이블 생성 
CREATE TABLE DEPOSIT_SUMMARY_T (
    MEETING_ACCOUT_NAME  NUMBER NOT NULL,
    MEETING_ACCOUNT_NO  VARCHAR2(30),
    DEPOSITER VARCHAR2(20) NOT NULL,
    TRANSACTION_ACCOUNT_NO VARCHAR2(30),
    TOTAL_DEPOSIT_AMOUNT NUMBER
);
COMMENT ON COLUMN DEPOSIT_SUMMARY_T.MEETING_ACCOUT_NAME IS '경매모임계좌의 이름(경매번호로 설정)';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.MEETING_ACCOUNT_NO IS '경매모임통장의 계좌번호';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.DEPOSITER IS '경매통장에 입금한 입금자명';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.TRANSACTION_ACCOUNT_NO IS '경매통장에 입금한 입금자의 계좌번호';

COMMENT ON COLUMN DEPOSIT_SUMMARY_T.TOTAL_DEPOSIT_AMOUNT IS '경매통장에 입금한 입금자의 총 입금액 ';

COMMENT ON TABLE participant_t IS '경매모임통장 입금요약';

ALTER TABLE DEPOSIT_SUMMARY_T
 ADD CONSTRAINT DEPOSIT_SUMMARY_T_PK PRIMARY KEY ( MEETING_ACCOUNT_NO,TRANSACTION_ACCOUNT_NO );
 

--프로시져 생성
CREATE OR REPLACE PROCEDURE SHOW_BIDDERS_DEPOSITS(P_bid_account_no IN VARCHAR2, P_close_date IN DATE)
AS
    CURSOR CUR_DEPOSIT IS
        SELECT DISTINCT M.name MNAME, AT.transaction_account_no TRANS_ACCOUNT 
        FROM account_transaction_t AT JOIN member_t M
        ON AT.transaction_account_no = M.account_no
        WHERE AT.bid_account_no = P_bid_account_no
        AND AT.category = 'D';
        R_CUR_DEPOSIT   CUR_DEPOSIT%ROWTYPE;    
BEGIN
    OPEN CUR_DEPOSIT;
    LOOP
        FETCH CUR_DEPOSIT INTO R_CUR_DEPOSIT;
        EXIT WHEN CUR_DEPOSIT%NOTFOUND;
        
        INSERT INTO DEPOSIT_SUMMARY_T
        VALUES((SELECT account_name FROM auction_meeting_account_t WHERE bid_account_no = P_bid_account_no),
                P_bid_account_no,
                R_CUR_DEPOSIT.MNAME, 
                R_CUR_DEPOSIT.TRANS_ACCOUNT, 
                SUM_DEPOSIT(P_bid_account_no,R_CUR_DEPOSIT.TRANS_ACCOUNT, P_close_date)
                );
        
    END LOOP;  
    CLOSE CUR_DEPOSIT;
    COMMIT;
EXCEPTION 
      WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('OTHERS  =>: '||SQLERRM);
            ROLLBACK;
END SHOW_BIDDERS_DEPOSITS;
/


REM-----------------------------------------------------------------------------
REM SHOW_BIDDERS_DEPOSITS 프로시져 테스트
REM-----------------------------------------------------------------------------

EXECUTE SHOW_BIDDERS_DEPOSITS('7263-1826-19273', '20/06/06');
SELECT * FROM DEPOSIT_SUMMARY_T;


--경매계좌 내 입금 순위 구하는 쿼리
SELECT MEETING_ACCOUT_NAME, MEETING_ACCOUNT_NO, DEPOSITER, TRANSACTION_ACCOUNT_NO, TOTAL_DEPOSIT_AMOUNT,
RANK() OVER(PARTITION BY MEETING_ACCOUNT_NO ORDER BY TOTAL_DEPOSIT_AMOUNT DESC) RANK
FROM DEPOSIT_SUMMARY_T;


CREATE OR REPLACE PROCEDURE INSERT_WINNER()
IS
BEGIN
    INSERT INTO winner_t(member_id, auction_seq, member_type, win_price, win_date) 
    VALUES( (
EXCEPTION 
      WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('OTHERS  =>: '||SQLERRM);
            ROLLBACK;

END;
/





