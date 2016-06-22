USE [bbomDb2];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'����������� ��������� [dbo].[Events]...';


GO
ALTER TABLE [dbo].[Events]
    ADD [UserId] NVARCHAR (128) NULL;


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'����������� �������� [dbo].[FK_Events_AspNetUsers]...';


GO
ALTER TABLE [dbo].[Events] WITH NOCHECK
    ADD CONSTRAINT [FK_Events_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'���������� ���������� ���� ������ ������� ���������.'
COMMIT TRANSACTION
END
ELSE PRINT N'���� ���������� ���������� ���� ������.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'������������ ������ ����������� ������������ ����� ��������� �����������';


GO
USE [bbomDb2];


GO
ALTER TABLE [dbo].[Events] WITH CHECK CHECK CONSTRAINT [FK_Events_AspNetUsers];


GO
PRINT N'���������� ���������.';


GO
