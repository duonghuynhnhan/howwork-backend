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

INSERT INTO persons VALUES('093201008345', 'Administrator', '22/05/1978', 'Male', 'admin@outlook.com', '0384438517', 'Dean', 'College of Information Communication & Technology');

CREATE TABLE accounts (
    username             CHAR(10)            NOT NULL,
    password             VARCHAR(255)        NOT NULL,
    keypass              VARCHAR(255)        NOT NULL,
    role                 CHAR(5)             NOT NULL,
    person               CHAR(12)            NOT NULL,

    FOREIGN KEY (person) REFERENCES persons(id),
    PRIMARY KEY (username)
);

INSERT INTO accounts VALUES('admin', SHA2('admin', 512), SHA2('admin', 256), 'admin', '093201008345');

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

CREATE TABLE projectassigned (
    project              INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (project) REFERENCES projects(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (project, user)
);

CREATE TABLE taskassigned (
    task                 INT                 NOT NULL,
    user                 CHAR(8)             NOT NULL,

    FOREIGN KEY (task) REFERENCES tasks(id),
    FOREIGN KEY (user) REFERENCES accounts(username),
    PRIMARY KEY (task, user)
);

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
