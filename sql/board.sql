-- �Խ��� ���̺� ����
CREATE TABLE t_board(
    no number(5) PRIMARY KEY
    , title VARCHAR2(200) not null
    , writer VARCHAR2(50) not null 
    , content VARCHAR2(4000) not null
    , view_cnt number(5) DEFAULT 0
    , reg_date DATE DEFAULT SYSDATE 
);

CREATE SEQUENCE seq_t_board_no;

select * from T_BOARD;

INSERT INTO T_BOARD(NO, title, writer, content) 
VALUES(SEQ_T_BOARD_NO.NEXTVAL,'�����Դϴ�','ȫ�浿','�����Դϴ�');

INSERT INTO T_BOARD(NO, title, writer, content) 
VALUES(SEQ_T_BOARD_NO.NEXTVAL,'�����Դϴ�2','ȫ�浿','�����Դϴ�2');

commit;

