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
PRINT N'����������� ��������� [dbo].[AspNetUsers]...';


GO
ALTER TABLE [dbo].[AspNetUsers]
    ADD [ActiveTemplateId] INT NULL;


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
PRINT N'����������� �������� [dbo].[FK_AspNetUsers_Tempalates]...';


GO
ALTER TABLE [dbo].[AspNetUsers] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUsers_Tempalates] FOREIGN KEY ([ActiveTemplateId]) REFERENCES [dbo].[Templates] ([Id]);


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
ALTER TABLE [dbo].[AspNetUsers] WITH CHECK CHECK CONSTRAINT [FK_AspNetUsers_Tempalates];


GO
PRINT N'���������� ���������.';


GO
