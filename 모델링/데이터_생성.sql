--member_t ���̺� CRUD �ۼ�
REM ȸ������
INSERT ALL 
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('kevin','������','970212-1442125','M','010-3224-4228','kevin@gmail.com','����Ư���� ���ʱ� ���絿 275','321-2347-72312','05')
    SELECT * FROM DUAL;
    
REM ȸ���� �ּ� ��ȸ
SELECT address
FROM member_t
WHERE member_id = 'kevin';

REM ȸ������ ����
UPDATE member_t SET cell_phone_no = '010-1928-4228' WHERE member_id = 'kevin';    
    
REM ȸ��Ż��
DELETE FROM member_t WHERE MEMBER_ID = 'kevin';

--group_code_t ���̺� CRUD �ۼ�
REM �׷��ڵ� �߰�
INSERT ALL
    INTO group_code_t(code_category,code_name)
    VALUES('900','�߰��׷��ڵ�')
    SELECT * FROM DUAL;
    
REM �׷��ڵ�� ��ȸ
SELECT code_name
FROM group_code_t
WHERE code_category = '900';

REM �׷��ڵ�� ����
UPDATE group_code_t SET code_name = '�Աݹ��' WHERE code_category = '900';

REM �׷��ڵ� ����
DELETE FROM group_code_t WHERE code_category = '900';


--detail_code_t ���̺� CRUD �ۼ�
REM ���ڵ� �߰�
INSERT ALL
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('900','01','�ſ�ī��','Y')
    SELECT * FROM DUAL;
    
REM ���ڵ�� ��ȸ
SELECT code_name
FROM detail_code_t
WHERE code_category = '900' AND code_no = '01';

REM ���ڵ�� ����
UPDATE detail_code_t SET code_name = '�������Ա�' WHERE code_category = '900' AND code_no = '01';

REM ���ڵ� ����
DELETE FROM detail_code_t WHERE code_category = '900' AND code_no = '01';


--auction_t ���̺� CRUD �ۼ�
REM ���ο� ��� ����
INSERT ALL
    INTO auction_t(bid_mode,start_date,close_date,status,start_price,bid_unit,auction_seq)
    VALUES('O',TO_DATE('2020-06-07 00:00','RRRR-MM-DD HH24:MI'),TO_DATE('2020-06-12 23:59','RRRR-MM-DD HH24:MI'),'ON',70000,10000,11)
    SELECT * FROM DUAL;
    
REM ��� ���۰� ��ȸ
SELECT start_price
FROM auction_t
WHERE auction_seq = 11;

REM ��� ���۰� ����
UPDATE auction_t SET start_price = 100000 WHERE auction_seq = 11;

REM ��� öȸ
DELETE FROM auction_t WHERE auction_seq = 11;



--participant_t ���̺� CRUD �ۼ� (U�� ���� ���� �߻�!)
REM ȸ���� ��� �����ڷ� ����
INSERT ALL
    INTO participant_t(member_id,auction_seq,member_type)
    VALUES('kevin',5,'B')
    SELECT * FROM DUAL;

REM ��ſ� ������ ��������� ��� ��ȸ
SELECT member_id
FROM participant_t
WHERE auction_seq = 5;

REM �ش� ��Űǿ� ���� ���� öȸ 
DELETE FROM participant_t WHERE auction_seq = 5;


--goods_t ���̺� CRUD �ۼ�
REM ��Ż�ǰ ���
INSERT ALL
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-06-08 09:42','RRRR-MM-DD HH24:MI'),'Į��Ʈ ������',11)
    SELECT * FROM DUAL;
    
REM ��Ż�ǰ�� ��ǰ�� ��ȸ
SELECT name
FROM goods_t
WHERE auction_seq = 11;

REM ��Ż�ǰ�� ��ǰƯ¡ ����
UPDATE goods_t SET feature = 'PE' WHERE auction_seq = 11;

REM ��Ż�ǰ ���
DELETE FROM goods_t WHERE auction_seq = 11;


--winner_t ���̺� CRUD �ۼ� (U�� ���� ���� �߻�!)
REM ������ �߻�
INSERT ALL
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(300000,TO_DATE('2020-06-10 23:59','RRRR-MM-DD HH24:MI'),'maiven',1,'B')
    SELECT * FROM DUAL;
    
REM �������� ������ ��ȸ
SELECT win_price
FROM winner_t
WHERE auction_seq = 1;

REM ���� öȸ
DELETE FROM winner_t WHERE auction_seq = 1;


--auction_meeting_account_t ���̺� CRUD �ۼ�
REM ��Ÿ��Ӱ��� ����
INSERT ALL
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('232-1537-12143',TO_DATE('2020-06-07 00:00','RRRR-MM-DD HH24:MI'),11,'���Z')
    SELECT * FROM DUAL;
    
REM ��Ÿ��Ӱ����� ���� ��� ��ȸ
SELECT account_holder
FROM auction_meeting_account_t
WHERE auction_seq = 11;

REM ��Ÿ��Ӱ����� ���� ��� ����
UPDATE auction_meeting_account_t SET account_holder = '���Y' WHERE auction_seq = 11;

REM ��Ÿ��Ӱ��� ����
DELETE FROM auction_meeting_account_t WHERE auction_seq = 11;


--account_transaction_t ���̺� CRUD �ۼ� (U,D�� ���� ���� �߻�!)
REM ��Ÿ��Ӱ��·� �Ա� �ŷ� �߻�
INSERT ALL
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 13:57','RRRR-MM-DD HH24:MI'),'321-2347-72312',100000,'������','17653-17263-182','D',9)
    SELECT * FROM DUAL;
    
REM �ش� ��Ÿ��Ӱ����� �Աݳ��� ��ȸ
SELECT transaction_date, transaction_account_no, transaction_name, transaction_amount
FROM account_transaction_t
WHERE bid_account_no = '7263-1826-19273' and category = 'D' ;








    
    
 
