USE SEDCHome; 
GO

CREATE PROCEDURE CreateGradeDetail
    @GradeID INT,              
    @AchievementTypeID INT,    
    @AchievementPoints INT,     
    @AchievementMaxPoints INT,   
    @AchievementDate DATE        
AS
BEGIN
    SET NOCOUNT ON; 

    
    INSERT INTO GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

    
    SELECT SUM((gd.AchievementPoints * 1.0 / gd.AchievementMaxPoints) * at.ParticipationRate) AS TotalGradePoints
    FROM GradeDetails gd
    JOIN AchievementTypes at ON gd.AchievementTypeID = at.ID  
    WHERE gd.GradeID = @GradeID;
END
GO