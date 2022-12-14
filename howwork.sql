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

INSERT INTO persons VALUES('admin', 'Administrator', '22/05/1978', 'Male', 'admin@cit.ctu.edu.vn', '0384438517', 'Director', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('admin1', 'Administrator 1', '23/06/1979', 'Female', 'admin1@cit.ctu.edu.vn', '0384438518', 'Assistant Director', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('admin2', 'Administrator 2', '24/07/1980', 'Male', 'admin2@cit.ctu.edu.vn', '0384438519', 'Assistant Director', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('admin3', 'Administrator 3', '25/08/1981', 'Female', 'admin3@cit.ctu.edu.vn', '0384438520', 'Assistant Director', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('001234', 'Nguyen Van A', '25/09/1980', 'Male', '001234@ctu.edu.vn', '0384438520', 'Lecturer', 'Faculty of Information Technology');
INSERT INTO persons VALUES('001235', 'Tran Thi B', '26/10/1981', 'Female', '001235@ctu.edu.vn', '0384438521', 'Lecturer', 'Faculty of Information System');
INSERT INTO persons VALUES('001236', 'Le Van C', '27/11/1982', 'Male', '001236@ctu.edu.vn', '0384438522', 'Lecturer', 'Faculty of Computer Science');
INSERT INTO persons VALUES('001237', 'Do Thi D', '28/12/1983', 'Female', '001237@ctu.edu.vn', '0384438523', 'Lecturer', 'Faculty of Software Technology');
INSERT INTO persons VALUES('001238', 'Cao Van E', '29/01/1984', 'Male', '001238@ctu.edu.vn', '0384438524', 'Lecturer', 'Faculty of Computer Networking and Communication');
INSERT INTO persons VALUES('001239', 'Bui Thi F', '01/02/1985', 'Female', '001239@ctu.edu.vn', '0384438525', 'Lecturer', 'Faculty of Multimedia Communication');
INSERT INTO persons VALUES('001240', 'Dang Van G', '31/03/1986', 'Male', '001240@ctu.edu.vn', '0384438526', 'Lecturer', 'Electronic and Informatics Center');
INSERT INTO persons VALUES('001241', 'Tu Thi H', '02/04/1987', 'Female', '001241@ctu.edu.vn', '0384438527', 'Lecturer', 'Office of College of Information Communication & Technology');
INSERT INTO persons VALUES('001242', 'Pham Van I', '03/05/1988', 'Male', '001242@ctu.edu.vn', '0384438528', 'Lecturer', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('B1910676', 'Duong Van J', '26/04/2001', 'Male', 'B1910676@student.ctu.edu.vn', '0354984001', 'Student', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('B1900349', 'Le Thi K', '31/03/2001', 'Female', 'B1900349@student.ctu.edu.vn', '0354984002', 'Student', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('B1910658', 'Huynh Van L', '13/1/2001', 'Male', 'B1910658@student.ctu.edu.vn', '0354984003', 'Student', 'College of Information Communication & Technology');
INSERT INTO persons VALUES('B1910631', 'Pham Van M', '29/07/2001', 'Male', 'B1910631@student.ctu.edu.vn', '0354984004', 'Student', 'College of Information Communication & Technology');

CREATE TABLE accounts (
    username             CHAR(10)            NOT NULL,
    password             VARCHAR(255)        NOT NULL,
    keypass              VARCHAR(255)        NOT NULL,
    role                 CHAR(5)             NOT NULL,
    person               CHAR(12)            NOT NULL,

    FOREIGN KEY (person) REFERENCES persons(id),
    PRIMARY KEY (username)
);

INSERT INTO accounts VALUES('admin', SHA2('admin', 512), SHA2('admin', 256), 'admin', 'admin');
INSERT INTO accounts VALUES('admin1', SHA2('admin1', 512), SHA2('admin1', 256), 'admin', 'admin1');
INSERT INTO accounts VALUES('admin2', SHA2('admin2', 512), SHA2('admin2', 256), 'admin', 'admin2');
INSERT INTO accounts VALUES('admin3', SHA2('admin3', 512), SHA2('admin3', 256), 'admin', 'admin3');
INSERT INTO accounts VALUES('001234', SHA2('001234', 512), SHA2('001234', 256), 'user', '001234');
INSERT INTO accounts VALUES('001235', SHA2('001235', 512), SHA2('001235', 256), 'user', '001235');
INSERT INTO accounts VALUES('001236', SHA2('001236', 512), SHA2('001236', 256), 'user', '001236');
INSERT INTO accounts VALUES('001237', SHA2('001237', 512), SHA2('001237', 256), 'user', '001237');
INSERT INTO accounts VALUES('001238', SHA2('001238', 512), SHA2('001238', 256), 'user', '001238');
INSERT INTO accounts VALUES('001239', SHA2('001239', 512), SHA2('001239', 256), 'user', '001239');
INSERT INTO accounts VALUES('001240', SHA2('001240', 512), SHA2('001240', 256), 'user', '001240');
INSERT INTO accounts VALUES('001241', SHA2('001241', 512), SHA2('001241', 256), 'user', '001241');
INSERT INTO accounts VALUES('001242', SHA2('001242', 512), SHA2('001242', 256), 'user', '001242');
INSERT INTO accounts VALUES('B1910676', SHA2('B1910676', 512), SHA2('B1910676', 256), 'user', 'B1910676');
INSERT INTO accounts VALUES('B1900349', SHA2('B1900349', 512), SHA2('B1900349', 256), 'user', 'B1900349');
INSERT INTO accounts VALUES('B1910658', SHA2('B1910658', 512), SHA2('B1910658', 256), 'user', 'B1910658');
INSERT INTO accounts VALUES('B1910631', SHA2('B1910631', 512), SHA2('B1910631', 256), 'user', 'B1910631');

CREATE TABLE projects (
    id                   INT                 AUTO_INCREMENT,
    name                 VARCHAR(1000)       NOT NULL,
    description          VARCHAR(1000)       NOT NULL,
    start                VARCHAR(30)         NOT NULL,
    end                  VARCHAR(30)         NOT NULL,
    time                 INT                 NOT NULL,
    createddate          VARCHAR(30)         NOT NULL,
    completeddate        VARCHAR(30)         ,
    updateddate          VARCHAR(30)         ,
    leader               CHAR(10)            NOT NULL,
    completedstate       FLOAT               NOT NULL,
    note                 VARCHAR(1000)       ,

    FOREIGN KEY (leader) REFERENCES accounts(username),
    PRIMARY KEY (id)
);

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('T???t D????ng L???ch 2023', 'T???t D????ng L???ch 2023', '23/12/2022 00:00:00', '03/01/2023 23:59:59', 120, '22/12/2022 00:00:00', null, null, 'admin1', 0, 'T???t D????ng L???ch 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('T???t Nguy??n ????n 2023', 'T???t Nguy??n ????n 2023', '07/01/2023 00:00:00', '30/01/2023 23:59:59', 899, '06/01/2023  00:00:00', null, null, 'admin2', 0, 'T???t Nguy??n ????n 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Tuy???n sinh 2023', 'Tuy???n sinh 2023', '12/03/2023 00:00:00', '12/10/2023 23:59:59', 800, '11/03/2023 00:00:00', null, null, 'admin3', 0, 'Tuy???n sinh 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Ng??y h???i vi???c l??m 2022', 'Ng??y h???i vi???c l??m 2022', '01/12/2022 00:00:00', '12/12/2022 23:59:59', 48, '30/11/2022 00:00:00', null, null, 'admin', 0, 'Ng??y h???i vi???c l??m 2022');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Trao ?????i sinh vi??n 2022', 'Trao ?????i sinh vi??n 2022', '04/10/2022 00:00:00', '12/12/2022 23:59:59', 240, '03/10/2022 00:00:00', null, null, 'admin3', 0, 'Trao ?????i sinh vi??n 2022');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('H???i ?????ng lu???n v??n 2022', 'H???i ?????ng lu???n v??n 2022', '01/12/2022 00:00:00', '20/12/2022 23:59:59', 94, '30/11/2021 00:00:00', null, null, 'admin2', 0, 'H???i ?????ng lu???n v??n 2022');


CREATE TABLE tasks (
    id                   INT                 AUTO_INCREMENT,
    name                 VARCHAR(1000)       NOT NULL,
    description          VARCHAR(1000)       NOT NULL,
    memberof             INT                 NOT NULL,
    start                VARCHAR(30)         NOT NULL,
    end                  VARCHAR(30)         NOT NULL,
    time                 INT                 NOT NULL,
    createddate          VARCHAR(30)         NOT NULL,
    completeddate        VARCHAR(30)         ,
    updateddate          VARCHAR(30)         ,
    completedstate       FLOAT               NOT NULL,
    note                 VARCHAR(1000)       ,

    FOREIGN KEY (memberof) REFERENCES projects(id),
    PRIMARY KEY (id)
);

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ph??n c??ng l???ch tr???c T???t', 'Ph??n c??ng l???ch tr???c T???t', '24/12/2022 00:00:00', '26/12/2022 23:59:59', 8, '23/12/2022 00:00:00', null, null, 1, 0, 'Ph??n c??ng l???ch tr???c T???t');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('V??? sinh v??n ph??ng', 'V??? sinh v??n ph??ng', '27/12/2022 00:00:00', '30/12/2022 23:59:59', 20, '26/12/2022 00:00:00', null, null, 1, 0, 'V??? sinh v??n ph??ng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('V??? sinh khu??n vi??n', 'V??? sinh khu??n vi??n', '27/12/2022 00:00:00', '31/12/2022 23:59:59', 24, '26/12/2022 00:00:00', null, null, 1, 0, 'V??? sinh khu??n vi??n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tr???c T???t', 'Tr???c T???t', '31/12/2022 00:00:00', '03/01/2023 23:59:59', 60, '30/12/2022 00:00:00', null, null, 1, 0, 'Tr???c T???t');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ki???m tra t??nh h??nh th???c t???', 'Ki???m tra t??nh h??nh th???c t???', '24/12/2022 00:00:00', '03/01/2023 23:59:59', 8, '23/12/2022 00:00:00', null, null, 1, 0, 'Ki???m tra t??nh h??nh th???c t???');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ph??n c??ng l???ch tr???c T???t', 'Ph??n c??ng l???ch tr???c T???t', '08/01/2023 00:00:00', '10/01/2023 23:59:59', 8, '07/01/2022 00:00:00', null, null, 2, 0, 'Ph??n c??ng l???ch tr???c T???t');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('V??? sinh v??n ph??ng', 'V??? sinh v??n ph??ng', '11/01/2023 00:00:00', '12/01/2023 23:59:59', 16, '10/01/2023 00:00:00', null, null, 2, 0, 'V??? sinh v??n ph??ng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('V??? sinh khu??n vi??n', 'V??? sinh khu??n vi??n', '11/01/2023 00:00:00', '15/01/2023 23:59:59', 50, '10/01/2023 00:00:00', null, null, 2, 0, 'V??? sinh khu??n vi??n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tr???c T???t', 'Tr???c T???t', '15/01/2023 00:00:00', '29/01/2023  23:59:59', 800, '14/01/2023 00:00:00', null, null, 2, 0, 'Tr???c T???t');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ki???m tra t??nh h??nh th???c t???', 'Ki???m tra t??nh h??nh th???c t???', '08/01/2023 00:00:00', '30/01/2023 23:59:59', 25, '07/01/2023 00:00:00', null, null, 2, 0, 'Ki???m tra t??nh h??nh th???c t???');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('L???p k??? ho???ch tuy???n sinh', 'L???p k??? ho???ch tuy???n sinh', '13/03/2023 00:00:00', '28/03/2022 23:59:59', 50, '12/03/2023 00:00:00', null, null, 3, 0, 'L???p k??? ho???ch tuy???n sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('T???o poster', 'T???o poster', '29/03/2023 00:00:00', '10/04/2023 23:59:59', 20, '28/03/2023 00:00:00', null, null, 3, 0, 'T???o poster');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('In th??ng tin tuy???n sinh', 'In th??ng tin tuy???n sinh', '30/03/2023 00:00:00', '05/04/2023 23:59:59', 10, '29/03/2023 00:00:00', null, null, 3, 0, 'In th??ng tin tuy???n sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ch????ng tr??nh tuy???n sinh', 'Ch????ng tr??nh tuy???n sinh', '07/04/2023 00:00:00', '10/10/2023 23:59:59', 500, '06/04/2023 00:00:00', null, null, 3, 0, 'Ch????ng tr??nh tuy???n sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('T???ng h???p d??? li???u', 'T???ng h???p d??? li???u', '16/03/2023 00:00:00', '11/10/2023 23:59:59', 220, '15/03/2023 00:00:00', null, null, 3, 0, 'T???ng h???p d??? li???u');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('L???p k??? ho???ch t??? ch???c', 'L???p k??? ho???ch t??? ch???c', '01/12/2022 00:00:00', '03/12/2022 23:59:59', 8, '30/11/2022 00:00:00', null, null, 4, 0, 'L???p k??? ho???ch t??? ch???c');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('In th??ng tin', 'In th??ng tin', '04/12/2022 00:00:00', '05/12/2022 23:59:59', 4, '03/12/2022 00:00:00', null, null, 4, 0, 'In th??ng tin');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('M???i c??ng ty', 'M???i c??ng ty', '04/12/2022 00:00:00', '09/12/2022 23:59:59', 16, '03/12/2022 00:00:00', null, null, 4, 0, 'M???i c??ng ty');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('T??? ch???c s??? ki???n', 'T??? ch???c s??? ki???n', '10/12/2022 00:00:00', '10/12/2022 23:59:59', 10, '09/12/2022 00:00:00', null, null, 4, 0, 'T??? ch???c s??? ki???n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('D???n d???p sau s??? ki???n', 'D???n d???p sau s??? ki???n', '11/12/2022 00:00:00', '11/12/2022 23:59:59', 10, '10/12/2022 00:00:00', null, null, 4, 0, 'D???n d???p sau s??? ki???n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('L??n k??? ho???ch chuy???n ??i', 'L??n k??? ho???ch chuy???n ??i', '05/10/2022 00:00:00', '05/11/2022 23:59:59', 60, '04/10/2022 00:00:00', null, null, 5, 0, 'L??n k??? ho???ch chuy???n ??i');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Chu???n b??? cho chuy???n ??i', 'Chu???n b??? cho chuy???n ??i', '06/11/2022 00:00:00', '03/12/2022 23:59:59', 120, '05/11/2022 00:00:00', null, null, 5, 0, 'Chu???n b??? cho chuy???n ??i');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Workshop t???i Malaysia', 'Workshop t???i Malaysia', '04/12/2022 00:00:00', '06/12/2022 23:59:59', 24, '03/12/2022 00:00:00', null, null, 5, 0, 'Workshop t???i Malaysia');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Du l???ch t???i Malaysia', 'Du l???ch t???i Malaysia', '07/12/2022 00:00:00', '10/12/2022 23:59:59', 30, '06/12/2022 00:00:00', null, null, 5, 0, 'Du l???ch t???i Malaysia');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Vi???t thu ho???ch chuy???n ??i', 'Vi???t thu ho???ch chuy???n ??i', '11/12/2022 00:00:00', '12/12/2022 23:59:59', 6, '10/12/2022 00:00:00', null, null, 5, 0, 'Vi???t thu ho???ch chuy???n ??i');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ph??n c??ng h???i ?????ng', 'Ph??n c??ng h???i ?????ng', '01/12/2022 00:00:00', '04/12/2022 23:59:59', 10, '30/11/2022 00:00:00', null, null, 6, 0, 'Ph??n c??ng h???i ?????ng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Chu???n b??? c?? s??? v???t ch???t', 'Chu???n b??? c?? s??? v???t ch???t', '03/12/2022 00:00:00', '10/12/2022 23:59:59', 20, '02/12/2022 00:00:00', null, null, 6, 0, 'Chu???n b??? c?? s??? v???t ch???t');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ti???n h??nh th???m ?????nh lu???n v??n', 'Ti???n h??nh th???m ?????nh lu???n v??n', '12/12/2022 00:00:00', '17/12/2022 23:59:59', 30, '11/12/2022 00:00:00', null, null, 6, 0, 'Ti???n h??nh th???m ?????nh lu???n v??n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ghi ch??p qu?? tr??nh th???c hi???n', 'Ghi ch??p qu?? tr??nh th???c hi???n', '12/12/2022 00:00:00', '17/12/2022 23:59:59', 30, '11/12/2022 00:00:00', null, null, 6, 0, 'Ghi ch??p qu?? tr??nh th???c hi???n');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('T???ng k???t', 'T???ng k???t', '18/12/2022 00:00:00', '19/12/2022 23:59:59', 4, '17/12/2022 00:00:00', null, null, 6, 0, 'T???ng k???t');

CREATE TABLE projectassigned (
    project              INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (project, user)
);

INSERT INTO projectassigned VALUES (1, '001234');
INSERT INTO projectassigned VALUES (1, '001235');
INSERT INTO projectassigned VALUES (1, '001236');
INSERT INTO projectassigned VALUES (1, '001237');
INSERT INTO projectassigned VALUES (1, '001238');

INSERT INTO projectassigned VALUES (2, '001239');
INSERT INTO projectassigned VALUES (2, '001240');
INSERT INTO projectassigned VALUES (2, '001241');
INSERT INTO projectassigned VALUES (2, '001242');
INSERT INTO projectassigned VALUES (2, '001234');

INSERT INTO projectassigned VALUES (3, '001235');
INSERT INTO projectassigned VALUES (3, '001236');
INSERT INTO projectassigned VALUES (3, '001237');
INSERT INTO projectassigned VALUES (3, '001238');
INSERT INTO projectassigned VALUES (3, '001239');

INSERT INTO projectassigned VALUES (4, '001240');
INSERT INTO projectassigned VALUES (4, '001241');
INSERT INTO projectassigned VALUES (4, '001242');
INSERT INTO projectassigned VALUES (4, '001235');

INSERT INTO projectassigned VALUES (5, '001236');
INSERT INTO projectassigned VALUES (5, '001237');
INSERT INTO projectassigned VALUES (5, 'B1910676');
INSERT INTO projectassigned VALUES (5, 'B1900349');
INSERT INTO projectassigned VALUES (5, 'B1910658');
INSERT INTO projectassigned VALUES (5, 'B1910631');

INSERT INTO projectassigned VALUES (6, '001234');
INSERT INTO projectassigned VALUES (6, '001235');
INSERT INTO projectassigned VALUES (6, '001238');
INSERT INTO projectassigned VALUES (6, '001239');
INSERT INTO projectassigned VALUES (6, '001242');

CREATE TABLE taskassigned (
    task                 INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (task) REFERENCES tasks(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (task, user)
);

INSERT INTO taskassigned VALUES (1, '001234');
INSERT INTO taskassigned VALUES (2, '001235');
INSERT INTO taskassigned VALUES (3, '001236');
INSERT INTO taskassigned VALUES (4, '001237');
INSERT INTO taskassigned VALUES (5, '001238');
INSERT INTO taskassigned VALUES (6, '001239');
INSERT INTO taskassigned VALUES (7, '001240');
INSERT INTO taskassigned VALUES (8, '001241');
INSERT INTO taskassigned VALUES (9, '001242');
INSERT INTO taskassigned VALUES (10, '001234');
INSERT INTO taskassigned VALUES (11, '001235');
INSERT INTO taskassigned VALUES (12, '001236');
INSERT INTO taskassigned VALUES (13, '001237');
INSERT INTO taskassigned VALUES (14, '001238');
INSERT INTO taskassigned VALUES (15, '001239');
INSERT INTO taskassigned VALUES (16, '001240');
INSERT INTO taskassigned VALUES (17, '001241');
INSERT INTO taskassigned VALUES (18, '001242');
INSERT INTO taskassigned VALUES (19, '001242');
INSERT INTO taskassigned VALUES (20, '001235');
INSERT INTO taskassigned VALUES (21, '001236');
INSERT INTO taskassigned VALUES (22, '001237');
INSERT INTO taskassigned VALUES (23, 'B1910676');
INSERT INTO taskassigned VALUES (24, 'B1900349');
INSERT INTO taskassigned VALUES (25, 'B1910631');
INSERT INTO taskassigned VALUES (26, '001234');
INSERT INTO taskassigned VALUES (27, '001235');
INSERT INTO taskassigned VALUES (28, '001238');
INSERT INTO taskassigned VALUES (29, '001239');
INSERT INTO taskassigned VALUES (30, '001242');

CREATE TABLE projectreport (
    project              INT                 NOT NULL,
    file                 VARCHAR(255)        NOT NULL,
    uploadeddate         VARCHAR(30)         NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    PRIMARY KEY (project, file)
);

CREATE TABLE taskreport (
    task                 INT                 NOT NULL,
    file                 VARCHAR(255)        NOT NULL,
    uploadeddate         VARCHAR(30)         NOT NULL,

    FOREIGN KEY (task) REFERENCES tasks(id),
    PRIMARY KEY (task, file)
);

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
