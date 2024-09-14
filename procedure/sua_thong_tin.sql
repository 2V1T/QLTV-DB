CREATE PROC sua_thong_tin @id INT, @name NVARCHAR(120), @email VARCHAR(255), @address NVARCHAR(255), @phone_no INT
AS
BEGIN
    UPDATE [User] SET name = @name, email = @email, address = @address, phone_no = @phone_no WHERE id = @id
    DECLARE @result NVARCHAR(255)
    SELECT result = N'Cập nhật thông tin thành công'
END
GO