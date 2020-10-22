--STORED BLOCK �ۼ�----------------------------------------------------------------------------------------------------------------------------------

-----STORED BLOCK 1-----
REM----------------------------------------------------------------------------------------------------------------------------------
REM Ư�� �Ͻ� �������� ���Ӱ����� �ŷ�����ڰ� ���Ӱ��¿� �Ա��� �ݾ� �Ѿ�
REM -> Ư�� �Ͻ�           = P_close_date
REM -> ���Ӱ���            = P_bid_account_no
REM -> �ŷ������(���¹�ȣ)  = P_transaction_account_no
REM ��������: �� �Աݾ��� ��ȸ�ϴ� ����� �ٸ� ���� ���� ������Ʈ�� �������� �ٸ� ����鵵 �������� �ʿ��ϴ� �����Ͽ� ����
REM �� ���α׷������� �ַ� ��� �����Ͻ� ���� Ư�� ��������ڰ� ��Ÿ��Ӱ��¿� �Ա��� �Ѿ��� ���ϱ� ���� ����
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
REM SUM_DEPOSIT �Լ� �׽�Ʈ
REM----------------------------------------------------------------------------------------------------------------------------------

SELECT SUM_DEPOSIT('7263-1826-19273','1827-5736-1823', '20/06/07') SUM_DEPOSIT FROM DUAL;






-----STORED BLOCK 2-----
REM----------------------------------------------------------------------------------------------------------------------------------
REM Ư�� �Ͻ� �������� ���Ӱ��¿� �Ա��� ��� �ŷ�������� �Ա��Ѿ� ���
REM -> Ư�� �Ͻ�           = P_close_date
REM -> ���Ӱ����� ���¹�ȣ   = P_bid_account_no
REM ��������: ���Ӱ��� �� �Ա� ��� ��ȸ�ϴ� ����� �ٸ� ���Ӱ��� ���� ������Ʈ�� �������� �ٸ� ����鵵 �������� �ʿ��ϴ� �����Ͽ� ����
REM �� ���α׷������� �ַ� ��� �����Ͻ� ���� ��ü �������� �Աݾ��� ��� �����Ͽ� �����ڸ� ���ϱ� ���� ���� (���� �����ű�� �Լ����� ������ ����)
REM----------------------------------------------------------------------------------------------------------------------------------

--���������� �Աݿ���� ��� ���� ������ ���̺� ���� 
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

ALTER TABLE DEPOSIT_SUMMARY_T
 ADD CONSTRAINT DEPOSIT_SUMMARY_T_PK PRIMARY KEY ( MEETING_ACCOUNT_NO,TRANSACTION_ACCOUNT_NO );
 

--���ν��� ����
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
REM SHOW_BIDDERS_DEPOSITS ���ν��� �׽�Ʈ
REM-----------------------------------------------------------------------------

EXECUTE SHOW_BIDDERS_DEPOSITS('7263-1826-19273', '20/06/06');
SELECT * FROM DEPOSIT_SUMMARY_T;


--��Ű��� �� �Ա� ���� ���ϴ� ����
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





