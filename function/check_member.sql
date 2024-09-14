CREATE FUNCTION check_member(@id_no INT) RETURNS BIT
AS
BEGIN
    DECLARE @tra BIT
    SET @tra = 0
    IF (SELECT COUNT([return]) FROM Member INNER JOIN BorrowedDetails ON Member.id = BorrowedDetails.member_id WHERE Member.id_no = @id_no) > 0
        SET @tra = 1
    RETURN @tra
END
GO