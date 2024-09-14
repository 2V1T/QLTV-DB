CREATE PROC xoa_sach @id INT
AS
BEGIN
    DELETE FROM Book WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO