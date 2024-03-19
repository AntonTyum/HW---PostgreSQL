CREATE TABLE ИСполнители(
    ID_исполнителя INT PRIMARY KEY AUTO_INCREMENT,
    Название_исполнителя VARCHAR(255)
);

CREATE TABLE Жанры (
    ID_жанры INT PRIMARY KEY AUTO_INCREMENT,
    Название_жанра VARCHAR(255),
    UNIQUE (Название_жанра)
);

CREATE TABLE Альбомы (
    ID_Альбома INT PRIMARY KEY AUTO_INCREMENT,
    Название_альбома VARCHAR(255),
    Год_выпуска INT,
    CHECK (Год_выпуска >= 1900)
);

CREATE TABLE Треки(
    ID_трека INT PRIMARY KEY AUTO_INCREMENT,
    Название_трека VARCHAR(255),
    ID_альбома INT,
    Длительность INT,
    FOREIGN KEY (ID_альбома) REFERENCES Альбомы (ID_альбома)
);

CREATE TABLE Сборники(
    ID_сборника INT PRIMARY KEY AUTO_INCREMENT,
    Название_сборника VARCHAR(255),
    год_выпуска INT,
    CHECK (год_выпуска >= 1900)
);

CREATE TABLE Треки в сборниках (
    ID_сборника INT,
    ID_трека INT,
    №_трека_в_сборнике INT,
    FOREIGN KEY ( ID_сборника) REFERENCES Сборники( ID_сборника),
    FOREIGN KEY (ID_трека) REFERENCES Треки(ID_трека),
    PRIMARY KEY (ID_сборника, ID_трека)
);

CREATE TABLE Жанры исполнителей (
    ID_исполнителя INT,
    ID_жанра INT,
    FOREIGN KEY (ID_исполнителя) REFERENCES Исполнители(ID_исполнителя),
    FOREIGN KEY (ID_жанра) REFERENCES Жанры(ID_жанра),
    PRIMARY KEY (ID_исполнителя, ID_жанра)
);

CREATE TABLE Альбом исполнителя (
    ID_альбома INT,
    ID_исполнителя INT,
    FOREIGN KEY (ID_альбома) REFERENCES Альбомы (ID_альбома),
    FOREIGN KEY (ID_исполнителя) REFERENCES ИСполнители(ID_исполнителя),
    PRIMARY KEY (ID_альбома, ID_исполнителя)
);
