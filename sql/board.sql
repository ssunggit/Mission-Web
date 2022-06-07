-- 게시판 테이블 생성
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
VALUES(SEQ_T_BOARD_NO.NEXTVAL,'제목입니다','홍길동','내용입니다');

INSERT INTO T_BOARD(NO, title, writer, content) 
VALUES(SEQ_T_BOARD_NO.NEXTVAL,'제목입니다2','홍길동','내용입니다2');

commit;

