
/* Drop Tables */

DROP TABLE Like1 CASCADE CONSTRAINTS;
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


CREATE TABLE Like1
(
	B_seq number NOT NULL,
	U_id varchar2(4000),
	L_like number,
	L_date date,
	L_ip varchar2(4000)
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

ALTER TABLE Like1
	ADD FOREIGN KEY (B_seq)
	REFERENCES Board (B_seq)
;


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


ALTER TABLE Like1
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



