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
PRINT N'����������� �������� [dbo].[UsersActiveTemplates]...';


GO
DROP TABLE [dbo].[UsersActiveTemplates];


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
PRINT N'���������� ���������.';


GO
