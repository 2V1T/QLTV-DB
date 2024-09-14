CREATE PROCEDURE them_copies(@book_id INT, @copies INT)
AS
BEGIN
    DECLARE @result NVARCHAR(255)
    IF EXISTS (SELECT TOP 1 * FROM vwBook WHERE id = @book_id)
    BEGIN
        DECLARE @i INT
        SET @i = 1
        WHILE @i <= @copies
        BEGIN
            INSERT INTO Copies (book_id, available) VALUES (@book_id, 1)
            SET @i = @i + 1
        END
        SET @result = N'Thêm sách thành công'
    END
    ELSE
    BEGIN
        SET @result = N'Sách không tồn tại'
    END
    SELECT result = @result
END
GO