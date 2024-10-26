--Homework 06 Part 1
USE SEDCHome; 
GO

CREATE PROCEDURE CreateGrade
    @StudentID INT,     
    @TeacherID INT,     
    @Grade INT           
AS
BEGIN
    SET NOCOUNT ON;  

   
    INSERT INTO Grades (StudentID, TeacherID, Grade, CreatedDate)
    VALUES (@StudentID, @TeacherID, @Grade, GETDATE());

 
    SELECT COUNT(*) AS TotalGrades
    FROM Grades
    WHERE StudentID = @StudentID;

    
    SELECT MAX(Grade) AS MaxGrade
    FROM Grades
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;


END
GO

--EXEC CreateGrade @StudentID = 1, @TeacherID = 2, @Grade = 85;
