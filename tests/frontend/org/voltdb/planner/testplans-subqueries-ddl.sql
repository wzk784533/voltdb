CREATE TABLE R1 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL,
	D INTEGER NOT NULL
);
CREATE TABLE R2 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL
);

CREATE INDEX A_ON_R2 ON R2(A);

CREATE TABLE R3 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL
);

CREATE TABLE P1 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL,
	D INTEGER NOT NULL
	,CONSTRAINT P1_PK_TREE PRIMARY KEY(A)
);
PARTITION TABLE P1 ON COLUMN A;

CREATE TABLE P2 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL,
	D INTEGER NOT NULL
	,CONSTRAINT P2_PK_TREE PRIMARY KEY(A)
);
PARTITION TABLE P2 ON COLUMN A;

CREATE TABLE P3 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL,
	D INTEGER NOT NULL
	,CONSTRAINT P3_PK_TREE PRIMARY KEY(A)
);
PARTITION TABLE P3 ON COLUMN A;

CREATE TABLE P4 (
	A INTEGER NOT NULL,
	C INTEGER NOT NULL,
	D INTEGER NOT NULL
	,CONSTRAINT P4_PK_TREE PRIMARY KEY(A)
);
PARTITION TABLE P4 ON COLUMN A;


--- ENG-6276
CREATE TABLE SR4 (  
ID INTEGER DEFAULT 0 NOT NULL,  
DESC VARCHAR(20),  
NUM INTEGER,  
RATIO FLOAT,
CONSTRAINT SR4_PK_TREE PRIMARY KEY (ID) ); 

CREATE TABLE SP4 (  
ID INTEGER DEFAULT 0 NOT NULL,  
DESC VARCHAR(20),  
NUM INTEGER,  
RATIO FLOAT,
CONSTRAINT SP4_PK_TREE PRIMARY KEY (ID) ); 
PARTITION TABLE SP4 ON COLUMN ID;

--- ENG-7770
CREATE TABLE pgr
(
    utc_timestamp bigint,
    s int not null,
    count_for_day int
);
partition table pgr on column s;

CREATE VIEW user_heat AS
SELECT s,
((EXTRACT(HOUR FROM to_timestamp(second, utc_timestamp))*60)) AS hotspot_hm,
COUNT(*) heat
FROM pgr
GROUP BY s, hotspot_hm;

