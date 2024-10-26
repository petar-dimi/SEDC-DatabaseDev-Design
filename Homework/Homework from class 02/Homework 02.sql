
CREATE DATABASE SEDCACADEMYDB;
GO


USE SEDCACADEMYDB;
GO


CREATE TABLE Students (
    StudentID INT,
    FirstName NVARCHAR(50) ,
    LastName NVARCHAR(50) ,
    DateOfBirth DATE,
    Email NVARCHAR(100)
);
GO


CREATE TABLE Teachers (
    TeacherID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50) ,
    Subject NVARCHAR(100),
    Email NVARCHAR(100)
);
GO


CREATE TABLE Grades (
    GradeID INT,
    GradeValue CHAR(2),
    GradeDescription NVARCHAR(100)
);
GO


CREATE TABLE Courses (
    CourseID INT,
    CourseName NVARCHAR(100),
    Description NVARCHAR(255),
    TeacherID INT
);
GO


CREATE TABLE AchievementTypes (
    AchievementTypeID INT,
    AchievementName NVARCHAR(100),
    Description NVARCHAR(255)
);
GO


CREATE TABLE GradeDetails (
    GradeDetailID INT,
    StudentID INT,
    CourseID INT,
    GradeID INT,
    DateAwarded DATE
);
GO
