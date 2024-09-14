CREATE PROC xoa_tac_gia @id INT
AS
BEGIN
    DELETE FROM Author WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO