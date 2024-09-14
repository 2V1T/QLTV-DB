CREATE PROC doi_mat_khau @id INT, @old_password VARCHAR(MAX), @new_password VARCHAR(MAX), @retype_password VARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(50)
    IF EXISTS (SELECT TOP 1 id FROM vwUser WHERE id = @id AND password = HASHBYTES('SHA2_512', @old_password))
    BEGIN
        IF @new_password = @retype_password
        BEGIN
            UPDATE [user] SET password = HASHBYTES('SHA2_512', @new_password) WHERE id = @id
            SET @result = N'Đổi mật khẩu thành công'
        END
        ELSE
        BEGIN
            SET @result = N'Mật khẩu mới không khớp'
        END
    END
    ELSE
    BEGIN
        SET @result = N'Mật khẩu cũ không đúng'
    END
    SELECT result = @result
END