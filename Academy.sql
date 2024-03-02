create database Academy;

use Academy;

create table Curators(
	id int primary key auto_increment not null, 
	NameCur nvarchar(50) not null,
	Surname nvarchar(50) not null
);

create table Subjects(
	id int primary key auto_increment not null,
	NameSub nvarchar(50) not null unique
);

create table Teachers(
	id int primary key auto_increment not null,
	NameT nvarchar(50),
	Surname nvarchar(50) not null,
	Salary decimal(15,2) not null check(Salary > 0),
	IsProfessor bit not null default 0 
);

create table Student(
	id int primary key auto_increment not null,
	NameStud nvarchar(50) not null,
	Surname nvarchar(50) not null,
	Rating int not null check (Rating >=0 and Rating <=5)
);

create table Faculties(
	Id int primary key auto_increment not null, 
	Financing decimal(15,2) not null check (Financing != 0) default 0,
	NameF nvarchar(100) not null unique
);

create table Departments(
	id int primary key auto_increment not null, 
	Financing decimal(15,2) not null check (Financing != 0) default 0,
	NameF nvarchar(50) not null unique,
	FalcultyId int not null,
	foreign key (FalcultyId) references Faculties(id)
);

create table Groups1(
	id int primary key auto_increment not null, 
	NameG nvarchar(10) not null unique,
	Years int not null check (Years >=1 and Years <=5),
	DepartmentId int not null,
	foreign key (DepartmentId) references Departments(id)
);

create table GroupsCurators(
	id int primary key auto_increment not null,
	CuratorId int not null,
	GroupId int not null,
	foreign key (CuratorId) references Curators(id),
	foreign key (GroupId) references Groups1(id)
);

create table GroupLectures(
	id int primary key auto_increment not null,
	GroupId int not null,
	LectureId int not null,
	foreign key (GroupId) references Groups1(id),
	foreign key (LectureId) references Lectures(id)
);

CREATE TABLE Lectures (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    LectureRoom NVARCHAR(50) NOT NULL,
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,
    FOREIGN KEY (SubjectId) REFERENCES Subjects(id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(id)
);