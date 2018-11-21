CREATE PROC CourseViewById
@CourseNo int
AS
      BEGIN
	  SELECT *
	  FROM Course
	  WHERE CourseNo=@CourseNo
      END
