CREATE FUNCTION lay_member_theo_copies_id (@copies_id INT) RETURNS TABLE
AS
RETURN
    SELECT * FROM vwMember WHERE id = (SELECT member_id FROM BorrowedDetails WHERE copies_id = @copies_id)
GO