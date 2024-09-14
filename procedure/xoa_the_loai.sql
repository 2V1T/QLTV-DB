CREATE PROC xoa_the_loai_theo_id @id INT
AS
BEGIN
    DELETE FROM Category WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO
CREATE PROC xoa_the_loai @name NVARCHAR(100)
AS
BEGIN
    DELETE FROM Category WHERE name = @name
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO