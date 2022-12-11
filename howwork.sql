DROP DATABASE IF EXISTS howwork;

CREATE DATABASE howwork;

USE howwork;

CREATE TABLE persons (
    id                   CHAR(12)            NOT NULL,
    fullname             VARCHAR(255)        NOT NULL,
    dob                  VARCHAR(15)         NOT NULL,
    sex                  CHAR(6)             NOT NULL,
    email                VARCHAR(255)        NOT NULL,
    phone                CHAR(10)            NOT NULL,
    position             CHAR(255)           NOT NULL,
    unit                 CHAR(255)           NOT NULL,

    PRIMARY KEY (id)
);

INSERT INTO persons VALUES('093201008346', 'DUONG HUYNH NHAN', '26/04/2001', 'Male', 'duonghuynhnhan@outlook.com', '0359484001', 'Student', 'College of Information Technology');
INSERT INTO persons VALUES('093201008347', 'DUONG HUYNH NHAN', '26/04/2001', 'Male', 'duonghuynhnhan@outlook.com', '0359484001', 'Student', 'College of Information Technology');

CREATE TABLE accounts (
    username             CHAR(10)            NOT NULL,
    password             VARCHAR(255)        NOT NULL,
    keypass              VARCHAR(255)        NOT NULL,
    avatar               VARCHAR(255)        ,
    role                 CHAR(1)             NOT NULL,
    person               CHAR(12)            NOT NULL,

    FOREIGN KEY (person) REFERENCES persons(id),
    PRIMARY KEY (username)
);

INSERT INTO accounts VALUES('admin00001', SHA2('kevin', 512), SHA2('kevin', 256), NULL, '0', '093201008346');
INSERT INTO accounts VALUES('B1910676', SHA2('kevinduong', 512), SHA2('kevinduong', 256), NULL, '1', '093201008346');
INSERT INTO accounts VALUES('C1910676', SHA2('kevinduong', 512), SHA2('kevinduong', 256), NULL, '1', '093201008346');

CREATE TABLE jobs (
    id                  INT                 AUTO_INCREMENT,
    name                VARCHAR(255)        NOT NULL,

    PRIMARY KEY (id)
);

INSERT INTO jobs(name) VALUES ('Tuyen sinh');
INSERT INTO jobs(name) VALUES ('Xet tot nghiep');
INSERT INTO jobs(name) VALUES ('Chuan bi khai giang');
INSERT INTO jobs(name) VALUES ('Chuan bi be giang');

CREATE TABLE projects (
    id                   INT                 AUTO_INCREMENT,
    name                 VARCHAR(1000)       NOT NULL,
    description          VARCHAR(1000)       NOT NULL,
    job                  INT                 NOT NULL,
    start                VARCHAR(30)         NOT NULL,
    end                  VARCHAR(30)         NOT NULL,
    time                 INT                 NOT NULL,
    createddate          VARCHAR(30)         NOT NULL,
    completeddate        VARCHAR(30)         NOT NULL,
    updateddate          VARCHAR(30)         ,
    leader               CHAR(10)            NOT NULL,
    completedstate       FLOAT               NOT NULL,
    state                CHAR(10)            NOT NULL, 
    note                 VARCHAR(1000)       ,

    FOREIGN KEY (job) REFERENCES jobs(id),
    FOREIGN KEY (leader) REFERENCES accounts(username),
    PRIMARY KEY (id)
);

INSERT INTO projects(name, description, job, start, end, TIME, createddate, completeddate, updateddate, leader, completedstate, state, note)
VALUES ('Tuyen sinh 2023', 'Chuan bi chu dao cho cac em', 1, '21/11/2022 12:00:00', '21/11/2022 12:00:00', 20, '21/11/2022 12:00:00', '21/11/2022 12:00:00', NULL, 'admin00001',  0, 0, 'note');

INSERT INTO projects(name, description, job, start, end, TIME, createddate, completeddate, updateddate, leader, completedstate, state, note)
VALUES ('Tuyen sinh 2024', 'Chuan bi chu dao cho cac em', 1, '21/11/2022 12:00:00', '21/11/2022 12:00:00', 20, '21/11/2022 12:00:00', '21/11/2022 12:00:00', NULL, 'admin00001',  0, 0, 'note');

CREATE TABLE tasks (
    id                   INT                 AUTO_INCREMENT,
    name                 VARCHAR(1000)       NOT NULL,
    description          VARCHAR(1000)       NOT NULL,
    memberof             INT                 NOT NULL,
    start                VARCHAR(30)         NOT NULL,
    end                  VARCHAR(30)         NOT NULL,
    time                 INT                 NOT NULL,
    createddate          VARCHAR(30)         NOT NULL,
    completeddate        VARCHAR(30)         NOT NULL,
    updateddate          VARCHAR(30)         ,
    completedstate       FLOAT               NOT NULL,
    state                CHAR(10)            NOT NULL,
    note                 VARCHAR(1000)       ,

    FOREIGN KEY (memberof) REFERENCES projects(id),
    PRIMARY KEY (id)
);

INSERT INTO tasks(name, description, memberof, start, end, TIME, createddate, completeddate, updateddate, completedstate, state, note)
VALUES ('Tao poster', 'Can co noi dung ro rang', '1', '21/11/2022 12:00:00', '21/11/2022 12:00:00', 3, '21/11/2022 12:00:00', '21/11/2022 12:00:00', NULL, 0, 0, 'Poster');
INSERT INTO tasks(name, description, memberof, start, end, TIME, createddate, completeddate, updateddate, completedstate, state, note)
VALUES ('Van nghe', 'Can co noi dung ro rang', '1', '21/11/2022 12:00:00', '21/11/2022 12:00:00', 3, '21/11/2022 12:00:00', '21/11/2022 12:00:00', NULL, 0, 0, 'Van nghe');

CREATE TABLE projectassigned (
    id                   INT                 AUTO_INCREMENT,
    project              INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (id, project, user)
);

INSERT INTO projectassigned(project, user) VALUES (1, 'B1910676');
INSERT INTO projectassigned(project, user) VALUES (2, 'B1910676');
INSERT INTO projectassigned(project, user) VALUES (1, 'C1910676');

CREATE TABLE taskassigned (
    id                   INT                 AUTO_INCREMENT,
    task                 INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (task) REFERENCES tasks(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (id, task, user)
);

INSERT INTO taskassigned(task, user) VALUES (1, 'B1910676');
INSERT INTO taskassigned(task, user) VALUES (2, 'C1910676');

CREATE TABLE projectreport (
    id                   INT                 AUTO_INCREMENT,
    project              INT                 NOT NULL,
    file                 VARCHAR(255)        NOT NULL,
    uploadeddate         VARCHAR(30)         NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    PRIMARY KEY (id)
);

-- INSERT INTO projectreport(project, file, uploadeddate) VALUES (1, LOAD_FILE('D:\a.jpg'), '21/11/2022 12:00:00');

CREATE TABLE taskreport (
    id                   INT                 AUTO_INCREMENT,
    task                 INT                 NOT NULL,
    file                 VARCHAR(255)        NOT NULL,
    uploadeddate         VARCHAR(30)         NOT NULL,

    FOREIGN KEY (task) REFERENCES taskassigned(id),
    PRIMARY KEY (id)
);

-- INSERT INTO taskreport(task, file, uploadeddate) VALUES (1, LOAD_FILE('D:\a.jpg'), '21/11/2022 12:00:00');

CREATE TABLE projectcomment (
    id                   INT                 AUTO_INCREMENT,
    project              INT                 NOT NULL,
    comment              VARCHAR(1000)       NOT NULL,
    who                  CHAR(10)            NOT NULL,
    time                 VARCHAR(30)         NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    FOREIGN KEY (who) REFERENCES accounts(username),
    PRIMARY KEY (id)
);

INSERT INTO projectcomment(project, comment, who, time) VALUES (1, 'Hello', 'B1910676', '21/11/2022 12:00:00');

CREATE TABLE taskcomment (
    id                   INT                 AUTO_INCREMENT,
    task                 INT                 NOT NULL,
    comment              VARCHAR(1000)       NOT NULL,
    who                  CHAR(10)            NOT NULL,
    time                 VARCHAR(30)         NOT NULL,

    FOREIGN KEY (task) REFERENCES tasks(id),
    FOREIGN KEY (who) REFERENCES accounts(username),
    PRIMARY KEY (id)
);

INSERT INTO taskcomment(task, comment, who, time) VALUES (1, 'Hello', 'B1910676', '21/11/2022 12:00:00');
