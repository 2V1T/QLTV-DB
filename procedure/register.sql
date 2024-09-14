CREATE PROCEDURE register @username NVARCHAR(50), @password VARCHAR(MAX), @name NVARCHAR(120), @email VARCHAR(255), @address NVARCHAR(255), @phone INT, @admin BIT
AS
BEGIN
    DECLARE @result BIT
    IF NOT EXISTS (SELECT TOP 1 id FROM vwUser WHERE username = @username)
    BEGIN
        INSERT INTO vwUser (username, password, name, email, address, phone_no, admin) VALUES (@username, HASHBYTES('SHA2_512', @password), @name, @email, @address, @phone, @admin)
        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = 0
    END
    SELECT result = @result
END
GO