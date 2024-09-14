CREATE PROCEDURE login @username VARCHAR(50), @password VARCHAR(MAX)
AS
BEGIN
    IF EXISTS (SELECT TOP 1 id FROM vwUser WHERE username = @username AND password = HASHBYTES('SHA2_512', @password))
    BEGIN
        SELECT TOP 1 id FROM vwUser WHERE username = @username AND password = HASHBYTES('SHA2_512', @password)
    END
    ELSE
    BEGIN
        DECLARE @result NVARCHAR(50) = N'Đăng nhập thất bại'
        SELECT result = @result
    END
END
GO