 -------������ ����------------------------------------------------------------------
 --member_t ���̺� ������ ����
INSERT ALL 
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('burce','������','990717-2342945','F','010-4211-1928','burce@gmail.com','����Ư���� ���ʱ� ���絿 275','923-1827-19273','01')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('dannath','������','910226-2981599','F','010-9182-9381','dannath@naver.com','����Ư���� ������ ��� 467-6','8472-18273-1826','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('domine','�̻���','900824-1619654','M','010-3927-1927','domine@daum.net','����Ư���� ���ʱ� ���絿 67-5','7162-18263-192','03')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('gunnocoxus','������','980405-2980640','F','010-7162-3912','gunnocoxus@gmail.com','����Ư���� ������ ����1�� ����� 204','1827-5736-1823','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('handil','������','950113-1929114','M','010-9217-5638','handil@naver.com','����Ư���� ������ ����4�� ���ַ� 101','192-5736-18263','04')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('lorian','��õȣ','940120-1372926','M','010-1726-1528','lorian@hanmail.net','��⵵ ������ �д籸 ���� ����Ǳ��� 670','8173-18263-182','04')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('maiven','������','931017-1811575','M','010-9381-2936','maiven@gmail.com','��⵵ ������ �д籸 ����','37162-172635-172','05')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('paroc','���¿�','940415-2351829','F','010-1527-5821','paroc@naver.com','����Ư���� ������ �Ͽ��� �Ͽ��� 37','8562-28163-1827','02')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('sinkin','������','940807-2082430','F','010-1726-5927','sinkin@gmail.com','����Ư���� ������ ��ġ1�� ������ 224','6737-18253-182','01')
    INTO member_t(member_id,name,social_security_no,sex,cell_phone_no,email,address,account_no,account_bank)
    VALUES('tessa','�����','930221-1185074','M','010-5972-9172','tessa@gmail.com','����Ư���� ������ ������ 12-4','5836-18273-182','03')
    SELECT * FROM DUAL;
    

--group_code_t ���̺� ������ ����
INSERT ALL
    INTO group_code_t(code_category,code_name)
    VALUES('100','����')
    INTO group_code_t(code_category,code_name)
    VALUES('200','��������')
    INTO group_code_t(code_category,code_name)
    VALUES('300','ȸ������')
    INTO group_code_t(code_category,code_name)
    VALUES('400','��ǰī�װ�')
    INTO group_code_t(code_category,code_name)
    VALUES('500','��ǰƯ¡')
    INTO group_code_t(code_category,code_name)
    VALUES('600','�������')
    INTO group_code_t(code_category,code_name)
    VALUES('700','ó������')
    INTO group_code_t(code_category,code_name)
    VALUES('800','�ŷ�����')
    SELECT * FROM DUAL;
    

--detail_code_t ���̺� ������ ����
INSERT ALL
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('100','M','����','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('100','F','����','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','01','�ϳ�����','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','02','��������','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','03','�������','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','04','��������','Y')
    INTO detail_code_t(code_category,code_no,code_name,usage_status)
    VALUES('200','05','�츮����','Y')
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


--auction_t ���̺� ������ ����
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
    

--participant_t ���̺� ������ ����
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


--winner_t ���̺� ������ ����
INSERT ALL
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(100000,TO_DATE('2020-06-07 22:32','RRRR-MM-DD HH24:MI'),'gunnocoxus',4,'B')
    INTO winner_t(win_price,win_date,member_id,auction_seq,member_type)
    VALUES(200000,TO_DATE('2020-06-06 23:52','RRRR-MM-DD HH24:MI'),'sinkin',5,'B')
    SELECT * FROM DUAL;


--goods_t ���̺� ������ ����
INSERT ALL
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-25 12:32','RRRR-MM-DD HH24:MI'),'�ڶ� ����',1)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-24 13:24','RRRR-MM-DD HH24:MI'),'�����ٳ� ����',2)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-23 09:12','RRRR-MM-DD HH24:MI'),'����Ŭ�� ��Ʈ��',3)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FO','PE',TO_DATE('2020-05-22 17:02','RRRR-MM-DD HH24:MI'),'��������',4)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FO','PE',TO_DATE('2020-05-21 18:09','RRRR-MM-DD HH24:MI'),'���ֹ�',5)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('HA','FR',TO_DATE('2020-05-20 20:03','RRRR-MM-DD HH24:MI'),'��ǳ��',6)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('HA','FR',TO_DATE('2020-05-19 17:38','RRRR-MM-DD HH24:MI'),'���ڷ�����',7)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('BE','NONE',TO_DATE('2020-05-18 17:23','RRRR-MM-DD HH24:MI'),'��ũ��',8)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('BE','NONE',TO_DATE('2020-05-17 15:42','RRRR-MM-DD HH24:MI'),'�ڵ�ũ��',9)
    INTO goods_t(category,feature,registration_date,name,auction_seq)
    VALUES('FA','NONE',TO_DATE('2020-05-16 14:03','RRRR-MM-DD HH24:MI'),'���� �����',10)
    SELECT * FROM DUAL;
    

--auction_meeting_account_t ���̺� ������ ����
INSERT ALL
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('182-1837-19573',TO_DATE('2020-06-06 00:00','RRRR-MM-DD HH24:MI'),1,'���A')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('176-3716-18263',TO_DATE('2020-06-10 00:00','RRRR-MM-DD HH24:MI'),2,'���B')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('563-16351-5826',TO_DATE('2020-06-04 00:00','RRRR-MM-DD HH24:MI'),3,'���C')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('7263-1826-19273',TO_DATE('2020-06-03 00:00','RRRR-MM-DD HH24:MI'),4,'���D')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('8165-28162-381',TO_DATE('2020-06-02 00:00','RRRR-MM-DD HH24:MI'),5,'���E')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('5763-72631-18731',TO_DATE('2020-06-01 00:00','RRRR-MM-DD HH24:MI'),6,'���F')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('17653-17263-182',TO_DATE('2020-05-31 00:00','RRRR-MM-DD HH24:MI'),7,'���G')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('726-17263-1875',TO_DATE('2020-05-30 00:00','RRRR-MM-DD HH24:MI'),8,'���H')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('5826-71623-1827',TO_DATE('2020-05-29 00:00','RRRR-MM-DD HH24:MI'),9,'���I')
    INTO auction_meeting_account_t(bid_account_no,create_date,account_name,account_holder)
    VALUES('523-17263-1872',TO_DATE('2020-05-28 00:00','RRRR-MM-DD HH24:MI'),10,'���J')
    SELECT * FROM DUAL;    
    



--account_transaction_t ���̺� ������ ����
INSERT ALL
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 12:23','RRRR-MM-DD HH24:MI'),'1827-5736-1823',100000,'������','7263-1826-19273','D',1)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-03 15:33','RRRR-MM-DD HH24:MI'),'7162-18263-192',70000,'�̻���','7263-1826-19273','D',2)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-04 16:53','RRRR-MM-DD HH24:MI'),'8472-18273-1826',60000,'������','7263-1826-19273','D',3)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-05 15:37','RRRR-MM-DD HH24:MI'),'8173-18263-182',20000,'��õȣ','7263-1826-19273','D',4)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'7162-18263-192',70000,'�̻���','7263-1826-19273','W',5)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'8472-18273-1826',60000,'������','7263-1826-19273','W',6)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-08 10:00','RRRR-MM-DD HH24:MI'),'8173-18263-182',20000,'��õȣ','7263-1826-19273','W',7)
    INTO account_transaction_t(transaction_date,transaction_account_no,transaction_amount,transaction_name,bid_account_no,category,transaction_seq)
    VALUES(TO_DATE('2020-06-11 10:00','RRRR-MM-DD HH24:MI'),'923-1827-19273',100000,'������','7263-1826-19273','W',8)
    SELECT * FROM DUAL;    

-----���̺�� CRUD �ۼ�---------------------------------------------------------------
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























    
    
 
