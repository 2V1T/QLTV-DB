CREATE TRIGGER tr_ban_member
ON Member
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM BorrowedDetails WHERE member_id IN (SELECT id FROM deleted)
    DELETE FROM Member WHERE id IN (SELECT id FROM deleted)
END
GO
CREATE TRIGGER tr_xoa_copies
ON Copies
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM BorrowedDetails WHERE copies_id IN (SELECT id FROM deleted)
    DELETE FROM Copies WHERE id IN (SELECT id FROM deleted)
END
GO
CREATE TRIGGER tr_xoa_sach
ON Book
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Copies WHERE book_id IN (SELECT id FROM deleted)
    DELETE FROM Book WHERE id IN (SELECT id FROM deleted)
END
GO
CREATE TRIGGER tr_xoa_danh_muc
ON Category
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Book WHERE category_id IN (SELECT id FROM deleted)
    DELETE FROM Category WHERE id IN (SELECT id FROM deleted)
END
GO
CREATE TRIGGER tr_xoa_tac_gia
ON Author
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Book WHERE author_id IN (SELECT id FROM deleted)
    DELETE FROM Author WHERE id IN (SELECT id FROM deleted)
END