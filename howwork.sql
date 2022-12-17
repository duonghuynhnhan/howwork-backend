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
VALUES ('Tết Dương Lịch 2023', 'Tết Dương Lịch 2023', '23/12/2022 00:00:00', '03/01/2023 23:59:59', 120, '22/12/2022 00:00:00', null, null, 'admin1', 0, 'Tết Dương Lịch 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Tết Nguyên Đán 2023', 'Tết Nguyên Đán 2023', '07/01/2023 00:00:00', '30/01/2023 23:59:59', 899, '06/01/2023  00:00:00', null, null, 'admin2', 0, 'Tết Nguyên Đán 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Tuyển sinh 2023', 'Tuyển sinh 2023', '12/03/2023 00:00:00', '12/10/2023 23:59:59', 800, '11/03/2023 00:00:00', null, null, 'admin3', 0, 'Tuyển sinh 2023');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Ngày hội việc làm 2022', 'Ngày hội việc làm 2022', '01/12/2022 00:00:00', '12/12/2022 23:59:59', 48, '30/11/2022 00:00:00', null, null, 'admin', 0, 'Ngày hội việc làm 2022');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Trao đổi sinh viên 2022', 'Trao đổi sinh viên 2022', '04/10/2022 00:00:00', '12/12/2022 23:59:59', 240, '03/10/2022 00:00:00', null, null, 'admin3', 0, 'Trao đổi sinh viên 2022');

INSERT INTO projects(name, description, start, end, time, createddate, completeddate, updateddate, leader, completedstate, note) 
VALUES ('Hội động luận văn 2022', 'Hội động luận văn 2022', '01/12/2022 00:00:00', '20/12/2022 23:59:59', 94, '30/11/2021 00:00:00', null, null, 'admin2', 0, 'Hội động luận văn 2022');


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
VALUES ('Phân công lịch trực Tết', 'Phân công lịch trực Tết', '24/12/2022 00:00:00', '26/12/2022 23:59:59', 8, '23/12/2022 00:00:00', null, null, 1, 0, 'Phân công lịch trực Tết');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Vệ sinh văn phòng', 'Vệ sinh văn phòng', '27/12/2022 00:00:00', '30/12/2022 23:59:59', 20, '26/12/2022 00:00:00', null, null, 1, 0, 'Vệ sinh văn phòng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Vệ sinh khuôn viên', 'Vệ sinh khuôn viên', '27/12/2022 00:00:00', '31/12/2022 23:59:59', 24, '26/12/2022 00:00:00', null, null, 1, 0, 'Vệ sinh khuôn viên');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Trực Tết', 'Trực Tết', '31/12/2022 00:00:00', '03/01/2023 23:59:59', 60, '30/12/2022 00:00:00', null, null, 1, 0, 'Trực Tết');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Kiểm tra tình hình thực tế', 'Kiểm tra tình hình thực tế', '24/12/2022 00:00:00', '03/01/2023 23:59:59', 8, '23/12/2022 00:00:00', null, null, 1, 0, 'Kiểm tra tình hình thực tế');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Phân công lịch trực Tết', 'Phân công lịch trực Tết', '08/01/2023 00:00:00', '10/01/2023 23:59:59', 8, '07/01/2022 00:00:00', null, null, 2, 0, 'Phân công lịch trực Tết');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Vệ sinh văn phòng', 'Vệ sinh văn phòng', '11/01/2023 00:00:00', '12/01/2023 23:59:59', 16, '10/01/2023 00:00:00', null, null, 2, 0, 'Vệ sinh văn phòng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Vệ sinh khuôn viên', 'Vệ sinh khuôn viên', '11/01/2023 00:00:00', '15/01/2023 23:59:59', 50, '10/01/2023 00:00:00', null, null, 2, 0, 'Vệ sinh khuôn viên');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Trực Tết', 'Trực Tết', '15/01/2023 00:00:00', '29/01/2023  23:59:59', 800, '14/01/2023 00:00:00', null, null, 2, 0, 'Trực Tết');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Kiểm tra tình hình thực tế', 'Kiểm tra tình hình thực tế', '08/01/2023 00:00:00', '30/01/2023 23:59:59', 25, '07/01/2023 00:00:00', null, null, 2, 0, 'Kiểm tra tình hình thực tế');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Lập kế hoạch tuyển sinh', 'Lập kế hoạch tuyển sinh', '13/03/2023 00:00:00', '28/03/2022 23:59:59', 50, '12/03/2023 00:00:00', null, null, 3, 0, 'Lập kế hoạch tuyển sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tạo poster', 'Tạo poster', '29/03/2023 00:00:00', '10/04/2023 23:59:59', 20, '28/03/2023 00:00:00', null, null, 3, 0, 'Tạo poster');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('In thông tin tuyển sinh', 'In thông tin tuyển sinh', '30/03/2023 00:00:00', '05/04/2023 23:59:59', 10, '29/03/2023 00:00:00', null, null, 3, 0, 'In thông tin tuyển sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Chương trình tuyển sinh', 'Chương trình tuyển sinh', '07/04/2023 00:00:00', '10/10/2023 23:59:59', 500, '06/04/2023 00:00:00', null, null, 3, 0, 'Chương trình tuyển sinh');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tổng hợp dữ liệu', 'Tổng hợp dữ liệu', '16/03/2023 00:00:00', '11/10/2023 23:59:59', 220, '15/03/2023 00:00:00', null, null, 3, 0, 'Tổng hợp dữ liệu');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Lập kế hoạch tổ chức', 'Lập kế hoạch tổ chức', '01/12/2022 00:00:00', '03/12/2022 23:59:59', 8, '30/11/2022 00:00:00', null, null, 4, 0, 'Lập kế hoạch tổ chức');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('In thông tin', 'In thông tin', '04/12/2022 00:00:00', '05/12/2022 23:59:59', 4, '03/12/2022 00:00:00', null, null, 4, 0, 'In thông tin');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Mời công ty', 'Mời công ty', '04/12/2022 00:00:00', '09/12/2022 23:59:59', 16, '03/12/2022 00:00:00', null, null, 4, 0, 'Mời công ty');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tổ chức sự kiện', 'Tổ chức sự kiện', '10/12/2022 00:00:00', '10/12/2022 23:59:59', 10, '09/12/2022 00:00:00', null, null, 4, 0, 'Tổ chức sự kiện');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Dọn dẹp sau sự kiện', 'Dọn dẹp sau sự kiện', '11/12/2022 00:00:00', '11/12/2022 23:59:59', 10, '10/12/2022 00:00:00', null, null, 4, 0, 'Dọn dẹp sau sự kiện');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Lên kế hoạch chuyến đi', 'Lên kế hoạch chuyến đi', '05/10/2022 00:00:00', '05/11/2022 23:59:59', 60, '04/10/2022 00:00:00', null, null, 5, 0, 'Lên kế hoạch chuyến đi');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Chuẩn bị cho chuyến đi', 'Chuẩn bị cho chuyến đi', '06/11/2022 00:00:00', '03/12/2022 23:59:59', 120, '05/11/2022 00:00:00', null, null, 5, 0, 'Chuẩn bị cho chuyến đi');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Workshop tại Malaysia', 'Workshop tại Malaysia', '04/12/2022 00:00:00', '06/12/2022 23:59:59', 24, '03/12/2022 00:00:00', null, null, 5, 0, 'Workshop tại Malaysia');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Du lịch tại Malaysia', 'Du lịch tại Malaysia', '07/12/2022 00:00:00', '10/12/2022 23:59:59', 30, '06/12/2022 00:00:00', null, null, 5, 0, 'Du lịch tại Malaysia');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Viết thu hoạch chuyến đi', 'Viết thu hoạch chuyến đi', '11/12/2022 00:00:00', '12/12/2022 23:59:59', 6, '10/12/2022 00:00:00', null, null, 5, 0, 'Viết thu hoạch chuyến đi');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Phân công hội đồng', 'Phân công hội đồng', '01/12/2022 00:00:00', '04/12/2022 23:59:59', 10, '30/11/2022 00:00:00', null, null, 6, 0, 'Phân công hội đồng');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Chuẩn bị cơ sở vật chất', 'Chuẩn bị cơ sở vật chất', '03/12/2022 00:00:00', '10/12/2022 23:59:59', 20, '02/12/2022 00:00:00', null, null, 6, 0, 'Chuẩn bị cơ sở vật chất');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tiến hành thẩm định luận văn', 'Tiến hành thẩm định luận văn', '12/12/2022 00:00:00', '17/12/2022 23:59:59', 30, '11/12/2022 00:00:00', null, null, 6, 0, 'Tiến hành thẩm định luận văn');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Ghi chép quá trình thực hiện', 'Ghi chép quá trình thực hiện', '12/12/2022 00:00:00', '17/12/2022 23:59:59', 30, '11/12/2022 00:00:00', null, null, 6, 0, 'Ghi chép quá trình thực hiện');

INSERT INTO tasks(name, description, start, end, time, createddate, completeddate, updateddate, memberof, completedstate, note) 
VALUES ('Tổng kết', 'Tổng kết', '18/12/2022 00:00:00', '19/12/2022 23:59:59', 4, '17/12/2022 00:00:00', null, null, 6, 0, 'Tổng kết');

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
