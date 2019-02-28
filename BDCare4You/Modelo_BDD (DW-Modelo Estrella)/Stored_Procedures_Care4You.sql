/******************************************************************************
**				   	        CREATION OF STORED PROCEDURES	   				 **
*******************************************************************************/
/******************************************************************************
**  Author: Veruzka Onofre													 **
**  Date: 02/07/2019														 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************
**   Date:				 Author:                         Description:		 **
** --------			-------------        ----------------------------------- **
** 02/07/2019		Veruzka Onofre			Initial version					 **
** 02/07/2019		Alain Quinonez			Employee						 **                          										 **
*******************************************************************************/
USE Care4You
GO
PRINT 'Start of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_InsertArea										 **
**				 Desc: Insert Register Area table							 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertArea]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertArea]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertArea]
(
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Area](code 
							,name 
							,ModifiedBy)
	VALUES (@Code
			,@Name
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewAraeaId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertArea] created';
GO
/******************************************************************************
**				 Name: SP_UpdateArea										 **
**				 Desc: Update Register Area table							 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateArea]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateArea];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateArea]
(
	@IdArea INT,
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Area]
	SET update_On = GETDATE()
		,code = @Code
		,name = @Name
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdArea;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT Id,code,name,ModifiedBy
		FROM [dbo].[Area] 
		WHERE Id = @IdArea;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateArea] created';
GO
/******************************************************************************
**				 Name: SP_DeleteArea										 **
**				 Desc: Delete Register Area table							 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteArea]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteArea];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteArea]
(
	@IdArea INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Area]
	WHERE Id = @IdArea;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteArea] created';
GO

/******************************************************************************
**				 Name: SP_GetAreaId											 **
**				 Desc: Get Area by Id table									 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAreaId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAreaId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAreaId]
(
	@IdArea INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT code
		  ,name
    FROM [dbo].[Area]
	WHERE Id = @IdArea;
END
GO
PRINT 'Procedure [dbo].[SP_GetAreaId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllArea										 **
**				 Desc: Get All Area	table									 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllArea]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllArea];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllArea]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Id
		  ,code
		  ,name
    FROM [dbo].[Area];
END
GO
PRINT 'Procedure [dbo].[SP_GetAllArea] created';
GO
/******************************************************************************
**				 Name: SP_InsertTraining									 **
**				 Desc: Insert Register Training table						 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertTraining]
(
	@Code VARCHAR(10),
	@Name VARCHAR(30),
	@Instructor VARCHAR(50),
	@Area_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Training](code 
							,name 
							,instructor
							,area_id
							,ModifiedBy)
	VALUES (@Code
			,@Name
			,@Instructor
			,@Area_Id
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewTrainingId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertTraining] created';
GO
/******************************************************************************
**				 Name: SP_UpdateTraining									 **
**				 Desc: Update Register Training table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateTraining]
(
	@IdTraining INT,
	@Code VARCHAR(10),
	@Name VARCHAR(50),
	@Instructor VARCHAR(50),
	@Area_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Training]
	SET update_On = GETDATE()
		,code = @Code
		,name = @Name
		,instructor =@Instructor
		,area_id = @Area_Id
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdTraining;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT code
		FROM [dbo].[Training]
		WHERE Id = @IdTraining;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateTraining] created';
GO
/******************************************************************************
**				 Name: SP_DeleteTraining									 **
**				 Desc: Delete Register Training table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteTraining]
(
	@IdTraining INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Training] 
	WHERE Id = @IdTraining;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteTraining] created';
GO
/******************************************************************************
**				 Name: SP_GetTrainingId										 **
**				 Desc: Get Training by Id table								 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetTrainingId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetTrainingId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetTrainingId]
(
	@IdTraining INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT t.code
		  ,t.name
		  ,t.instructor
		  ,a.name
    FROM [dbo].[Training] t
	INNER JOIN [dbo].[Area] a
	ON (t.area_id = a.Id)
	WHERE t.Id = @IdTraining;
END
GO
PRINT 'Procedure [dbo].[SP_GetTrainingId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllTraining									 **
**				 Desc: Get All Training table								 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllTraining];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllTraining]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT t.code
		  ,t.name
		  ,t.instructor
		  ,a.name
    FROM [dbo].[Training] t
	INNER JOIN [dbo].[Area] a
	ON (t.area_id = a.Id);
END
GO
PRINT 'Procedure [dbo].[SP_GetAllTraining] created';
GO
/******************************************************************************
**				 Name: SP_InsertRole										 **
**				 Desc: Insert Register Role table							 **
**				 Autor: Veruzka Onofre										 **
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
**				 Autor: Alain Quinonez										 **
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
**				 Autor: Veruzka Onofre										 **
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
**				 Autor: Alain Quinonez										 **
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
**				 Autor: Veruzka Onofre										 **
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
**				 Name: SP_InsertPosition									 **
**				 Desc: Insert Register Position table						 **
**				 Autor: Veruzka Onofre										 **
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
	@Name VARCHAR(30),
	@Role_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Position](name 
							,Role_id
							,ModifiedBy)
	VALUES (@Name
			,@Role_Id
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewPositionId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertPosition] created';
GO
/******************************************************************************
**				 Name: SP_UpdatePosition									 **
**				 Desc: Update Register Position table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdatePosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdatePosition]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdatePosition]
(
	@IdPosition INT,
	@Name VARCHAR(50),
	@Role_Id INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Position]
	SET update_On = GETDATE()
		,name = @Name
		,role_id = @Role_Id
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdPosition;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT name
		FROM [dbo].[Position]
		WHERE Id = @IdPosition;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdatePosition] created';
GO
/******************************************************************************
**				 Name: SP_DeletePosition									 **
**				 Desc: Delete Register Position table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeletePosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeletePosition]
END
GO
CREATE PROCEDURE [dbo].[SP_DeletePosition]
(
	@IdPosition INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Position] 
	WHERE Id = @IdPosition;
END
GO
PRINT 'Procedure [dbo].[SP_DeletePosition] created';
GO
/******************************************************************************
**				 Name: SP_GetPositionId										 **
**				 Desc: Get Position by Id table								 **
**				 Autor: Veruzka Onofre										 **
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
	@IdPosition INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT p.name
		  ,r.[description]
    FROM [dbo].[Position] p
	INNER JOIN [dbo].[Role] r
	ON (p.role_id = r.Id)
	WHERE p.Id = @IdPosition;
END
GO
PRINT 'Procedure [dbo].[SP_GetPositionId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllPosition									 **
**				 Desc: Get All Position table								 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllPosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllPosition];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllPosition]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT p.name
		  ,r.[description]
    FROM [dbo].[Position] p
	INNER JOIN [dbo].[Role] r
	ON (p.role_id = r.Id);
END
GO
PRINT 'Procedure [dbo].[SP_GetAllPosition] created';
GO

/******************************************************************************
**				 Name: SP_InsertEmployeeTraining							 **
**				 Desc: Insert Register Employee_Training table				 **
**				 Autor: Veruzka Onofre									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertEmployeeTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertEmployeeTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertEmployeeTraining]
(
	@Employee_Id INT,
	@Training_Id INT,
	@State VARCHAR(10),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Employee_Training](employee_id 
										  ,training_id
										  ,[state]
										  ,ModifiedBy)
	VALUES (@Employee_Id
			,@Training_Id
			,@State
			,@ModifiedBy);
	SELECT @@IDENTITY AS NewEmployeeTrainingId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertEmployeeTraining] created';
GO
/******************************************************************************
**				 Name: SP_UpdateEmployeeTraining							 **
**				 Desc: Update Register Employee_Training table				 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateEmployeeTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateEmployeeTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateEmployeeTraining]
(
	@IdEmployeeTraining INT,
	@Employee_Id INT,
	@Training_Id INT,
	@State VARCHAR(10),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [Employee_Training]
	SET update_On = GETDATE()
		,employee_id = @Employee_Id
		,training_id = @Training_Id
		,ModifiedBy = @ModifiedBy
	WHERE Id = @IdEmployeeTraining;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT Id
		FROM [dbo].[Employee_Training]
		WHERE Id = @IdEmployeeTraining;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateEmployeeTraining] created';
GO
/******************************************************************************
**				 Name: SP_DeleteEmployeeTraining							 **
**				 Desc: Delete Register Employee_Training table				 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteEmployeeTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteEmployeeTraining]
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteEmployeeTraining]
(
	@IdEmployeeTraining INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Employee_Training] 
	WHERE Id = @IdEmployeeTraining;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteEmployeeTraining] created';
GO
/******************************************************************************
**				 Name: SP_GetEmployeeTrainingId								 **
**				 Desc: Get Employee_Training by Id table					 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetEmployeeTrainingId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetEmployeeTrainingId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetEmployeeTrainingId]
(
	@IdEmployeeTraining INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Training = t.name
		  ,Instructor = t.instructor
		  ,Area = a.name
		  --,Employee = e.firstName + ' ' + e. lastName
    FROM [dbo].[Employee_Training] et
	--INNER JOIN [dbo].[Employee] e
	--ON (et.employee_id = e.Id)
	INNER JOIN [dbo].[Training] t
	ON (et.training_id = t.Id)
	INNER JOIN [dbo].[Area] a
	ON (t.area_id = a.Id)
	WHERE et.Id = @IdEmployeeTraining;
END
GO
PRINT 'Procedure [dbo].[SP_GetEmployeeTrainingId] created';
GO
/******************************************************************************
**				 Name: SP_GetAllEmployeeTraining							 **
**				 Desc: Get All Employee_Training table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllEmployeeTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetAllEmployeeTraining];
END
GO
CREATE PROCEDURE [dbo].[SP_GetAllEmployeeTraining]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT Training = t.name
		  ,Instructor = t.instructor
		  ,Area = a.name
		  --,Employee = e.firstName + ' ' + e. lastName
    FROM [dbo].[Employee_Training] et
	--INNER JOIN [dbo].[Employee] e
	--ON (et.employee_id = e.Id)
	INNER JOIN [dbo].[Training] t
	ON (et.training_id = t.Id)
	INNER JOIN [dbo].[Area] a
	ON (t.area_id = a.Id);
END
GO
PRINT 'Procedure [dbo].[SP_GetAllEmployeeTraining] created';
GO

/******************************************************************************
**				 Name: SP_AddEmployee										 **
**				 Desc: Insert new Register in Employee table		         **
**				 Autor: Alain Quinonez										 **
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
	@Job_Description  VARCHAR(50), 
	@Job_Position VARCHAR(50)
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
								 ,Job_Position
								 )
	VALUES (
				@Dni,
				@First_Name,
				@Last_Name,
				@Address,
				@Phone,
				@Email,
				@Job_Description, 
				@Job_Position
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
**				 Autor: Alain Quinonez										 **
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
**				 Desc: Get all employees from Employee table		         **
**				 Autor: Alain Quinonez										 **
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
			  ,[Job_Position]
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
**				 Desc: get employee by id						             **
**				 Autor: Alain Quinonez										 **
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
			  ,[Job_Position]
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
**				 Desc: update employee  						             **
**				 Autor: Alain Quinonez										 **
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
	@Job_Description  VARCHAR(50), 
	@Job_Position VARCHAR(50)
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
				[Job_Description] = @Job_Description, 
				[Job_Position] = @Job_Position
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[UpdateEmployee] created';
GO



/******************************************************************************
**				 Name: SP_InsertAudit										 **
**				 Desc: Insert Register Audit table							 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
-- Create SP_InsertAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertAudit]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_InsertAudit]
GO

CREATE PROCEDURE [dbo].[SP_InsertAudit]
(
	   @auditCode VARCHAR(50)
      ,@auditCriteria VARCHAR(50)
      ,@auditName VARCHAR(50)
      ,@auditObjective VARCHAR(50)
      ,@auditScope VARCHAR(50)
      ,@auditType VARCHAR(10)
      ,@employeeId INT
      ,@auditPeriodicity VARCHAR(10)
      ,@areaId INT
	    ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Audit(auditCode
						,auditCriteria
						,auditName
						,auditObjective
						,auditScope
						,auditType
						,employeeId
						,auditPeriodicity
						,areaId
						,ModifiedBy)
	VALUES (@auditCode
		    ,@auditCriteria
		    ,@auditName
		    ,@auditObjective
		    ,@auditScope
		    ,@auditType
		    ,@employeeId
		    ,@auditPeriodicity
		    ,@areaId
		    ,@ModifiedBy);

	SELECT @@IDENTITY AS NewAuditId;
END
GO

PRINT 'Procedure dbo.SP_InsertAudit created';
GO


/******************************************************************************
**				 Name: SP_UpdateAudit										 **
**				 Desc: Update Register Audit table							 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
-- Create SP_UpdateAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateAudit]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UpdateAudit]
GO

CREATE PROCEDURE [dbo].[SP_UpdateAudit]
(
     @IdAudit INT
    ,@auditCode VARCHAR(50)
    ,@auditCriteria VARCHAR(50)
    ,@auditName VARCHAR(50)
    ,@auditObjective VARCHAR(50)
    ,@auditScope VARCHAR(50)
    ,@auditType VARCHAR(10)
    ,@employeeId INT
    ,@auditPeriodicity VARCHAR(10)
    ,@areaId INT
	  ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Audit
    SET update_On = GETDATE()
		,auditCode = @auditCode
        ,auditCriteria = @auditCriteria
		,auditName = @auditName
		,auditObjective = @auditObjective
		,auditScope = @auditScope
		,auditType = @auditType
		,employeeId = @employeeId
		,auditPeriodicity = @auditPeriodicity
		,areaId = @areaId
		,ModifiedBy = @ModifiedBy
    WHERE Id = @IdAudit;

END
GO

PRINT 'Procedure dbo.SP_UpdateAudit created';
GO

/******************************************************************************
**				 Name: SP_DeleteAudit										 **
**				 Desc: Delete Register Audit table							 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
-- Create SP_DeleteAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteAudit]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DeleteAudit]
GO

CREATE PROCEDURE [dbo].[SP_DeleteAudit]
(
    @IdAudit INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Audit
	WHERE Id = @IdAudit;
END
GO

PRINT 'Procedure dbo.SP_DeleteAudit created';
GO


/******************************************************************************
**				 Name:SP_GetAuditId											 **
**				 Desc: Get Audit by Id table								 **
**				 Autor: Alain Quinonez							 **
*******************************************************************************/
-- Create SP_GetAuditId stored procedure.
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAuditId]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetAuditId]
GO

CREATE PROCEDURE [dbo].[SP_GetAuditId]
(
    @IdAudit INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT auditCode
			,auditCriteria
			,auditName
			,auditObjective
			,auditScope
			,auditType
			,employeeId
			,auditPeriodicity
			,areaId

        FROM dbo.Audit
        where Id = @IdAudit;
END
GO

PRINT 'Procedure dbo.SP_GetAuditId created';
GO

/******************************************************************************
**				 Name: SP_GetAudit											 **
**				 Desc: Get All Audit table									 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
-- Create SP_GetAudit stored procedure.
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAudit]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetAudit]
GO

CREATE PROCEDURE [dbo].[SP_GetAudit]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT auditCode
			,auditCriteria
			,auditName
			,auditObjective
			,auditScope
			,auditType
			,employeeId
			,auditPeriodicity
			,areaId

        FROM dbo.Audit
END
GO

PRINT 'Procedure dbo.SP_GetAudit created';
GO



/******************************************************************************
**				 Name: SP_InsertSafetyRule									 **
**				 Desc: Insert Register SafetyRule table						 **
**				 Autor: Alain Quinonez								 **
*******************************************************************************/
-- Create SP_InsertSafetyRule stored procedure

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertSafetyRule]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_InsertSafetyRule]
GO

CREATE PROCEDURE [dbo].[SP_InsertSafetyRule]
(
	@accomplishment BIT
      ,@auditId INT
      ,@complianceMetric INT
      ,@complianceParameter INT
      ,@policyCode VARCHAR(100)
      ,@policyName VARCHAR(100)
	  ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.SafetyRule(accomplishment
								,auditId
								,complianceMetric
								,complianceParameter
								,policyCode
								,policyName
								,ModifiedBy)
	VALUES (@accomplishment
			,@auditId
			,@complianceMetric
			,@complianceParameter
			,@policyCode
			,@policyName
			,@ModifiedBy);

	SELECT @@IDENTITY AS NewSafetyRuleId;
END
GO

PRINT 'Procedure dbo.SP_InsertSafetyRule created';
GO


/******************************************************************************
**				 Name: proUpdateSafetyRule									 **
**				 Desc: Update Register SafetyRule table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
-- Create SP_UpdateSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateSafetyRule]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UpdateSafetyRule]
GO

CREATE PROCEDURE [dbo].[SP_UpdateSafetyRule]
(
     @IdSafetyRule INT
    ,@accomplishment BIT
    ,@auditId INT
    ,@complianceMetric INT
    ,@complianceParameter INT
    ,@policyCode VARCHAR(100)
    ,@policyName VARCHAR(100)
	  ,@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.SafetyRule
    SET update_On = GETDATE()
		,accomplishment = @accomplishment
        ,auditId = @auditId
		,complianceMetric = @complianceMetric
		,complianceParameter = @complianceParameter
		,policyCode = @policyCode
		,policyName = @policyName
		,ModifiedBy = @ModifiedBy
    WHERE Id = @IdSafetyRule;

END
GO

PRINT 'Procedure dbo.SP_UpdateSafetyRule created';
GO


/******************************************************************************
**				 Name: SP_DeleteSafetyRule									 **
**				 Desc: Delete Register SafetyRule table						 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
-- Create SP_DeleteSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteSafetyRule]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DeleteSafetyRule]
GO

CREATE PROCEDURE [dbo].[SP_DeleteSafetyRule]
(
    @IdSafetyRule INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.SafetyRule
	WHERE Id = @IdSafetyRule;
END
GO

PRINT 'Procedure dbo.SP_DeleteSafetyRule created';
GO

/******************************************************************************
**				 Name: SP_GetSafetyRuleId									 **
**				 Desc: Get SafetyRule by Id table							 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
-- Create SP_GetSafetyRuleId stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetSafetyRuleId]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetSafetyRuleId]
GO

CREATE PROCEDURE [dbo].[SP_GetSafetyRuleId]
(
    @IdSafetyRule INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT accomplishment
			, auditId
			, complianceMetric
			, complianceParameter
			, policyCode
			, policyName

        FROM dbo.SafetyRule
        where Id = @IdSafetyRule;
END
GO

PRINT 'Procedure dbo.SP_GetSafetyRuleId created';
GO

/******************************************************************************
**				 Name: SP_GetSafetyRule										 **
**				 Desc: Get all SafetyRule table								 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
-- Create SP_GetSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetSafetyRule]')
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GetSafetyRule]
GO

CREATE PROCEDURE [dbo].[SP_GetSafetyRule]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT accomplishment
			,auditId
			,complianceMetric
			,complianceParameter
			,policyCode
			,policyName

        FROM dbo.SafetyRule
END
GO

PRINT 'Procedure dbo.SP_GetSafetyRule created';
GO

/******************************************************************************
**				 Name: SP_InsertTypeEvent									 **
**				 Desc: Insert TypeEvent record								 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertTypeEvent]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertTypeEvent]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertTypeEvent]
(
	@typeEvent VARCHAR(10)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[TypeEvent](typeEvent)
	VALUES (@typeEvent);
	SELECT @@IDENTITY AS NewTypeEventId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertTypeEvent] created';
GO

/******************************************************************************
**				 Name: SP_UpdateTypeEvent									 **
**				 Desc: Update TypeEvent record								 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateTypeEvent]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateTypeEvent];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateTypeEvent]
(
	@id INT,
	@typeEvent VARCHAR(10)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[TypeEvent]
	SET updated_on = GETDATE()
		,typeEvent = @typeEvent
	WHERE id = @id;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT TypeEvent
		FROM [dbo].[TypeEvent] 
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateTypeEvent] created';
GO

/******************************************************************************
**				 Name: SP_DeleteTypeEvent									 **
**				 Desc: Delete TypeEvent record								 **
**				 Autor: Veruzka Onofre   									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteTypeEvent]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteTypeEvent];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteTypeEvent]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[TypeEvent]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteTypeEvent] created';
GO

/******************************************************************************
**				 Name: SP_GetTypeEventId									 **
**				 Desc: Get TypeEvent by Id table							 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetTypeEventId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetTypeEventId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetTypeEventId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT TypeEvent
    FROM [dbo].[TypeEvent]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_GetTypeEventId] created';
GO

/******************************************************************************
**				 Name: SP_GetTypeEvent										 **
**				 Desc: Get TypeEvent table									 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetTypeEvent]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetTypeEvent];
END
GO
CREATE PROCEDURE [dbo].[SP_GetTypeEvent]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT typeEvent
    FROM [dbo].[TypeEvent];
END
GO
PRINT 'Procedure [dbo].[SP_GetTypeEvent] created';
GO

/******************************************************************************
**				 Name: SP_InsertInjuryType									 **
**				 Desc: Insert InjuryType record								 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertInjuryType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertInjuryType]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertInjuryType]
(
	@injuryType VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[InjuryType](injuryType)
	VALUES (@injuryType);
	SELECT @@IDENTITY AS NewInjuryTypeId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertInjuryType] created';
GO

/******************************************************************************
**				 Name: SP_UpdateInjuryType									 **
**				 Desc: Update InjuryType record								 **
**				 Autor: Veruzka Onofre										 **	
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateInjuryType]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateInjuryType];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateInjuryType]
(
	@id INT,
	@injuryType VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[InjuryType]
	SET updated_on = GETDATE()
		,injuryType = @injuryType
	WHERE id = @id;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT InjuryType
		FROM [dbo].[InjuryType] 
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateInjuryType] created';
GO

/******************************************************************************
**				 Name: SP_DeleteInjuryType									 **
**				 Desc: Delete InjuryType record								 **
**				 Autor: Veruzka Onofre										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteInjuryType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteInjuryType];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteInjuryType]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[InjuryType]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteInjuryType] created';
GO

/******************************************************************************
**				 Name: SP_GetInjuryTypeId									 **
**				 Desc: Get InjuryType by Id table							 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetInjuryTypeId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetInjuryTypeId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetInjuryTypeId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT InjuryType
    FROM [dbo].[InjuryType]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_GetInjuryTypeId] created';
GO

/******************************************************************************
**				 Name: SP_GetInjuryType										 **
**				 Desc: Get InjuryType table									 **
**				 Autor: Veruzka Onofre       								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetInjuryType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetInjuryType];
END
GO
CREATE PROCEDURE [dbo].[SP_GetInjuryType]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT injuryType
    FROM [dbo].[InjuryType];
END
GO
PRINT 'Procedure [dbo].[SP_GetInjuryType] created';
GO

/******************************************************************************
**				 Name: SP_InsertInjuryPart									 **
**				 Desc: Insert InjuryPart record								 **
**				 Autor: Veruzka Onofre  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertInjuryPart]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertInjuryPart]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertInjuryPart]
(
	@injuryPart VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[InjuryPart](injuryPart)
	VALUES (@InjuryPart);
	SELECT @@IDENTITY AS NewInjuryPartId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertInjuryPart] created';
GO

/******************************************************************************
**				 Name: SP_UpdateInjuryPart									 **
**				 Desc: Update InjuryPart record								 **
**				 Autor: Veruzka Onofre   									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateInjuryPart]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateInjuryPart];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateInjuryPart]
(
	@id INT,
	@injuryPart VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[InjuryPart]
	SET updated_on = GETDATE()
		,injuryPart = @injuryPart
	WHERE id = @id;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT InjuryPart
		FROM [dbo].[InjuryPart] 
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateInjuryPart] created';
GO

/******************************************************************************
**				 Name: SP_DeleteInjuryPart									 **
**				 Desc: Delete InjuryPart record								 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteInjuryPart]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteInjuryPart];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteInjuryPart]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[InjuryPart]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteInjuryPart] created';
GO

/******************************************************************************
**				 Name: SP_GetInjuryPartId									 **
**				 Desc: Get InjuryPart by Id table							 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetInjuryPartId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetInjuryPartId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetInjuryPartId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT InjuryPart
    FROM [dbo].[InjuryPart]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_GetInjuryPartId] created';
GO

/******************************************************************************
**				 Name: SP_GetInjuryPart										 **
**				 Desc: Get InjuryPart table									 **
**				 Autor: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetInjuryPart]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetInjuryPart];
END
GO
CREATE PROCEDURE [dbo].[SP_GetInjuryPart]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT injuryPart
    FROM [dbo].[InjuryPart];
END
GO
PRINT 'Procedure [dbo].[SP_GetInjuryPart] created';
GO

/******************************************************************************
**				 Name: SP_InsertEventuality									 **
**				 Desc: Insert Eventuality record							 **
**				 Autor: Alain Quinonez  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertEventuality]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertEventuality]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertEventuality]
(
	@dateEvent DATE,
	@description VARCHAR(250),
	@typeEvent_id INT,
	@injuryType_id INT,
	@injuryPart_id INT,
	@employee_id INT,
	@projectArea_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[Eventuality]([created_on],
									dateEvent, 
									[description], 
									typeEvent_id, 
									injuryType_id, 
									injuryPart_id, 
									employee_id, 
									projectArea_id)
	VALUES (GETDATE(),
			@dateEvent,
			@description,
			@typeEvent_id,
			@injuryType_id,
			@injuryPart_id,
			@employee_id,
			@projectArea_id);
	SELECT @@IDENTITY AS NewEventualityId;
END
GO
PRINT 'Procedure [dbo].[SP_InsertEventuality] created';
GO

/******************************************************************************
**				 Name: SP_UpdateEventuality									 **
**				 Desc: Update Eventuality record							 **
**				 Autor: Alain Quinonez   									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateEventuality]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateEventuality];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateEventuality]
(
	@id INT,
	@dateEvent DATE,
	@description VARCHAR(250),
	@typeEvent_id INT,
	@injuryType_id INT,
	@injuryPart_id INT,
	@employee_id INT,
	@projectArea_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[Eventuality]
	SET updated_on = GETDATE()
		,dateEvent = @dateEvent
		,[description] = @description
		,typeEvent_id = @typeEvent_id
		,injuryType_id = @injuryType_id
		,injuryPart_id = @injuryPart_id
		,employee_id = @employee_id
		,projectArea_id = @projectArea_id
	WHERE id = @id;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT dateEvent,
				[description],
				typeEvent_id,
				injuryType_id,
				injuryPart_id,
				employee_id,
				projectArea_id
		FROM [dbo].[Eventuality] 
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedure [dbo].[SP_UpdateEventuality] created';
GO

/******************************************************************************
**				 Name: SP_DeleteEventuality									 **
**				 Desc: Delete Eventuality record							 **
**				 Autor: Alain Quinonez   									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteEventuality]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteEventuality];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteEventuality]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Eventuality]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteEventuality] created';
GO

/******************************************************************************
**				 Name: SP_GetEventualityId									 **
**				 Desc: Get Eventuality by Id table							 **
**				 Autor: Alain Quinonez  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetEventualityId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetEventualityId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetEventualityId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT dateEvent,
			[description],
			typeEvent_id,
			injuryType_id,
			injuryPart_id,
			employee_id,
			projectArea_id
    FROM [dbo].[Eventuality]
	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_GetEventualityId] created';
GO

/******************************************************************************
**				 Name: SP_GetEventuality									 **
**				 Desc: Get Eventuality table								 **
**				 Autor: Alain Quinonez  									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetEventuality]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetEventuality];
END
GO
CREATE PROCEDURE [dbo].[SP_GetEventuality]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT 
			even.id,
			even.dateEvent,
			even.[description],
			tEven.typeEvent,
			injT.injuryType,
			injP.injuryPart,
			employee = emp.Last_Name + ' ' + emp.First_Name,
			projectArea_id
    FROM [dbo].[Eventuality] even
	INNER JOIN [dbo].[TypeEvent] tEven
	ON(even.typeEvent_id = tEven.id)
	INNER JOIN [dbo].[InjuryType] injT
	ON(even.injuryType_id = injT.id)
	INNER JOIN [dbo].[InjuryPart] injP
	ON(even.injuryPart_id = injP.id)
	INNER JOIN [dbo].[Employee] emp
	ON(even.employee_id = emp.id);
END
GO
PRINT 'Procedure [dbo].[SP_GetEventuality] created';
GO

PRINT 'Start of Script Procedure for table type_contract....';
GO


/******************************************************************************
--				 Name: SP_insertTypeContract										 
--				 Desc: Insert Register type_contract table							 
--				 autor: Alain Quinonez							 
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects  
		   WHERE object_id = OBJECT_ID(N'dbo.SP_insertTypeContract') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_insertTypeContract
END
GO
CREATE PROCEDURE dbo.SP_insertTypeContract (@type_contract VARCHAR(10), @description VARCHAR(50) ) AS
SET XACT_ABORT ON; 
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.type_contract (created_on, description ,type_contract)
	VALUES (GETDATE(),@description ,@type_contract);
	SELECT @@IDENTITY AS NewType_contractId;
END
GO

PRINT 'Procedure SP_insertTypeContract  created';
GO
/******************************************************************************
--				 Name: SP_updateTypeContract										 
--				 Desc: Update Register type_contract table							 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_updateTypeContract]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_updateTypeContract]
END
GO
CREATE PROCEDURE [dbo].[SP_updateTypeContract]
(
	@idTypeContract int,
	@type_contract VARCHAR(50), 
	@description VARCHAR(300)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[type_contract]
		SET updated_on = GETDATE()
		,[type_contract] = @type_contract
		,[description] = @description

	WHERE id = @idTypeContract;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT [type_contract]
			  ,[description]
		FROM [dbo].[type_contract] 
		WHERE id = @idTypeContract;
	END
END
GO
PRINT 'Procedure [dbo].[SP_updateTypeContract] created';
GO

/******************************************************************************
--				 Name: SP_deleteTypeContractById										 
--				 Desc: Delete Register type_contract table							 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_deleteTypeContractById') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_deleteTypeContractById;
END
GO
CREATE PROCEDURE dbo.SP_deleteTypeContractById ( @idTypeContract INT) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.type_contract
	WHERE id = @idTypeContract;
END
GO
PRINT 'Procedure dbo.SP_deleteTypeContractById created';
GO

/******************************************************************************
--				 Name: SP_getTypeContractById										 
--				 Desc: Get register type_contract by id							 
--				 autor: Veruzka Onofre							 
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_getTypeContractById') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getTypeContractById;
END
GO
CREATE PROCEDURE dbo.SP_getTypeContractById (@idTypeContract INT) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
	SELECT type_contract,description
    FROM dbo.type_contract
	WHERE id = @idTypeContract;
END
GO
PRINT 'Procedure dbo.SP_getTypeContractById created';
GO

/******************************************************************************
--				 Name: SP_getTypeContractTable										 
--				 Desc: Get Register type_contract table							 
--				 autor: Veruzka Onofre						 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_getTypeContractTable') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getTypeContractTable;
END
GO
CREATE PROCEDURE dbo.SP_getTypeContractTable AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT type_contract ,description
    FROM dbo.type_contract;
END
GO
PRINT 'Procedure dbo.SP_getTypeContractTable created';
GO


PRINT 'Start of Script Procedure for table contract ....';
GO

/******************************************************************************
--				 Name: SP_insertContractTable										 
--				 Desc: Insert Register type_contract table							 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_insertContractTable') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_insertContractTable
END
GO
CREATE PROCEDURE dbo.SP_insertContractTable(@contract_amount  VARCHAR(9) ,
												@contract_code    VARCHAR(10),
												@end_date         DATETIME ,
												@init_date        DATETIME ,
												@payment_type     VARCHAR(20) ,
												@employee_id 	 INT,    
												@position_id  	 INT,
												@project_id       INT,
												@type_contract_id INT ) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
INSERT INTO dbo.contract ( created_on,
					   contract_amount,
					   contract_code,
					   end_date,
					   init_date,
					   payment_type,
					   employee_id,
					   position_id,
					   project_id,
					   type_contract_id) 
VALUES ( GETDATE(),
		@contract_amount ,
		@contract_code ,
		@end_date ,
		@init_date ,
		@payment_type ,
		@employee_id,    
		@position_id ,
		@project_id ,
		@type_contract_id );
	SELECT @@IDENTITY AS NewContractId;
END
GO
PRINT 'Procedure dbo.SP_insertContractTable created';
GO

/******************************************************************************
--				 Name: SP_updateContractTable										 
--				 Desc: Update Register contract table							 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'dbo.SP_updateContractTable') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_updateContractTable;
END
GO
CREATE PROCEDURE dbo.SP_updateContractTable ( @idContract INT,
											  @contract_amount  VARCHAR(9) ,
											  @contract_code    VARCHAR(10),
											  @end_date         DATETIME ,
											  @init_date        DATETIME ,
											  @payment_type     VARCHAR(20) ,
											  @employee_id 	 INT,    
											  @position_id  	 INT,
											  @project_id       INT,
											  @type_contract_id INT ) AS

SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE dbo.contract
	SET updated_On = GETDATE(),
		contract_amount = @contract_amount,
		contract_code = @contract_code,
		end_date = @end_date ,
		init_date = @init_date ,
		payment_type = @payment_type ,
		employee_id = @employee_id ,
		position_id = @position_id ,
		project_id = @project_id ,
		type_contract_id = @type_contract_id  
	WHERE id = @idContract;

	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT contract_code
		FROM dbo.contract
		WHERE id = @idContract;
	 END
END
GO
PRINT 'Procedure dbo.SP_updateContractTable created';
GO

/******************************************************************************
--				 Name: SP_deleteContractById										 
--				 Desc: Delete Register contract table by id						 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_deleteContractById') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_deleteContractById;
END
GO
CREATE PROCEDURE dbo.SP_deleteContractById (@idContract INT ) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.contract
	WHERE id = @idContract;
END
GO
PRINT 'Procedure dbo.SP_deleteContractById created';
GO

/******************************************************************************
--				 Name: SP_getContractById										 
--				 Desc: Get Register contract by id						 
--				 autor: Veruzka Onofre							 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_getContractById]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getContractById;
END
GO
CREATE PROCEDURE dbo.SP_getContractById (@idContract INT) AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id,
		   contract_amount,
		   contract_code,
		   end_date,
		   init_date,
		   payment_type,
		   employee_id,
		   position_id,
		   project_id,
		   type_contract_id
    FROM dbo.contract
	WHERE id = @idContract;
END
GO
PRINT 'Procedure dbo.SP_getContractById created';
GO
/******************************************************************************
--				 Name: SP_getContractTable										 
--				 Desc: Get Register contract table						 
--				 autor: Veruzka Onofre						 
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'dbo.SP_getContractTable') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.SP_getContractTable;
END
GO
CREATE PROCEDURE dbo.SP_getContractTable
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id,
		   created_on,
		   contract_amount,
		   contract_code,
		   end_date,
		   init_date,
		   payment_type,
		   employee_id,
		   position_id,
		   project_id,
		   type_contract_id
    FROM dbo.contract;
END
GO
PRINT 'Procedure dbo.SP_getContractTable created';
GO



/******************************************************************************
**				 Name: SP_InsertProject										 **
**				 Desc: Insert new register in Project table				     **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertProject]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertProject]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertProject]
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

	INSERT INTO [dbo].[Project](name, [description], date_start, date_end,createBy,createDate,updatedBy,updateDate)
	VALUES (@name,
			@description,
			@date_start,
			@date_end,
			DEFAULT ,
            DEFAULT ,
            DEFAULT ,
            DEFAULT 
			);
	SELECT @@IDENTITY AS IdNewProject;
	PRINT @@IDENTITY
END
GO
PRINT 'Procedure [dbo].[SP_InsertProject] created';
GO


/******************************************************************************
**				 Name: SP_UpdateProject										 **
**				 Desc: Update Register in Project table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateProject]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateProject];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateProject]
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

	UPDATE  [dbo].[Project]
	SET
				[name]=@name,
			    [description] = @description,
				[date_start]= @date_start,
				[date_end] = @date_end
	WHERE [Id] = @id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateProject] created';
GO

/******************************************************************************
**				 Name: SP_DeleteProject										 **
**				 Desc: Delete a Register in the Project table   			 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteProject]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteProject];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteProject]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Project]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteProject] created';
GO

/******************************************************************************
**				 Name: SP_GetProjectId											 **
**				 Desc: Get Project by Id table									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetProjectId]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetProjectId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetProjectId]
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
  FROM [dbo].[Project]
  WHERE [Id] = @id
	
END
GO
PRINT 'Procedure [dbo].[SP_GetProjectId] created';
GO
/******************************************************************************
**				 Name: SP_GetProject										 **
**				 Desc: Get All Project	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetProject]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetProject];
END
GO
CREATE PROCEDURE [dbo].[SP_GetProject]
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
    FROM [dbo].[Project];
END
GO
PRINT 'Procedure [dbo].[SP_GetProject] created';
GO

/******************************************************************************
**				 Name: SP_InsertProject_Area								 **
**				 Desc: Insert new register in ProjectArea table				 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_InsertProject_Area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_InsertProject_Area]
END
GO
CREATE PROCEDURE [dbo].[SP_InsertProject_Area]
(
	@project_id INT,
	@area_id INT, 
	@estado VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Project_Area]([project_id],[area_id],[estado])
	VALUES (@project_id,
			@area_id,
			@estado
			);
	SELECT @@IDENTITY AS IdNewProject_Area;
	PRINT @@IDENTITY
END
GO
PRINT 'Procedure [dbo].[SP_InsertProject_Area] created';
GO

/******************************************************************************
**				 Name: SP_UpdateProject_Area								 **
**				 Desc: Update Register in Project table						 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateProject_Area]') 
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateProject_Area];
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateProject_Area]
(
    @id INT,
	@project_id INT,
	@area_id INT,
	@estado VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE  [dbo].[Project_Area]
	SET
				[project_id]= @project_id,
			    [area_id] = @area_id,
				[estado]= @estado
	WHERE [Id] = @id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateProject_Area] created';
GO

/******************************************************************************
**				 Name: SP_DeleteProject_Area								 **
**				 Desc: Delete a Register in the Project_Area table   		 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteProject_Area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteProject_Area];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteProject_Area]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Project_Area]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteProject_Area] created';
GO


use Care4You;
/******************************************************************************
**				 Name: SP_GetProjectAreaId									 **
**				 Desc: Get Project_Area by Id table							 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetProjectAreaId]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetProjectAreaId];
END
GO
CREATE PROCEDURE [dbo].[SP_GetProjectAreaId]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT     [Id],
			   [project_id],
			   [area_id],
			   [estado]
  FROM [dbo].[Project_Area]
  WHERE [Id] = @id

END
GO
PRINT 'Procedure [dbo].[SP_GetProjectAreaId] created';
GO
/******************************************************************************
**				 Name: SP_GetProject_Area									 **
**				 Desc: Get Project_Area	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetProject_Area]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetProject_Area];
END
GO
CREATE PROCEDURE [dbo].[SP_GetProject_Area]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT     [Id],
			   [project_id],
			   [area_id],
			   [estado]
    FROM [dbo].[Project_Area];
END
GO
PRINT 'Procedure [dbo].[SP_GetProject_Area] created';
GO



/******************************************************************************
**				 Name: SP_GetItem									 **
**				 Desc: Get Item	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetItem];
END
GO
CREATE PROCEDURE [dbo].[SP_GetItem]
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
      ,[CategoryID]
      ,[SubCategoryID]
      ,[ItemTypeID]
  FROM [dbo].[Item]
END
GO
PRINT 'Procedure [dbo].[SP_GetItem] created';
GO

PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_GetItemType									 **
**				 Desc: Get ItemType	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetItemType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetItemType];
END
GO
CREATE PROCEDURE [dbo].[SP_GetItemType]
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
  FROM [dbo].[ItemType]
END
GO
PRINT 'Procedure [dbo].[SP_GetItemType] created';
GO

PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_GetCategory			  						 **
**				 Desc: Get Category	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetCategory];
END
GO
CREATE PROCEDURE [dbo].[SP_GetCategory]
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
      ,[Rowversion]
      ,[SubCategoryID]
  FROM [dbo].[Category]
END
GO
PRINT 'Procedure [dbo].[SP_GetCategory] created';
GO

PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_GetSubCategory									 **
**				 Desc: Get SubCategory	table								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetSubCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_GetSubCategory];
END
GO
CREATE PROCEDURE [dbo].[SP_GetSubCategory]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [Id]
      ,[create_On]
      ,[update_On]
      ,[version]
      ,[name]
      ,[CategoryID]
      ,[description]
      ,[Rowversion]
  FROM [dbo].[SubCategory]
END
GO
PRINT 'Procedure [dbo].[SP_GetSubCategory] created';
GO

PRINT 'End of Script Execution....';
GO


/******************************************************************************
**				 Name: SP_DeleteItemType									 **
**				 Desc: Delete a Register in the Item table   				 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteItemType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteItemType];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteItemType]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[ItemType]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteItemType] created';
GO

PRINT 'End of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_DeleteCategory							         **
**				 Desc: Delete a Register in the Category table   			 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteCategory];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteCategory]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Category]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteCategory] created';
GO
PRINT 'End of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_DeleteSubCategory									 **
**				 Desc: Delete a Register in the SubCategory table   		 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteSubCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteSubCategory];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteSubCategory]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[SubCategory]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteSubCategory] created';
GO
PRINT 'End of Script Execution....';
GO
/******************************************************************************
**				 Name: SP_DeleteItem										 **
**				 Desc: Delete a Register in the Item table   				 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_DeleteItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_DeleteItem];
END
GO
CREATE PROCEDURE [dbo].[SP_DeleteItem]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[Item]
	WHERE Id = @id;
END
GO
PRINT 'Procedure [dbo].[SP_DeleteItem] created';
GO
PRINT 'End of Script Execution....';
GO

/******************************************************************************
**				 Name: SP_UpdateItem   								         **
**				 Desc: update table Item							  	     **
**				 Autor: Boris Perez		   								 **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateItem]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateItem]
(
	@Id int,
	@version VARCHAR(15),
	@name VARCHAR(50),
	@description VARCHAR(50),
	@SubCategoryID VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[Item]
   SET [create_On] = GETDATE()
      ,[update_On] = GETDATE()
      ,[version] = @version
      ,[name] = @name
      ,[description] = @description
      ,[SubCategoryID] = @SubCategoryID
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateItem] created';
GO


/******************************************************************************
**				 Name: SP_UpdateItemType   									 **
**				 Desc: update table ItemType								 **
**				 Autor: Boris Perez		   							     **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateItemType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateItemType]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateItemType]
(
	@Id int,
	@version VARCHAR(15),
	@name VARCHAR(50),
	@description VARCHAR(50),
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[ItemType]
   SET [create_On] = GETDATE()
      ,[update_On] = GETDATE()
      ,[version] = @version
      ,[name] = @name
      ,[description] = @description
      ,[ModifiedBy] = @ModifiedBy
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateItemType] created';
GO

/******************************************************************************
**				 Name: SP_UpdateCategory  									 **
**				 Desc: update table ItemType								 **
**				 Autor: Boris Perez		   								 **
*******************************************************************************/
USE Care4You
GO
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateCategory]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateCategory]
(
	@Id int,
	@version VARCHAR(15),
	@name VARCHAR(50),
	@description VARCHAR(50),
	@SubCategoryID VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[Category]
   SET [create_On] = GETDATE()
      ,[update_On] = GETDATE()
      ,[version] = @version
      ,[name] = @name
      ,[description] = @description
      ,[SubCategoryID] = @SubCategoryID
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateCategory] created';
GO

/******************************************************************************
**				 Name: SP_UpdateSubCategory  						         **
**				 Desc: update table SubCategory								 **
**				 Autor: Boris Perez		   				  			     **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateSubCategory]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SP_UpdateSubCategory]
END
GO
CREATE PROCEDURE [dbo].[SP_UpdateSubCategory]
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

	UPDATE [dbo].[SubCategory]
   SET [create_On] = GETDATE()
      ,[update_On] = GETDATE()
      ,[version] = @version
      ,[name] = @name
      ,[description] = @description
		WHERE [Id] = @Id;
END
GO
PRINT 'Procedure [dbo].[SP_UpdateSubCategory] created';
GO

