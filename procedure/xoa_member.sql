CREATE PROCEDURE xoa_member @id INT
AS
BEGIN
    DELETE FROM Member WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO