CREATE PROCEDURE them_sach @name NVARCHAR(MAX), @author NVARCHAR(120), @category NVARCHAR(100), @description NTEXT, @book_image VARBINARY(MAX), @quantity INT
AS
BEGIN
    DECLARE @result NVARCHAR(255)
    IF NOT EXISTS (SELECT * FROM vwAuthor WHERE name = @author)
        INSERT INTO Author (name) VALUES (@author)
    IF NOT EXISTS (SELECT * FROM vwCategory WHERE name = @category)
        INSERT INTO Category (name) VALUES (@category)
    DECLARE @author_id INT
    SET @author_id = (SELECT id FROM vwAuthor WHERE name = @author)
    DECLARE @category_id INT
    SET @category_id = (SELECT id FROM vwCategory WHERE name = @category)
    IF NOT EXISTS (SELECT * FROM Book WHERE name = @name AND author_id = @author_id)
        INSERT INTO Book (name, author_id, category_id, description, book_img) VALUES (@name, @author_id, @category_id, @description, @book_image)
    DECLARE @book_id INT
    SET @book_id = (SELECT id FROM Book WHERE name = @name AND author_id = @author_id)
    DECLARE @i INT
    SET @i = 1
    WHILE @i <= @quantity
    BEGIN
        INSERT INTO Copies (book_id, available) VALUES (@book_id, 1)
        SET @i = @i + 1
    END
    SET @result = N'Thêm sách thành công'
    SELECT result = @result
END
GO