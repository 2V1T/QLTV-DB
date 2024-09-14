CREATE PROC tra_sach @id INT
AS
BEGIN
    UPDATE BorrowedDetails SET [return] = 1 WHERE copies_id = @id;
    UPDATE Copies SET available = 1 WHERE id = @id;
    DECLARE @result NVARCHAR(MAX);
    SET @result = (SELECT CONCAT(N'Trả sách ', (SELECT name FROM vwBook WHERE id = (SELECT book_id FROM Copies WHERE id = @id)), ' thành công!'));
    SELECT result = @result;
END
GO