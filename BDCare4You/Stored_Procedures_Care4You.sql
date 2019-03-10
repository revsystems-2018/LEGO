/******************************************************************************
**				   	        CREATION OF STORED PROCEDURES	   				 **
*******************************************************************************/
/******************************************************************************
*******************************************************************************
**                            Change History								 **
*******************************************************************************
                        										 **
*******************************************************************************/
USE Care4You
GO
PRINT 'Start of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_InsertDepartment									**
**				 Desc: Insert Register Department table					**
**				 Autor: Boris Perez										    **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertDepartment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertDepartment]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertDepartment]
(
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Department](code 
							,name 
							,ModifiedBy)
	VALUES (@Code
			,@Name
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewAraeaId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertDepartment] created';
GO
/******************************************************************************
**				 Name: SP_UpdateDepartment										 **
**				 Desc: Update Register Department table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateDepartment]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateDepartment];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateDepartment]
(
	@IdDepartment INT,
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Department]
	SET update_On = GETDATE()
		,code = @Code
		,name = @Name
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdDepartment;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT Id,code,name,ModifiedBy
		FROM [dbo].[Department] 
		WHERE Id = @IdDepartment;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateDepartment] created';
GO
/******************************************************************************
**				 Name: SP_DeleteDepartment									 **
**				 Desc: Delete Register Department table					 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteDepartment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteDepartment];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteDepartment]
(
	@IdDepartment INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Department]
	WHERE Id = @IdDepartment;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteDepartment] created';
GO

/******************************************************************************
**				 Name: SP_GetDepartmentId									**
**				 Desc: Get Department by Id table							**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetDepartmentId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetDepartmentId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetDepartmentId]
(
	@IdDepartment INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT code
		  ,name
    FROM [dbo].[Department]
	WHERE Id = @IdDepartment;
END
GO
PRINT 'Procedure [dbo].[SP_GetDepartmentId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllDepartment									 **
**				 Desc: Get All Department	table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllDepartment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllDepartment];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllDepartment]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Id
		  ,code
		  ,name
    FROM [dbo].[Department];
END
GO
PRINT 'Procedure [dbo].[SP_GetAllDepartment] created';
GO
/******************************************************************************
**				 Name: SP_InsertCompany									     **
**				 Desc: Insert Register Company table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertCompany]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertCompany]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertCompany]
(
	@Code VARCHAR(10),
	@Name VARCHAR(30),
	@Instructor VARCHAR(50),
	@Department_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Company](code 
							,name 
							,instructor
							,Department_id
							,ModifiedBy)
	VALUES (@Code
			,@Name
			,@Instructor
			,@Department_Id
			,@ModifiedBy)
	SELECT @@IDENTITY AS NewCompanyId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertCompany] created';
GO
/******************************************************************************
**				 Name: SP_UpdateCompany									     **
**				 Desc: Update Register Company table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateCompany]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateCompany]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateCompany]
(
	@IdCompany INT,
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@Instructor VARCHAR(50),
	@Department_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Company]
	SET update_On = GETDATE()
		,code = @Code
		,name = @Name
		,instructor =@Instructor
		,Department_id = @Department_Id
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdCompany;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT code
		FROM [dbo].[Company]
		WHERE Id = @IdCompany;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateCompany] created';
GO
/******************************************************************************
**				 Name: SP_DeleteCompany									     **
**				 Desc: Delete Register Company table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteCompany]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteCompany]
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteCompany]
(
	@IdCompany INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Company] 
	WHERE Id = @IdCompany;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteCompany] created';
GO
/******************************************************************************
**				 Name: SP_GetCompanyId										 **
**				 Desc: Get Company by Id table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetCompanyId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetCompanyId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetCompanyId]
(
	@IdCompany INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT t.code
		  ,t.name
		  ,t.instructor
		  ,a.name
    FROM [dbo].[Company] t
	INNER JOIN [dbo].[Department] a
	ON (t.Department_id = a.Id)
	WHERE t.Id = @IdCompany;
END
GO
PRINT 'Procedure [dbo].[SP_GetCompanyId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllCompany									     **
**				 Desc: Get All Company table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllCompany]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllCompany];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllCompany]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT t.code
		  ,t.name
		  ,t.instructor
		  ,a.name
    FROM [dbo].[Company] t
	INNER JOIN [dbo].[Department] a
	ON (t.Department_id = a.Id);
END
GO
PRINT 'Procedure [dbo].[SP_GetAllCompany] created';
GO
/******************************************************************************
**				 Name: SP_InsertRole										 **
**				 Desc: Insert Register Role table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertRole]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertRole]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertRole]
(
	@Code VARCHAR(10),
	@Description VARCHAR(150),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Role](code 
							,[description]
							,ModifiedBy)
	VALUES (@Code
			,@Description
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewRoleId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertRole] created';
GO
/******************************************************************************
**				 Name: SP_UpdateRole										 **
**				 Desc: Update Register Role table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateRole]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateRole]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateRole]
(
	@IdRole INT,
	@Code VARCHAR(10),
	@Description VARCHAR(150),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Role] 
	SET update_On = GETDATE()
		,code = @Code
		,[description] = @Description
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdRole;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT code
		FROM [dbo].[Role] 
		WHERE Id = @IdRole;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateRole] created';
GO
/******************************************************************************
**				 Name: SP_DeleteRole										 **
**				 Desc: Delete Register Role table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteRole]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteRole]
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteRole]
(
	@IdRole INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Role] 
	WHERE Id = @IdRole;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteRole] created';
GO
/******************************************************************************
**				 Name: SP_GetRoleId											 **
**				 Desc: Get Role by Id table									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetRoleId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetRoleId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetRoleId]
(
	@IdRole INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT code
		  ,[description]
    FROM [dbo].[Role]
	WHERE Id = @IdRole;
END
GO
PRINT 'Procedure [dbo].[SP_GetRoleId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllRole										 **
**				 Desc: Get All Role table									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllRole]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllRole];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllRole]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT code
		  ,[description]
    FROM [dbo].[Role];
END
GO
PRINT 'Procedure [dbo].[SP_GetAllRole] created';
GO
/******************************************************************************
**				 Name: SP_InsertRules										**
**				 Desc: Insert Register Rules table							**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertRules]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertRules]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertRules]
(
	@Employee_Id INT,
	@Company_Id INT,
	@State VARCHAR(10),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Rules](Employee_id 
										  ,Company_id
										  ,[state]
										  ,ModifiedBy)
	VALUES (@Employee_Id
			,@Company_Id
			,@State
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewRulesId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertRules] created';
GO
/******************************************************************************
**				 Name: SP_UpdateRules										**
**				 Desc: Update Register Rules table							**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateRules]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateRules]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateRules]
(
	@IdRules INT,
	@Employee_Id INT,
	@Company_Id INT,
	@State VARCHAR(10),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [Rules]
	SET update_On = GETDATE()
		,Employee_id = @Employee_Id
		,Company_id = @Company_Id
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdRules;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT Id
		FROM [dbo].[Rules]
		WHERE Id = @IdRules;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateRules] created';
GO
/******************************************************************************
**				 Name: SP_DeleteRules										**
**				 Desc: Delete Register Rules table							**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteRules]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteRules]
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteRules]
(
	@IdRules INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Rules] 
	WHERE Id = @IdRules;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteRules] created';
GO
/******************************************************************************
**				 Name: SP_GetRulesId										**
**				 Desc: Get Rules by Id table								**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetRulesId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetRulesId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetRulesId]
(
	@IdRules INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Company = t.name
		  ,Instructor = t.instructor
		  ,Department = a.name
		  --,Employee = e.firstName + ' ' + e. lastName
    FROM [dbo].[Rules] et
	--INNER JOIN [dbo].[Employee] e
	--ON (et.Employee_id = e.Id)
	INNER JOIN [dbo].[Company] t
	ON (et.Company_id = t.Id)
	INNER JOIN [dbo].[Department] a
	ON (t.Department_id = a.Id)
	WHERE et.Id = @IdRules;
END
GO
PRINT 'Procedure [dbo].[SP_GetRulesId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllRules										**
**				 Desc: Get All Rules table									**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllRules]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllRules];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllRules]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Company = t.name
		  ,Instructor = t.instructor
		  ,Department = a.name
		  --,Employee = e.firstName + ' ' + e. lastName
    FROM [dbo].[Rules] et
	--INNER JOIN [dbo].[Employee] e
	--ON (et.Employee_id = e.Id)
	INNER JOIN [dbo].[Company] t
	ON (et.Company_id = t.Id)
	INNER JOIN [dbo].[Department] a
	ON (t.Department_id = a.Id);
END
GO
PRINT 'Procedure [dbo].[SP_GetAllRules] created';
GO

/******************************************************************************
**				 Name: SP_AddEmployee										 **
**				 Desc: Insert new Register in Employee table		         **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[AddEmployee]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[AddEmployee]
END
GO
CREATE PROCEDURE [dbo].[AddEmployee]
(
	@Dni VARCHAR(15),
	@First_Name VARCHAR(50),
	@Last_Name VARCHAR(50),
	@Address VARCHAR(50),
	@Phone INT,
	@Email VARCHAR(50),
	@Job_Description  VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Employee](Dni
								 ,First_Name
								 ,Last_Name
								 ,[Address]
								 ,Phone
								 ,email
								 ,Job_Description
								 )
	VALUES (
				@Dni,
				@First_Name,
				@Last_Name,
				@Address,
				@Phone,
				@Email,
				@Job_Description
			);
	SELECT @@IDENTITY AS IdNewEmployee;
	PRINT @@IDENTITY
END
GO
PRINT 'Procedure [dbo].[AddEmployee] created';
GO

/******************************************************************************
**				 Name: SP_DeleteEmployee							         **
**				 Desc: Delete Register in Employee table		             **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEmployee]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DeleteEmployee]
END

GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
(
	@Id int
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	DELETE FROM  [dbo].[Employee]
	
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[DeleteEmployee] created';
GO

/******************************************************************************
**				 Name: SP_GetAllEmployees							         **
**				 Desc: Get all Employees from Employee table		         **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAllEmployees]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAllEmployees]
END
GO
CREATE PROCEDURE [dbo].[GetAllEmployees]

AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT     [Id]
			  ,[Dni]
			  ,[First_Name]
			  ,[Last_Name]
			  ,[Address]
			  ,[Phone]
			  ,[email]
			  ,[Job_Description]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
  FROM [dbo].[Employee]
	
END
GO
PRINT 'Procedure [dbo].[GetAllEmployees] created';
GO
/******************************************************************************
**				 Name: SP_GetEmployeeById   						         **
**				 Desc: get Employee by id						             **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEmployeeById]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEmployeeById]
END
GO
CREATE PROCEDURE [dbo].[GetEmployeeById]
( 
  @Id int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT     [Id]
			  ,[Dni]
			  ,[First_Name]
			  ,[Last_Name]
			  ,[Address]
			  ,[Phone]
			  ,[email]
			  ,[Job_Description]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
  FROM [dbo].[Employee]
  WHERE [Id] = @Id
	
END
GO
PRINT 'Procedure [dbo].[GetEmployeeById] created';
GO
/******************************************************************************
**				 Name: SP_UpdateEmployee    						         **
**				 Desc: update Employee  						             **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpDateEmployee]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpDateEmployee]
END
GO
CREATE PROCEDURE [dbo].[UpDateEmployee]
(
	@Id int,
	@Dni VARCHAR(15),
	@First_Name VARCHAR(50),
	@Last_Name VARCHAR(50),
	@Address VARCHAR(50),
	@Phone INT,
	@Email VARCHAR(50),
	@Job_Description  VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE  [dbo].[Employee]
	SET 
				[Dni]= @Dni,
			    [First_Name] = @First_Name,
				[Last_Name]= @Last_Name,
				[Address] = @Address,
				[Phone] = @Phone,
				[email] = @Email,
				[Job_Description] = @Job_Description
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[UpdateEmployee] created';
GO



/******************************************************************************
**				 Name: SP_InsertIncident									 **
**				 Desc: Insert Register Incident table						 **
*******************************************************************************/
-- Create SP_InsertIncident stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertIncident]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_InsertIncident]
GO

CREATE PROCEDURE [dbo].[SP_InsertIncident]
(
	   @IncidentCode VARCHAR(50)
      ,@IncidentCriteria VARCHAR(50)
      ,@IncidentName VARCHAR(50)
      ,@IncidentObjective VARCHAR(50)
      ,@IncidentScope VARCHAR(50)
      ,@IncidentType VARCHAR(10)
      ,@EmployeeId INT
      ,@IncidentPeriodicity VARCHAR(10)
      ,@DepartmentId INT
	    ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Incident(IncidentCode
						,IncidentCriteria
						,IncidentName
						,IncidentObjective
						,IncidentScope
						,IncidentType
						,EmployeeId
						,IncidentPeriodicity
						,DepartmentId
						,ModifiedBy)
	VALUES (@IncidentCode
		    ,@IncidentCriteria
		    ,@IncidentName
		    ,@IncidentObjective
		    ,@IncidentScope
		    ,@IncidentType
		    ,@EmployeeId
		    ,@IncidentPeriodicity
		    ,@DepartmentId
		    ,@ModifiedBy);

	SELECT @@IDENTITY AS NewIncidentId;
END
GO

PRINT 'Procedure dbo.SP_InsertIncident created';
GO


/******************************************************************************
**				 Name: SP_UpdateIncident									 **
**				 Desc: Update Register Incident table						 **
*******************************************************************************/
-- Create SP_UpdateIncident stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateIncident]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UpdateIncident]
GO

CREATE PROCEDURE [dbo].[SP_UpdateIncident]
(
     @IdIncident INT
    ,@IncidentCode VARCHAR(50)
    ,@IncidentCriteria VARCHAR(50)
    ,@IncidentName VARCHAR(50)
    ,@IncidentObjective VARCHAR(50)
    ,@IncidentScope VARCHAR(50)
    ,@IncidentType VARCHAR(10)
    ,@EmployeeId INT
    ,@IncidentPeriodicity VARCHAR(10)
    ,@DepartmentId INT
	  ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Incident
    SET update_On = GETDATE()
		,IncidentCode = @IncidentCode
        ,IncidentCriteria = @IncidentCriteria
		,IncidentName = @IncidentName
		,IncidentObjective = @IncidentObjective
		,IncidentScope = @IncidentScope
		,IncidentType = @IncidentType
		,EmployeeId = @EmployeeId
		,IncidentPeriodicity = @IncidentPeriodicity
		,DepartmentId = @DepartmentId
		,ModifiedBy = @ModifiedBy
    WHERE Id = @IdIncident;

END
GO

PRINT 'Procedure dbo.SP_UpdateIncident created';
GO

/******************************************************************************
**				 Name: SP_DeleteIncident									 **
**				 Desc: Delete Register Incident table						 **
*******************************************************************************/
-- Create SP_DeleteIncident stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteIncident]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DeleteIncident]
GO

CREATE PROCEDURE [dbo].[SP_DeleteIncident]
(
    @IdIncident INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Incident
	WHERE Id = @IdIncident;
END
GO

PRINT 'Procedure dbo.SP_DeleteIncident created';
GO


/******************************************************************************
**				 Name:SP_GetIncidentId										 **
**				 Desc: Get Incident by Id table								 **
*******************************************************************************/
-- Create SP_GetIncidentId stored procedure.
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetIncidentId]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetIncidentId]
GO

CREATE PROCEDURE [dbo].[SP_GetIncidentId]
(
    @IdIncident INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT IncidentCode
			,IncidentCriteria
			,IncidentName
			,IncidentObjective
			,IncidentScope
			,IncidentType
			,EmployeeId
			,IncidentPeriodicity
			,DepartmentId

        FROM dbo.Incident
        where Id = @IdIncident;
END
GO

PRINT 'Procedure dbo.SP_GetIncidentId created';
GO

/******************************************************************************
**				 Name: SP_GetIncident										 **
**				 Desc: Get All Incident table								 **
*******************************************************************************/
-- Create SP_GetIncident stored procedure.
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetIncident]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetIncident]
GO

CREATE PROCEDURE [dbo].[SP_GetIncident]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT IncidentCode
			,IncidentCriteria
			,IncidentName
			,IncidentObjective
			,IncidentScope
			,IncidentType
			,EmployeeId
			,IncidentPeriodicity
			,DepartmentId

        FROM dbo.Incident
END
GO

PRINT 'Procedure dbo.SP_GetIncident created';
GO



/******************************************************************************
--				 Name: SP_updateWorkTable										 
--				 Desc: Update Register Work table				
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'dbo.SP_updateWorkTable') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_updateWorkTable;
END
GO
CREATE PROCEDURE dbo.SP_updateWorkTable ( @idWork INT,
											  @Work_amount  VARCHAR(9) ,
											  @Work_code    VARCHAR(10),
											  @end_date         DATETIME ,
											  @init_date        DATETIME ,
											  @payment_type     VARCHAR(20) ,
											  @Employee_id 	 INT,    
											  @Position_id       INT,
											  @type_Work_id INT ) AS

SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE dbo.Work
	SET updated_On = GETDATE(),
		Work_amount = @Work_amount,
		Work_code = @Work_code,
		end_date = @end_date ,
		init_date = @init_date ,
		payment_type = @payment_type ,
		Employee_id = @Employee_id ,
		Position_id = @Position_id 
	WHERE id = @idWork;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT Work_code
		FROM dbo.Work
		WHERE id = @idWork;
	 END
END
GO
PRINT 'Procedure dbo.SP_updateWorkTable created';
GO

/******************************************************************************
--				 Name: SP_deleteWorkById										 
--				 Desc: Delete Register Work table by id						 						 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_deleteWorkById') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_deleteWorkById;
END
GO
CREATE PROCEDURE dbo.SP_deleteWorkById (@idWork INT ) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Work
	WHERE id = @idWork;
END
GO
PRINT 'Procedure dbo.SP_deleteWorkById created';
GO

/******************************************************************************
--				 Name: SP_getWorkById										 
--				 Desc: Get Register Work by id					 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_getWorkById]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getWorkById;
END
GO
CREATE PROCEDURE dbo.SP_getWorkById (@idWork INT) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id,
		   Work_amount,
		   Work_code,
		   end_date,
		   init_date,
		   payment_type,
		   Employee_id,
		   Position_id
    FROM dbo.Work
	WHERE id = @idWork;
END
GO
PRINT 'Procedure dbo.SP_getWorkById created';
GO
/******************************************************************************
--				 Name: SP_getWorkTable										 
--				 Desc: Get Register Work table					 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_getWorkTable') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getWorkTable;
END
GO
CREATE PROCEDURE dbo.SP_getWorkTable
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id,
		   created_on,
		   Work_amount,
		   Work_code,
		   end_date,
		   init_date,
		   payment_type,
		   Employee_id,
		   Position_id
    FROM dbo.work;
END
GO
PRINT 'Procedure dbo.SP_getWorkTable created';
GO


/******************************************************************************
**				 Name: SP_InsertPosition										 **
**				 Desc: Insert new register in Position table				     **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertPosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertPosition]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertPosition]
(
	@name VARCHAR(250),
	@description VARCHAR(1000), 
	@date_start DATE,
	@date_end DATE
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Position](name, [description], date_start, date_end,createBy,createDate,updatedBy,updateDate)
	VALUES (@name,
			@description,
			@date_start,
			@date_end,
			DEFAULT ,
            DEFAULT ,
            DEFAULT ,
            DEFAULT 
			);
	SELECT @@IDENTITY AS IdNewPosition;
	PRINT @@IDENTITY
END
GO
PRINT 'Procedure [dbo].[SP_InsertPosition] created';
GO


/******************************************************************************
**				 Name: SP_UpdatePosition										 **
**				 Desc: Update Register in Position table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdatePosition]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdatePosition];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdatePosition]
(
    @id INT,
	@name VARCHAR(250),
	@description VARCHAR(1000), 
	@date_start DATE,
	@date_end DATE 
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE  [dbo].[Position]
	SET
				[name]=@name,
			    [description] = @description,
				[date_start]= @date_start,
				[date_end] = @date_end
	WHERE [Id] = @id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdatePosition] created';
GO

/******************************************************************************
**				 Name: SP_DeletePosition										 **
**				 Desc: Delete a Register in the Position table   			 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeletePosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeletePosition];
END
GO
CREATE PROCEDURE [dbo].[SP_DeletePosition]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Position]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeletePosition] created';
GO

/******************************************************************************
**				 Name: SP_GetPositionId											 **
**				 Desc: Get Position by Id table									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetPositionId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetPositionId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetPositionId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT     [Id],
			   [name],
			   [description],
			   [date_start],
			   [date_end],
			   [createBy],
			   [createDate],
			   [updatedBy],
			   [updateDate]
  FROM [dbo].[Position]
  WHERE [Id] = @id
	
END
GO
PRINT 'Procedure [dbo].[SP_GetPositionId] created';
GO
/******************************************************************************
**				 Name: SP_GetPosition										 **
**				 Desc: Get All Position	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetPosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetPosition];
END
GO
CREATE PROCEDURE [dbo].[SP_GetPosition]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT     [Id],
			   [name],
			   [description],
			   [date_start],
			   [date_end],
			   [createBy],
			   [createDate],
			   [updatedBy],
			   [updateDate]
    FROM [dbo].[Position];
END
GO
PRINT 'Procedure [dbo].[SP_GetPosition] created';
GO

/******************************************************************************
**				 Name: SP_InsertAssigned								 **
**				 Desc: Insert new register in Assigned table				 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertAssigned]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertAssigned]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertAssigned]
(
	@Position_id INT,
	@Department_id INT, 
	@estado VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Assigned]([Position_id],[Department_id],[estado])
	VALUES (@Position_id,
			@Department_id,
			@estado
			);
	SELECT @@IDENTITY AS IdNewAssigned;
	PRINT @@IDENTITY
END
GO
PRINT 'Procedure [dbo].[SP_InsertAssigned] created';
GO

/******************************************************************************
**				 Name: SP_UpdateAssigned								 **
**				 Desc: Update Register in Position table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateAssigned]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateAssigned];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateAssigned]
(
    @id INT,
	@Position_id INT,
	@Department_id INT,
	@estado VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE  [dbo].[Assigned]
	SET
				[Position_id]= @Position_id,
			    [Department_id] = @Department_id,
				[estado]= @estado
	WHERE [Id] = @id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateAssigned] created';
GO

/******************************************************************************
**				 Name: SP_DeleteAssigned								 **
**				 Desc: Delete a Register in the Assigned table   		 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteAssigned]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteAssigned];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteAssigned]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Assigned]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteAssigned] created';
GO


use Care4You;
/******************************************************************************
**				 Name: SP_GetAssignedId									 **
**				 Desc: Get Assigned by Id table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAssignedId]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAssignedId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAssignedId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT     [Id],
			   [Position_id],
			   [Department_id],
			   [estado]
  FROM [dbo].[Assigned]
  WHERE [Id] = @id

END
GO
PRINT 'Procedure [dbo].[SP_GetAssignedId] created';
GO
/******************************************************************************
**				 Name: SP_GetAssigned									 **
**				 Desc: Get Assigned	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAssigned]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAssigned];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAssigned]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT     [Id],
			   [Position_id],
			   [Department_id],
			   [estado]
    FROM [dbo].[Assigned];
END
GO
PRINT 'Procedure [dbo].[SP_GetAssigned] created';
GO



/******************************************************************************
**				 Name: SP_GetSafetyEquipment									 **
**				 Desc: Get SafetyEquipment	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetSafetyEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetSafetyEquipment];
END
GO
CREATE PROCEDURE [dbo].[SP_GetSafetyEquipment]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [Id]
      ,[create_On]
      ,[update_On]
      ,[version]
      ,[name]
      ,[description]
      ,[ModifiedBy]
      ,[Rowversion]
  FROM [dbo].[SafetyEquipment]
END
GO
PRINT 'Procedure [dbo].[SP_GetSafetyEquipment] created';
GO

PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_DeleteSafetyEquipment								**
**				 Desc: Delete a Register in the SafetyEquipment table   	**
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteSafetyEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteSafetyEquipment];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteSafetyEquipment]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[SafetyEquipment]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteSafetyEquipment] created';
GO
PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_UpdateSafetyEquipment   							 **
**				 Desc: update table SafetyEquipment							 **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateSafetyEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateSafetyEquipment]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateSafetyEquipment]
(
	@Id int,
	@version VARCHAR(15),
	@name VARCHAR(50),
	@description VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[SafetyEquipment]
   SET [create_On] = GETDATE()
      ,[update_On] = GETDATE()
      ,[version] = @version
      ,[name] = @name
      ,[description] = @description
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateSafetyEquipment] created';
GO
