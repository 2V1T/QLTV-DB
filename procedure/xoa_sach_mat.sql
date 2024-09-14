CREATE PROCEDURE xoa_sach_mat @id INT
AS
BEGIN
    DELETE FROM copies WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO