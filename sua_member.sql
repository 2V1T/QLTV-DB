CREATE PROC sua_member @id_no BIGINT, @phone_no INT, @email VARCHAR(255), @address NVARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT * FROM tim_member_theo_cccd(@id_no))
    BEGIN
        UPDATE member SET phone_no = @phone_no, email = @email, address = @address WHERE id_no = @id_no
        DECLARE @result NVARCHAR(255) = N'Sửa thành công'
        SELECT @result
    END
END