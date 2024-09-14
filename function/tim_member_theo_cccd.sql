CREATE FUNCTION tim_member_theo_cccd(@cccd BIGINT) RETURNS TABLE
AS
RETURN
    SELECT * FROM vwMember WHERE id_no = @cccd
GO