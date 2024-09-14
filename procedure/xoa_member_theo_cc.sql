CREATE PROCEDURE xoa_member_theo_cc @id_no INT
AS
BEGIN
    DELETE FROM Member WHERE id_no = @id_no
    DECLARE @result NVARCHAR(255)
    SET @result = N'Xóa thành công'
    SELECT result = @result
END
GO