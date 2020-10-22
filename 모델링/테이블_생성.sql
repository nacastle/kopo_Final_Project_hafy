--ȸ�� ���̺�
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

COMMENT ON COLUMN member_t.member_id IS 'ȸ�� ���̵�';

COMMENT ON COLUMN member_t.name IS '�̸�';

COMMENT ON COLUMN member_t.social_security_no IS '�ֹε�Ϲ�ȣ';

COMMENT ON COLUMN member_t.sex IS '����(�ڵ�)';

COMMENT ON COLUMN member_t.cell_phone_no IS '�ڵ���';

COMMENT ON COLUMN member_t.email IS '�̸���';

COMMENT ON COLUMN member_t.address IS '�ּ�';

COMMENT ON COLUMN member_t.account_no IS '���¹�ȣ';

COMMENT ON COLUMN member_t.account_bank IS '��������(�ڵ�)';

COMMENT ON TABLE member_t IS 'ȸ��';

ALTER TABLE member_t
 ADD CONSTRAINT MEMBER_T_PK PRIMARY KEY ( member_id );
 
 
--��� ���̺�
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

COMMENT ON COLUMN auction_t.bid_mode IS '�������(�ڵ�: ��������/���������)';

COMMENT ON COLUMN auction_t.start_date IS '��Ž�����';

COMMENT ON COLUMN auction_t.close_date IS '��Ÿ�����';

COMMENT ON COLUMN auction_t.status IS '��� ó������(�ڵ�: ���/��������/����)';

COMMENT ON COLUMN auction_t.start_price IS '��Ž��۰�';

COMMENT ON COLUMN auction_t.bid_unit IS '��������(�ڵ�)';

COMMENT ON COLUMN auction_t.auction_seq IS '��� ��ȣ';

COMMENT ON TABLE auction_t IS '���';

ALTER TABLE auction_t
 ADD CONSTRAINT AUCTION_T_PK PRIMARY KEY ( auction_seq );
 
 
--������ ���̺�
CREATE TABLE participant_t
(
    member_id    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL,
    member_type    VARCHAR2(10) NOT NULL    
);

COMMENT ON COLUMN participant_t.member_id IS '��ſ� ������ ������(�Ǹ���/������)�� ID';

COMMENT ON COLUMN participant_t.auction_seq IS '�����ڰ� ������ ��Ź�ȣ';

COMMENT ON COLUMN participant_t.member_type IS 'ȸ������(�Ǹ���/������)';

COMMENT ON TABLE participant_t IS '���������';

ALTER TABLE participant_t
 ADD CONSTRAINT PARTICIPANT_T_PK PRIMARY KEY ( member_id,auction_seq,member_type );
 
ALTER TABLE participant_t
 ADD CONSTRAINT AUCTION_SEQ_FK FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);
 
 
 --��Ż�ǰ ���̺�
 CREATE TABLE goods_t
(
    category    VARCHAR2(10) NOT NULL,
    feature    VARCHAR2(10) NOT NULL,
    registration_date    DATE NOT NULL,
    name    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL
);

COMMENT ON COLUMN goods_t.category IS '��ǰ ī�װ�(�ڵ�: �Ƿ�, ��Ȱ��ǰ, ���� ��)';

COMMENT ON COLUMN goods_t.feature IS '��ǰ Ư¡(�ڵ�: �µ��� �ΰ���, ������ ���� ��)';

COMMENT ON COLUMN goods_t.registration_date IS '��ǰ�����';

COMMENT ON COLUMN goods_t.name IS '��ǰ��';

COMMENT ON COLUMN goods_t.auction_seq IS '��� ��ȣ';

COMMENT ON TABLE goods_t IS '��Ż�ǰ';

ALTER TABLE goods_t
 ADD CONSTRAINT AUCTION_SEQ_FK2 FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);

ALTER TABLE goods_t
 ADD CONSTRAINT GOODS_T_PK PRIMARY KEY ( auction_seq );


--��Ÿ��Ӱ��� ���̺�
CREATE TABLE auction_meeting_account_t
(
    bid_account_no    VARCHAR2(40) NOT NULL,
    create_date    DATE NOT NULL,
    account_name    NUMBER NOT NULL,
    account_holder    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN auction_meeting_account_t.bid_account_no IS '��� ���������� ���¹�ȣ';

COMMENT ON COLUMN auction_meeting_account_t.create_date IS '���»�����';

COMMENT ON COLUMN auction_meeting_account_t.account_name IS '���¸�(��Ź�ȣ�� ����)';

COMMENT ON COLUMN auction_meeting_account_t.account_holder IS '�����ָ�';

COMMENT ON TABLE auction_meeting_account_t IS '��Ÿ��Ӱ���';

ALTER TABLE auction_meeting_account_t
 ADD CONSTRAINT auction_meeting_account_t_PK PRIMARY KEY ( bid_account_no );

ALTER TABLE auction_meeting_account_t
 ADD CONSTRAINT AUCTION_SEQ_FK3 FOREIGN KEY (account_name) REFERENCES auction_t(auction_seq);
 commit;
 
--������ ���̺�
CREATE TABLE winner_t
(
    win_price    NUMBER NOT NULL,
    win_date    DATE NOT NULL,
    member_id    VARCHAR2(30) NOT NULL,
    auction_seq    NUMBER NOT NULL,
    member_type    VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN winner_t.win_price IS '������';

COMMENT ON COLUMN winner_t.win_date IS '�����Ͻ�';

COMMENT ON COLUMN winner_t.member_id IS '������ ȸ�� ���̵�';

COMMENT ON COLUMN winner_t.auction_seq IS '��� ��ȣ';

COMMENT ON COLUMN winner_t.member_type IS 'ȸ�� ����(������)';

COMMENT ON TABLE winner_t IS '������';

ALTER TABLE winner_t
 ADD CONSTRAINT WINNER_T_PK PRIMARY KEY ( member_id,auction_seq );

ALTER TABLE winner_t
 ADD CONSTRAINT MEMBER_ID_FK FOREIGN KEY (member_id) REFERENCES member_t(member_id);

ALTER TABLE winner_t
 ADD CONSTRAINT AUCTION_SEQ_FK4 FOREIGN KEY (auction_seq) REFERENCES auction_t(auction_seq);
 
 
 --����� �ŷ����� ���̺�
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

COMMENT ON COLUMN account_transaction_t.transaction_date IS '����� �ŷ� �Ͻ�';

COMMENT ON COLUMN account_transaction_t.transaction_account_no IS '����� ��� ���¹�ȣ';

COMMENT ON COLUMN account_transaction_t.transaction_amount IS '���߱� �ŷ� �ݾ�';

COMMENT ON COLUMN account_transaction_t.transaction_name IS '����� �ŷ��ڸ�';

COMMENT ON COLUMN account_transaction_t.bid_account_no IS '��� ���Ӱ��¹�ȣ';

COMMENT ON COLUMN account_transaction_t.category IS '�ŷ�����(�ڵ�: �Ա�/���)';

COMMENT ON COLUMN account_transaction_t.transaction_seq IS '�ŷ� ��ȣ';

COMMENT ON TABLE account_transaction_t IS '����� �ŷ�����';

ALTER TABLE account_transaction_t
 ADD CONSTRAINT ACCOUNT_TRANSACTION_T_PK PRIMARY KEY ( transaction_seq );

ALTER TABLE account_transaction_t
 ADD CONSTRAINT BID_ACCOUNT_NO_FK FOREIGN KEY (bid_account_no) REFERENCES auction_meeting_account_t(bid_account_no);

 
 --�׷��ڵ� ���̺�
 CREATE TABLE group_code_t
(
    code_category    VARCHAR2(10) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN group_code_t.code_category IS '�׷��ڵ� �з�(�Ӽ� ����)';

COMMENT ON COLUMN group_code_t.code_name IS '�׷��ڵ��';

COMMENT ON TABLE group_code_t IS '�׷��ڵ�';

ALTER TABLE group_code_t
 ADD CONSTRAINT GROUP_CODE_T_PK PRIMARY KEY ( code_category );
 
 
 --���ڵ� ���̺�
 CREATE TABLE detail_code_t
(
    code_no    VARCHAR2(10) NOT NULL,
    code_name    VARCHAR2(30) NOT NULL,
    code_category    VARCHAR2(10) NOT NULL,
    usage_status    VARCHAR2(5) NOT NULL
);

COMMENT ON COLUMN detail_code_t.code_no IS '���ڵ� �з�';

COMMENT ON COLUMN detail_code_t.code_name IS '���ڵ��';

COMMENT ON COLUMN detail_code_t.code_category IS '�׷��ڵ� �з�';

COMMENT ON COLUMN detail_code_t.usage_status IS '���ڵ� ��뿩��(Y/N)';

COMMENT ON TABLE detail_code_t IS '���ڵ�';

ALTER TABLE detail_code_t
 ADD CONSTRAINT DETAIL_CODE_T_PK PRIMARY KEY ( code_category,code_no );

ALTER TABLE detail_code_t
 ADD CONSTRAINT CODE_CATEGORY_FK FOREIGN KEY (code_category) REFERENCES group_code_t(code_category);
 
 
 -----------------------------------------------------------------------------------------------------------------------------
 
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


 
 

 
 


