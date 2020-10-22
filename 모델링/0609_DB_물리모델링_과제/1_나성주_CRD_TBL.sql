------���̺� ����-----------------------------------------------------------------
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
 
 





 
 

 
 


