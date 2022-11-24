DROP DATABASE IF EXISTS HOWWORK;

CREATE DATABASE HOWWORK;

USE HOWWORK;

CREATE TABLE ADMINS (
    ID                   CHAR(12)            NOT NULL,
    FULLNAME             VARCHAR(255)        NOT NULL,
    DOB                  DATE                NOT NULL,
    SEX                  CHAR(6)             NOT NULL,
    EMAIL                VARCHAR(255)        NOT NULL,
    PHONE                CHAR(10)            NOT NULL,
    POSITION             CHAR(255)           NOT NULL,
    UNIT                 CHAR(255)           NOT NULL,

    PRIMARY KEY (ID)
);

INSERT INTO ADMINS VALUES('093201008346', 'DUONG HUYNH NHAN', STR_TO_DATE('26/4/2001', '%d/%m/%Y'), 'Male', 'duonghuynhnhan@outlook.com', '0359484001', 'Student', 'College of Information Technology');

CREATE TABLE ADMINACCOUNTS (
    USERNAME             CHAR(10)            NOT NULL,
    PASSWORD             VARCHAR(255)        NOT NULL,
    KEYPASS              VARCHAR(255)        NOT NULL,
    ADMIN                CHAR(12)            NOT NULL,

    FOREIGN KEY (ADMIN) REFERENCES ADMINS(ID),
    PRIMARY KEY (USERNAME)
);

INSERT INTO ADMINACCOUNTS VALUES('admin00001', SHA2('kevin', 512), SHA2('kevin', 256), '093201008346');

CREATE TABLE USERS (
    ID                   CHAR(12)            NOT NULL,
    FULLNAME             VARCHAR(255)        NOT NULL,
    DOB                  DATE                NOT NULL,
    SEX                  CHAR(6)             NOT NULL,
    EMAIL                VARCHAR(255)        NOT NULL,
    PHONE                CHAR(10)            NOT NULL,
    POSITION             CHAR(255)           NOT NULL,
    UNIT                 CHAR(255)           NOT NULL,

    PRIMARY KEY (ID)
);

INSERT INTO USERS VALUES('093201008346', 'DUONG HUYNH NHAN', STR_TO_DATE('26/4/2001', '%d/%m/%Y'), 'Male', 'duonghuynhnhan@outlook.com', '0359484001', 'Student', 'College of Information Technology');
INSERT INTO USERS VALUES('093201008347', 'KEVIN DUONG', STR_TO_DATE('26/4/2001', '%d/%m/%Y'), 'Male', 'kevinduong@outlook.com', '0328406032', 'Student', 'College of Information Technology');

CREATE TABLE USERACCOUNTS (
    USERNAME             CHAR(8)             NOT NULL,
    PASSWORD             VARCHAR(255)        NOT NULL,
    KEYPASS              VARCHAR(255)        NOT NULL,
    USER                 CHAR(12)            NOT NULL,

    FOREIGN KEY (USER) REFERENCES USERS(ID),
    PRIMARY KEY (USERNAME)
);

INSERT INTO USERACCOUNTS VALUES('B1910676', SHA2('kevinduong', 512), SHA2('kevinduong', 256), '093201008346');
INSERT INTO USERACCOUNTS VALUES('C1910676', SHA2('kevinduong', 512), SHA2('kevinduong', 256), '093201008346');


CREATE TABLE JOBS (
    ID                  INT                 AUTO_INCREMENT,
    NAME                VARCHAR(255)        NOT NULL,

    PRIMARY KEY (ID)
);

INSERT INTO JOBS(NAME) VALUES ('Tuyen sinh');
INSERT INTO JOBS(NAME) VALUES ('Xet tot nghiep');
INSERT INTO JOBS(NAME) VALUES ('Chuan bi khai giang');
INSERT INTO JOBS(NAME) VALUES ('Chuan bi be giang');


CREATE TABLE PROJECTS (
    ID                   INT                 AUTO_INCREMENT,
    NAME                 VARCHAR(1000)       NOT NULL,
    DESCRIPTION          VARCHAR(1000)       NOT NULL,
    JOB                  INT                 NOT NULL,
    START                DATETIME            NOT NULL,
    END                  DATETIME            NOT NULL,
    TIME                 INT                 NOT NULL,
    CREATEDDATE          DATETIME            NOT NULL,
    COMPLETEDDATE        DATETIME            NOT NULL,
    UPDATEDDATE          DATETIME            ,
    LEADER               CHAR(10)            NOT NULL,
    COMPLETEDSTATE       FLOAT               NOT NULL,
    STATE                CHAR(10)            NOT NULL, 
    NOTE                 VARCHAR(1000)       ,

    FOREIGN KEY (JOB) REFERENCES JOBS(ID),
    FOREIGN KEY (LEADER)  REFERENCES ADMINACCOUNTS(USERNAME),
    PRIMARY KEY (ID)
);

INSERT INTO PROJECTS(NAME, DESCRIPTION, JOB, START, END, TIME, CREATEDDATE, COMPLETEDDATE, UPDATEDDATE, LEADER, COMPLETEDSTATE, STATE, NOTE)
VALUES ('Tuyen sinh 2023', 'Chuan bi chu dao cho cac em', '1', STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('25/11/2022 12:00:00', '%d/%m/%Y %T'), 20, STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('26/11/2022 12:00:00', '%d/%m/%Y %T'), NULL, 'admin00001',  0, 0, 'Note');

CREATE TABLE TASKS (
    ID                   INT                 AUTO_INCREMENT,
    NAME                 VARCHAR(1000)       NOT NULL,
    DESCRIPTION          VARCHAR(1000)       NOT NULL,
    MEMBEROF             INT                 NOT NULL,
    START                DATETIME            NOT NULL,
    END                  DATETIME            NOT NULL,
    TIME                 INT                 NOT NULL,
    CREATEDDATE          DATETIME            NOT NULL,
    COMPLETEDDATE        DATETIME            NOT NULL,
    UPDATEDDATE          DATETIME            ,
    COMPLETEDSTATE       FLOAT               NOT NULL,
    STATE                CHAR(10)            NOT NULL,
    NOTE                 VARCHAR(1000)       ,

    FOREIGN KEY (MEMBEROF) REFERENCES PROJECTS(ID),
    PRIMARY KEY (ID)
);

INSERT INTO TASKS(NAME, DESCRIPTION, MEMBEROF, START, END, TIME, CREATEDDATE, COMPLETEDDATE, UPDATEDDATE, COMPLETEDSTATE, STATE, NOTE)
VALUES ('Tao poster', 'Can co noi dung ro rang', '1', STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('24/11/2022 12:00:00', '%d/%m/%Y %T'), 3, STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('25/11/2022 12:00:00', '%d/%m/%Y %T'), NULL, 0, 0, 'Poster');
INSERT INTO TASKS(NAME, DESCRIPTION, MEMBEROF, START, END, TIME, CREATEDDATE, COMPLETEDDATE, UPDATEDDATE, COMPLETEDSTATE, STATE, NOTE)
VALUES ('Van nghe', 'Can co noi dung ro rang', '1', STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('24/11/2022 12:00:00', '%d/%m/%Y %T'), 3, STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'), STR_TO_DATE('25/11/2022 12:00:00', '%d/%m/%Y %T'), NULL, 0, 0, 'Van nghe');

CREATE TABLE PROJECTASSIGNED (
    ID                   INT                 AUTO_INCREMENT,
    PROJECT              INT                 NOT NULL,
    USERS                CHAR(8)             NOT NULL,

    FOREIGN KEY (PROJECT) REFERENCES PROJECTS(ID),
    FOREIGN KEY (USERS) REFERENCES USERACCOUNTS(USERNAME),
    PRIMARY KEY (ID, PROJECT, USERS)
);

INSERT INTO PROJECTASSIGNED(PROJECT, USERS) VALUES (1, 'B1910676');
INSERT INTO PROJECTASSIGNED(PROJECT, USERS) VALUES (1, 'C1910676');

CREATE TABLE ASSIGNEDTASK (
    ID                   INT                 AUTO_INCREMENT,
    TASK                 INT                 NOT NULL,
    USERS                CHAR(8)             NOT NULL,

    FOREIGN KEY (TASK) REFERENCES TASKS(ID),
    FOREIGN KEY (USERS) REFERENCES USERACCOUNTS(USERNAME),
    PRIMARY KEY (ID, TASK, USERS)
);

INSERT INTO ASSIGNEDTASK(TASK, USERS) VALUES (1, 'B1910676');
INSERT INTO ASSIGNEDTASK(TASK, USERS) VALUES (2, 'C1910676');

CREATE TABLE PROJECTREPORT (
    ID                   INT                 AUTO_INCREMENT,
    PROJECT              INT                 NOT NULL,
    FILE                 LONGBLOB            NOT NULL,

    FOREIGN KEY (PROJECT) REFERENCES PROJECTS(ID),
    PRIMARY KEY (ID)
);

-- INSERT INTO PROJECTREPORT(PROJECT, FILE) VALUES (1, LOAD_FILE(''));
-- INSERT INTO PROJECTREPORT(PROJECT, FILE) VALUES (1, LOAD_FILE(''));

CREATE TABLE TASKREPORT (
    ID                   INT                 AUTO_INCREMENT,
    TASK                 INT                 NOT NULL,
    FILE                 LONGBLOB            NOT NULL,

    FOREIGN KEY (TASK) REFERENCES ASSIGNEDTASK(ID),
    PRIMARY KEY (ID)
);

-- INSERT INTO TASKREPORT(TR_TASK, TR_FILE) VALUES (1, LOAD_FILE(''));
-- INSERT INTO TASKREPORT(TR_PROJECT, TR_FILE) VALUES (2, LOAD_FILE(''));

CREATE TABLE PROJECTCOMMENT (
    ID                   INT                 AUTO_INCREMENT,
    PROJECT              INT                 NOT NULL,
    COMMENT              VARCHAR(1000)       NOT NULL,
    WHO                  CHAR(10)            NOT NULL,
    TIME                 DATETIME            NOT NULL,

    FOREIGN KEY (PROJECT) REFERENCES PROJECTS(ID),
    PRIMARY KEY (ID)
);

INSERT INTO PROJECTCOMMENT(PROJECT, COMMENT, WHO, TIME) VALUES (1, 'Hello', 'B1910676', STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'));

CREATE TABLE TASKCOMMENT (
    ID                   INT                 AUTO_INCREMENT,
    TASK                 INT                 NOT NULL,
    COMMENT              VARCHAR(1000)       NOT NULL,
    WHO                  CHAR(10)            NOT NULL,
    TIME                 DATETIME            NOT NULL,

    FOREIGN KEY (TASK) REFERENCES TASKS(ID),
    PRIMARY KEY (ID)
);

INSERT INTO TASKCOMMENT(TASK, COMMENT, WHO, TIME) VALUES (1, 'Hello', 'B1910676', STR_TO_DATE('21/11/2022 12:00:00', '%d/%m/%Y %T'));
