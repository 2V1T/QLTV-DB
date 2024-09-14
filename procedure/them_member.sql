CREATE PROC them_member @id_no BIGINT, @name NVARCHAR(120), @phone_no INT, @email VARCHAR(255), @address NVARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM member WHERE id_no = @id_no)
    BEGIN
        INSERT INTO member(id_no, name, phone_no, email, address) VALUES(@id_no, @name, @phone_no, @email, @address)
        DECLARE @result NVARCHAR(255) = 'Thêm thành công'
        SELECT result = @result
    END
END