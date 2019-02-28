/******************************************************************************
**				   	        CREATION OF STORED PROCEDURES	   				 **
*******************************************************************************/
/******************************************************************************
**  Author:	Alain Quinonez														 **
**  Date: 02/06/2019														 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************
**   Date:				 Author:                         Description:		 **
** --------			-------------        ----------------------------------- **
** 02/06/2019	     Alain Quinonez			Initial version					 **
*******************************************************************************/
USE Care4You
GO
PRINT 'Start of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_GetAuditHistory									 **
**				 Desc: Get All AuditHiistory table							 **
*******************************************************************************/
-- Create SP_GetAudit stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAuditHistory]') 
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetAuditHistory]
GO

CREATE PROCEDURE [dbo].[SP_GetAuditHistory]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT [AuditHistoryId]
			,[TableName]
			,[ColumnName]
			,[ID]
			,[Date]
			,[Oldvalue]
			,[NewValue]
			,[ModifiedBy]
			,typeOperation  = (CASE 
				WHEN NewValue = 'DELETE' 
                     THEN 'DELETE' 
                  WHEN OldValue = 'N/A' 
                     THEN 'INSERT'
                  ELSE 'UPDATE' 
             END)
        FROM dbo.AuditHistory
END
GO

PRINT 'Procedure [dbo].[SP_GetAuditHistory] created';
GO
/*

EXECUTE [dbo].[SP_GetAuditHistory] ;
*/