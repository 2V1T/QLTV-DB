CREATE PROCEDURE muon_sach (@id_no BIGINT, @book_id INT, @return_date DATE)
AS
BEGIN
    DECLARE @result NVARCHAR(255)
    IF EXISTS (SELECT TOP 1 * FROM vwCopies WHERE book_id = @book_id AND available = 1)
    BEGIN
        IF EXISTS (SELECT TOP 1 id FROM vwMember WHERE id_no = @id_no)
        BEGIN
            DECLARE @member_id INT
            SET @member_id = (SELECT TOP 1 id FROM vwMember WHERE id_no = @id_no)
            DECLARE @copies_id INT
            SET @copies_id = (SELECT TOP 1 id FROM vwCopies WHERE book_id = @book_id AND available = 1)
            INSERT INTO BorrowedDetails (member_id, copies_id, return_date) VALUES (@member_id, @copies_id, @return_date)
            UPDATE Copies SET available = 0 WHERE id = @copies_id 
            SET @result = @copies_id
        END
        ELSE
        BEGIN
            SET @result = N'Thành viên không tồn tại'
        END
    END
    ELSE
    BEGIN
        SET @result = N'Sách không tồn tại hoặc đã hết sách'
    END
    SELECT result = @result
END
GO