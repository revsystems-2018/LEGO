/******************************************************************************
**  Name: Script Funtions and Stored Procedures SQL Data Base "Care4You"
**
**  Authors:	Boris Omar Perez Santos
**
**  
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                         Description:
** --------     -------------     ---------------------------------------------
** 02/08/2019   Boris Perez		Initial version
*******************************************************************************/
USE Care4You
GO
/******************************************************************************
**  Name: GetDatabaseRowVersion												 **
**  Desc: Used by DW ETL Process											 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetDatabaseRowVersion]') 
		AND type in (N'FN'))
BEGIN
	DROP FUNCTION [ETL].[GetDatabaseRowVersion] 
END
GO
CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO
PRINT 'Procedure [ETL].[GetDatabaseRowVersion] created';
GO

/******************************************************************************
**  Name: GetTableMigrationLatestRowVersion									 **
**  Desc: Gets Latest Rowversion used into the corresponding the table		 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetTableMigrationLatestRowVersion]') 
		AND type in (N'FN'))
BEGIN
	DROP FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
END
GO
CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;
	SELECT @last = LatestChange
	FROM [ETL].[TableMigration]
	WHERE TableName = @table;
  RETURN @last;
END
GO
PRINT 'Procedure [ETL].[GetTableMigrationLatestRowVersion] created';
GO
/**************************************************************************************************/
/******************************************************************************
**  Name: GetEmployeeChangesByRowVersion									 **
**  Desc: Pulls Changes and Inserts from the dbo.Employee table				 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetEmployeeChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetEmployeeChangesByRowVersion] 
END
GO
CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [IdEmployee] = emp.[Id]
		  ,emp.[Dni]
		  ,[Name] = emp.[First_Name] + ' ' + emp.[Last_Name]
		  ,emp.[Job_Position]
		  ,[Contrato] = con.[contract_code]
	FROM [dbo].[Employee]          emp
	INNER JOIN [dbo].[contract] con ON (emp.Id = con.Id)
	WHERE emp.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND emp.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)

GO
PRINT 'Procedure [ETL].[GetEmployeeChangesByRowVersion] created';
GO
/******************************************************************************
**  Name: GetTrainingChangesByRowVersion									 **
**  Desc: Pulls Changes and Inserts from the dbo.Training table				 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetTrainingChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetTrainingChangesByRowVersion] 
END
GO
CREATE PROCEDURE [ETL].[GetTrainingChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT[IdTraining] = tra.[Id]
		  ,tra.[name]
		  ,tra.[instructor]
	FROM [dbo].[Training] tra
	WHERE tra.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND tra.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO
PRINT 'Procedure [ETL].[GetTrainingChangesByRowVersion] created';
GO
/******************************************************************************
**  Name: GetEventualityChangesByRowVersion									 **
**  Desc: Pulls Changes and Inserts from the dbo.Eventuality table			 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetEventualityChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetEventualityChangesByRowVersion] 
END
GO
CREATE PROCEDURE [ETL].[GetEventualityChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SELECT  distinct IdEventuality = even.[Id]
		  ,IdEmployee = emp.[Id]
	      ,IdTraining = emt.[Id]
		  ,IdProject = pro.[Id]
		  ,IdItem = ite.[id]
		  ,[typeEvent] = teve.[typeEvent]
		  ,[injuryPart] = injPa.[injuryPart]
		  ,[injuryType] = injTy.[injuryType]
		  ,[dateEvent] = even.[dateEvent]
		  ,[description] = even.[description]
	FROM [dbo].[Eventuality] even
	INNER JOIN [dbo].[typeEvent] teve ON (even.typeEvent_id = teve.Id)
	INNER JOIN [dbo].[injuryPart] injPa ON (even.injuryPart_id = injPa.Id)
	INNER JOIN [dbo].[injuryType] injTy ON (even.injuryType_id = injTy.Id)
	INNER JOIN [dbo].[Employee] emp ON (even.Employee_id = emp.Id)
	INNER JOIN [dbo].[Project_Area] proA ON (proA.Id = even.projectArea_Id)
	INNER JOIN [dbo].[Project] pro ON (pro.id = proA.Project_Id)
	LEFT JOIN [dbo].[Assignment] assi ON (assi.employeeId = emp.Id)
	LEFT JOIN [dbo].[Item] ite ON (assi.ItemId = ite.Id)
	LEFT JOIN [dbo].[Employee_Training] emt ON (emp.Id = emt.employee_id)
	LEFT JOIN [dbo].[Training] Tra ON (emt.training_id = tra.Id)
	WHERE even.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND even.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)

	UNION

	SELECT IdEventuality = even.[Id]
		  ,IdEmployee = emp.[Id]
	      ,IdTraining = tra.[Id]
		  ,IdProject = pro.[Id]
		  ,IdItem = ite.[id]
		  ,[typeEvent] = teve.[typeEvent]
		  ,[injuryPart] = injPa.[injuryPart]
		  ,[injuryType] = injTy.[injuryType]
		  ,[dateEvent] = even.[dateEvent]
		  ,[description]	=even.[description]
	FROM [dbo].[Eventuality] even
	INNER JOIN [dbo].[typeEvent] teve ON (even.typeEvent_id = teve.Id)
	INNER JOIN [dbo].[injuryPart] injPa ON (even.injuryPart_id = injPa.Id)
	INNER JOIN [dbo].[injuryType] injTy ON (even.injuryType_id = injTy.Id)
	INNER JOIN [dbo].[Employee] emp ON (even.Employee_id = emp.Id)
	INNER JOIN [dbo].[Project_Area] proA ON (proA.Id = even.projectArea_Id)
	INNER JOIN [dbo].[Project] pro ON (pro.id = proA.Project_Id)
	INNER JOIN [dbo].[Employee_Training] emt ON (emt.employee_id = emp.Id)
	INNER JOIN [dbo].[Training] Tra ON (emt.training_id = tra.Id)
	INNER JOIN [dbo].[Assignment] assi ON (assi.employeeId = emp.Id)
	INNER JOIN [dbo].[Item] ite ON (assi.ItemId = ite.Id)
	WHERE even.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND even.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO
PRINT 'Procedure [ETL].[GetEventualityChangesByRowVersion] created';
GO
/******************************************************************************
**  Name: GetProjectChangesByRowVersion										 **
**  Desc: Pulls Changes and Inserts from the dbo.Project table				 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetProjectChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetProjectChangesByRowVersion] 
END
GO
CREATE PROCEDURE [ETL].[GetProjectChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT IProject = proj.[Id]
		,Name = proj.[name]
		,[Description] = proj.[description]
		,[Date_Start] = proj.[date_start]
		,[Date_End] = proj.[date_end]
		,[Area] = a.[name] 
		,[Project_Status]  = pa.[estado]
	FROM [dbo].[Project]  proj
	LEFT OUTER JOIN [dbo].[Project_Area] pa ON (proj.Id = pa.project_id)
	LEFT OUTER JOIN [dbo].[Area] a ON (a.Id = pa.project_id)
	WHERE proj.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND proj.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)

	UNION

	SELECT IProject = proj.[Id]
		,Name = proj.[name]
		,[Description] = proj.[description]
		,[Date_Start] = proj.[date_start]
		,[Date_End] = proj.[date_end]
		,[Area] = a.[name] 
		,[Project_Status]  = pa.[estado]
	FROM [dbo].[Project]  proj
	inner JOIN [dbo].[Project_Area] pa ON (proj.Id = pa.project_id)
	inner JOIN [dbo].[Area] a ON (a.Id = pa.project_id)
	WHERE proj.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND proj.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
END
GO
PRINT 'Procedure [ETL].[GetProjectChangesByRowVersion] created';
GO
/******************************************************************************
**  Name: GetItemChangesByRowVersion										 **
**  Desc: Pulls Changes and Inserts from the dbo.Item table					 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetItemChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetItemChangesByRowVersion] 
END
GO
CREATE PROCEDURE [ETL].[GetItemChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT ItemId        =it.[Id]
		  ,[ItemName]    = it.[name]
		  ,[ItemDescription]    = it.[description]
		  ,[ItemCategory] = cat.[name]
		  ,[ItemSubCategory] = sCat.[name]
		  ,[ItemType] = typ.[name]
	FROM [dbo].[Item] it
	INNER JOIN [dbo].[SubCategory] sCat ON (it.SubCategoryID = sCat.[Id])
	INNER JOIN [dbo].[Category] cat ON (scat.CategoryID = cat.[Id])
	INNER JOIN [dbo].[Category] typ ON (it.ItemTypeID = typ.[Id])
	WHERE it.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND it.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)

END
GO
PRINT 'Procedure [ETL].[GetItemChangesByRowVersion] created';
GO
/*******************************************************************************************************/
/******************************************************************************
**  Name: UpdateTableMigration												 **
**  Desc: Updates Table Migration with latest Rowversion used				 **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[UpdateTableMigration]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[UpdateTableMigration] 
END
GO
CREATE PROCEDURE [ETL].[UpdateTableMigration]
(
  @tableName VARCHAR(50),
  @current     BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE [ETL].[TableMigration]
	SET LatestChange = @current
	WHERE TableName = @tableName;
GO
PRINT 'Procedure [ETL].[UpdateTableMigration] created';
GO
/******************************************************************************
**  Name: PullTableDataToDW													 **
**  Desc: Pulls Changes and Inserts from the Care4You to DWCare$You Database **
**  Called By ETL SQL Job.													 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[PullDataToDatawarehouse]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[PullDataToDatawarehouse] 
END
GO
CREATE PROCEDURE [ETL].[PullDataToDatawarehouse]
(
  @table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DWCare4You].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
GO
PRINT 'Procedure [ETL].[PullDataToDatawarehouse] created';
GO
