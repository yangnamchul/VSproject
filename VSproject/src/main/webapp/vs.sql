select * from tabs ;


/* Drop Tables */

DROP TABLE Admin_Board CASCADE CONSTRAINTS;
DROP TABLE Vote CASCADE CONSTRAINTS;
DROP TABLE Board CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Admin_Board
(
	A_seq number NOT NULL,
	B_seq number NOT NULL,
	PRIMARY KEY (A_seq)
);


CREATE TABLE Board
(
	B_seq number NOT NULL,
	U_seq number NOT NULL,
	C_seq number NOT NULL,
	Re_seq number NOT NULL,
	B_title varchar2(20) NOT NULL,
	B_content varchar2(500),
	B_cnt number NOT NULL,
	B_date date NOT NULL,
	B_tag varchar2(50) NOT NULL,
	PRIMARY KEY (B_seq)
);


CREATE TABLE Category
(
	C_seq number NOT NULL,
	C_name varchar2(20) NOT NULL,
	PRIMARY KEY (C_seq)
);


CREATE TABLE Reply
(
	Re_seq number NOT NULL,
	Re_content varchar2(100) NOT NULL,
	Re_date date NOT NULL,
	Re_parent number,
	PRIMARY KEY (Re_seq)
);


CREATE TABLE Users
(
	U_seq number NOT NULL,
	U_id varchar2(20) NOT NULL UNIQUE,
	U_pw varchar2(50) NOT NULL,
	U_name varchar2(30) NOT NULL,
	U_email varchar2(50) NOT NULL UNIQUE,
	U_date date NOT NULL,
	PRIMARY KEY (U_seq)
);


CREATE TABLE Vote
(
	V_seq number NOT NULL,
	B_seq number NOT NULL,
	V_first number NOT NULL,
	V_last number NOT NULL,
	PRIMARY KEY (V_seq)
);



/* Create Foreign Keys */

ALTER TABLE Admin_Board
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


ALTER TABLE Vote
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


ALTER TABLE Board
	ADD FOREIGN KEY (C_seq)
	REFERENCES Category (C_seq)
;


ALTER TABLE Board
	ADD FOREIGN KEY (Re_seq)
	REFERENCES Reply (Re_seq)
;


ALTER TABLE Board
	ADD FOREIGN KEY (U_seq)
	REFERENCES Users (U_seq)
;

select *
from USERS;

insert into USERS
values(1,'admin','admin','admin','admin','2019-08-20');

SELECT *
FROM Board;

