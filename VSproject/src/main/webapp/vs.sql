
/* Drop Tables */

DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Tag CASCADE CONSTRAINTS;
DROP TABLE Vote CASCADE CONSTRAINTS;
DROP TABLE Board CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE VSS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Board
(
	B_seq number NOT NULL,
	U_id varchar2(4000) NOT NULL,
	VSS_seq number NOT NULL,
	B_title varchar2(4000) NOT NULL,
	B_content varchar2(4000),
	B_cnt number NOT NULL,
	B_date date NOT NULL,
	B_boolean number NOT NULL,
	B_parent number,
	B_left varchar2(4000),
	B_right varchar2(4000),
	PRIMARY KEY (B_seq)
);


CREATE TABLE Reply
(
	Re_seq number NOT NULL,
	B_seq number NOT NULL,
	U_id varchar2(4000) NOT NULL,
	Re_content varchar2(4000) NOT NULL,
	Re_date date NOT NULL,
	Re_parent number,
	Re_boolean number,
	PRIMARY KEY (Re_seq)
);


CREATE TABLE Tag
(
	B_seq number NOT NULL,
	VSS_seq number NOT NULL
);


CREATE TABLE Users
(
	U_seq number NOT NULL,
	U_id varchar2(4000) NOT NULL,
	U_pw varchar2(4000) NOT NULL,
	U_name varchar2(4000) NOT NULL,
	U_email varchar2(4000) NOT NULL,
	U_date date NOT NULL,
	U_SessionKey varchar2(4000),
	U_Sessionlimit timestamp,
	PRIMARY KEY (U_id)
);


CREATE TABLE Vote
(
	V_seq number NOT NULL,
	B_seq number NOT NULL,
	U_id varchar2(4000),
	-- 1 : 전자
	-- 2 : 후자
	V_like number NOT NULL,
	V_date date,
	V_ip varchar2(4000),
	PRIMARY KEY (V_seq)
);


CREATE TABLE VSS
(
	VSS_seq number NOT NULL,
	VSS_name varchar2(20) NOT NULL,
	VSS_content varchar2(4000),
	PRIMARY KEY (VSS_seq)
);



/* Create Foreign Keys */

ALTER TABLE Reply
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


ALTER TABLE Tag
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


ALTER TABLE Vote
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


ALTER TABLE Board
	ADD FOREIGN KEY (U_id)
	REFERENCES Users (U_id)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (U_id)
	REFERENCES Users (U_id)
;


ALTER TABLE Vote
	ADD FOREIGN KEY (U_id)
	REFERENCES Users (U_id)
;


ALTER TABLE Board
	ADD FOREIGN KEY (VSS_seq)
	REFERENCES VSS (VSS_seq)
;


ALTER TABLE Tag
	ADD FOREIGN KEY (VSS_seq)
	REFERENCES VSS (VSS_seq)
;



/* Comments */

COMMENT ON COLUMN Vote.V_like IS '1 : 전자
2 : 후자';

















insert into USERS
values(1,'admin','admin','admin','admin',sysdate,null,null);

insert into USERS
values(2,'123','456','asd','asd',sysdate,null,null);

SELECT u_id, u_pw
FROM USERS 
WHERE u_id='admin' and u_pw='admin' ;

insert into VSS
values(0,'없음',null);
insert into VSS
values(1,'테크','최신 기술');
insert into VSS
values(2,'스포츠','운동');
insert into VSS
values(3,'인물','사람들');

insert into BOARD
values(1,'123',1,'hello','hello11',1,sysdate,0,null,null,null);

insert into reply
values(1,1,'123','댓글입니다12333',sysdate,null,null);

select *
from users;
SELECT * FROM tabs;
SELECT * FROM Board;
SELECT * FROM vote;
SELECT * FROM VSS;
SELECT * FROM reply ; 

SELECT * FROM vote where b_seq=63;
SELECT * FROM Board where b_seq=41;

create sequence board_sequence1;
create sequence user_sequence1;
create sequence Reply_sequence1;
create sequence Vote_sequence1;
create sequence VSS_sequence1;

insert into board
values(board_sequence1.NEXTVAL, '123',1,'1234','4321',1,sysdate,0,null,'123','321');
1
SELECT VSS_sequence1.NEXTVAL
FROM DUAL;

select * 
from board 
where b_content is like(
    SELECT vss_seq
    FROM VSS
    WHERE vss_seq=5;
    )

SELECT count(*) FROM REPLY WHERE B_SEQ = 1 ;

SELECT u_name FROM users;		