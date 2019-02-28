/******************************************************************************
**				   	        CREATION OF TRIGGERS		   					 **
*******************************************************************************/
/******************************************************************************
**  Author: Alain Quinonez													 **
**  Date: 02/08/2019														 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************
**   Date:				 Author:                         Description:		 **
** --------			-------------        ----------------------------------- **
** 02/08/2019		Boris Perez				Initial version					 **
** 02/08/2019       Alain Quinonez          Adding Triggers for Employee     **
** 02/08/2019       Veruzka Onofre			Adding Triggers for Audit table  **
** 02/08/2019       Ricardo Veizaga			Added trigger for Eventuality table
******************************************************************************/
USE Care4You
GO
PRINT 'Start of Script Execution....';
GO

/******************************************************************************
**				 Name: TG_Training(Audit)_InsertUpdate						 **
**				 Desc: Audit History for Training table						 **
**				 Author: Boris Perez									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_Training(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_Training(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_Training(Audit)_InsertUpdate]
ON [dbo].[Training]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Training', 
           ColumnName   = 'name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[name],'N/A'), 
           NewValue     = i.[name],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
  END
END
GO
PRINT 'Trigger [TG_Training(Audit)_InsertUpdate] created';
GO

/******************************************************************************
**				 Name: TG_Position(Audit)_InsertUpdate						 **
**				 Desc: Audit History for Position table						 **
**				 Author: Boris Perez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_Position(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_Position(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_Position(Audit)_InsertUpdate]
ON [dbo].[Position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Position', 
           ColumnName   = 'name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[name],'N/A'), 
           NewValue     = i.[name],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
  END
END
GO
PRINT 'Trigger [TG_Position(Audit)_InsertUpdate] created';
GO
/******************************************************************************
**				 Name: TG_EmployeeTraining(Audit)_InsertUpdate				 **
**				 Desc: Audit History for Employee_Training table			 **
**				 Author: Boris Perez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_EmployeeTraining(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_EmployeeTraining(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_EmployeeTraining(Audit)_InsertUpdate]
ON [dbo].[Employee_Training]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(employee_id) OR UPDATE(training_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee_Training', 
           ColumnName   = 'employee_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[employee_id]),'N/A'), 
           NewValue     = i.[employee_id],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.employee_id, '') != ISNULL(i.employee_id, '');
  END
END
GO
PRINT 'Trigger [TG_EmployeeTraining(Audit)_InsertUpdate] created';
GO

/******************************************************************************
**				 Name: TG_EmployeeTraining(Audit)_Delete					 **
**				 Desc: Audit History for Employee_Training table			 **
**				 Author: Boris Perez									 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_EmployeeTraining(Audit)_Delete]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_EmployeeTraining(Audit)_Delete]
END
GO
CREATE TRIGGER [dbo].[TG_EmployeeTraining(Audit)_Delete]
ON [dbo].[Employee_Training]
FOR DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee_Training', 
           ColumnName   = 'employee_id',
           ID1          = d.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[employee_id]),'N/A'), 
           NewValue     = 'Delete',
           ModifiedBy   = ISNULL(d.ModifiedBy,100)
    FROM deleted d 
END
GO
PRINT 'Trigger [TG_EmployeeTraining(Audit)_Delete] created';

GO
/******************************************************************************
**  Name: TG_Employee(Audit)_Update											 **
**  Desc: Audit History for Empleado table									 **
**	Author: Ricardo Veizaga													 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_EmplooyeeFirstName(Audit)_Update]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_EmplooyeeFirstName(Audit)_Update]
END
GO

CREATE TRIGGER [dbo].[TG_EmplooyeeFirstName(Audit)_Update]
ON [dbo].[Employee]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(First_Name)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](TableName, 
									 ColumnName, 
									 Id, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'First_Name',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[First_Name],'N/A'), 
           NewValue     = i.[First_Name],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.First_Name, '') != ISNULL(i.First_Name, '');
  END
END
  GO
PRINT 'Trigger [TG_EmplooyeeFirstName(Audit)_Update] created';
GO

/******************************************************************************
**  Name: [TG_EmployeeDni(Audit)_Update]									 **
**  Desc: Audit History for Empleado table									 **
**	Author: Ricardo Veizaga													 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'TG_EmployeeDni(Audit)_Update') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_EmployeeDni(Audit)_Update]
END
GO
CREATE TRIGGER [dbo].[TG_EmployeeDni(Audit)_Update]
ON [dbo].[Employee]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Dni)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'Dni',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[Dni],'N/A'), 
           NewValue     = i.[Dni],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.Dni, '') != ISNULL(i.Dni, '');
  END
END
GO
PRINT 'Trigger [TG_EmployeeDni(Audit)_Update] created';
GO

/******************************************************************************
**  Name: [TG_EmployeeAddress(Audit)_Update]								 **
**  Desc: Audit History for Empleado table									 **
**	Author: Ricardo Veizaga												 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'TG_EmployeeAddress(Audit)_Update') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_EmployeeAddress(Audit)_Update]
END
GO
CREATE TRIGGER [dbo].[TG_EmployeeAddress(Audit)_Update]
ON [dbo].[Employee]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Address)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'Address',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[Address],'N/A'), 
           NewValue     = i.[Address],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.[Address], '') != ISNULL(i.[Address], '');
  END
END
GO
PRINT 'Trigger [TG_EmployeeAddress(Audit)_Update] created';
GO


/******************************************************************************
**  Nombre: TG_Audit(Audit)_InsertUpdate									 **
**  Description: Audit History for Audit table								 **
**	Author: Ricardo Veizaga													 **
*******************************************************************************
**                            Change History								 **
*******************************************************************************/


IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Audit(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Audit(Audit)_InsertUpdate];
  PRINT 'Trigger TG_Audit(Audit)_InsertUpdate removed!';
END
GO

CREATE TRIGGER [dbo].[TG_Audit(Audit)_InsertUpdate]
ON [dbo].[Audit]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditCode    *
  **********************/
  IF UPDATE(AuditCode)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditCode',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditCode,'N/A'),
           NewValue     = i.auditCode,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditCode, '') != ISNULL(i.auditCode, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditCriteria*
  **********************/
  IF UPDATE(AuditCriteria)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditCriteria',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditCriteria,'N/A'),
           NewValue     = i.auditCriteria,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditCriteria, '') != ISNULL(i.auditCriteria, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditName    *
  **********************/
  IF UPDATE(AuditName)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditName',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditName,'N/A'),
           NewValue     = i.auditName,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditName, '') != ISNULL(i.auditName, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditObjective*
  **********************/
  IF UPDATE(AuditObjective)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditObjective',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditObjective,'N/A'),
           NewValue     = i.auditObjective,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditObjective, '') != ISNULL(i.auditObjective, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditScope   *
  **********************/
  IF UPDATE(AuditScope)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditScope',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditScope,'N/A'),
           NewValue     = i.auditScope,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditScope, '') != ISNULL(i.auditScope, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditType    *
  **********************/
  IF UPDATE(AuditType)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditType',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.auditType,'N/A'),
           NewValue     = i.auditType,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditType, '') != ISNULL(i.auditType, '');
  END


  /**********************
  * TABLE: Audit	    *
  * FIELD: AuditPeriodicity*
  **********************/
  IF UPDATE(auditPeriodicity)
  BEGIN
    INSERT INTO [dbo].[AuditHistory](tableName,
										columnName,
										iD,
										Date,
										oldValue,
										newValue,
										modifiedBy)
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditPeriodicity',
           ID1          = i.id,
		   Date         = @CurrDate,
           OldValue     = ISNULL(d.AuditPeriodicity,'N/A'),
           NewValue     = i.AuditPeriodicity,
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditPeriodicity, '') != ISNULL(i.auditPeriodicity, '');
  END
END;
GO
PRINT 'Trigger TG_Audit(Audit)_InsertUpdate created!';


-- »»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»
--				 Name: TG_auditoryContract_DeleteUpdate
--				 Desc: Ausditory History for contract table
--				 Author: Alain Quinonez
-- ««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'dbo.TG_auditoryContract_DeleteUpdate')
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER dbo.TG_auditoryContract_DeleteUpdate
END
GO
CREATE TRIGGER dbo.TG_auditoryContract_DeleteUpdate ON dbo.contract
FOR UPDATE, DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @currDate DATETIME = GETUTCDATE();

  IF UPDATE(contract_code) OR UPDATE(contract_amount) OR UPDATE(init_date) OR UPDATE(end_date)
  BEGIN
    INSERT INTO dbo.[AuditHistory](TableName,
                                       ColumnName,
                                       ID,
                                       Date,
                                       OldValue,
                                       NewValue,
                                       ModifiedBy)
    SELECT TableName    = 'contract',
           ColumnName   = 'contract_code',
           ID1          = i.id,
           Date         = @currDate,
           OldValue     = ISNULL(d.[contract_code],'N/A'),
           NewValue     = i.[contract_code],
           ModifiedBy   = ISNULL(i.ModifiedBy,100)
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.contract_code, '') != ISNULL(i.contract_code, '');
  END
END
GO
PRINT 'Trigger TG_auditoryContract_DeleteUpdate created';
GO

/******************************************************************************
**				 Name: TG_ProjectName(Audit)_InsertUpdate					 **
**				 Desc: Audit History for Project table						 **
**               Field: name                                                 **
**				 Author: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_ProjectName(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_ProjectName(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_ProjectName(Audit)_InsertUpdate]
ON [dbo].[Project]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Project', 
           ColumnName   = 'name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[name],'N/A'), 
           NewValue     = i.[name],
           ModifiedBy   = ISNULL(i.updatedBy,100)   
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
  END
END
GO
PRINT 'Trigger [TG_ProjectName(Audit)_InsertUpdate] created';
GO


/******************************************************************************
**				 Name: TG_Project(Audit)_InsertUpdate						 **
**				 Desc: Audit History for Project table						 **
**               Field: description                                          **
**				 Author: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_ProjectDescription(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_ProjectDescription(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_ProjectDescription(Audit)_InsertUpdate]
ON [dbo].[Project]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Project', 
           ColumnName   = 'description',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[description],'N/A'), 
           NewValue     = i.[description],
           ModifiedBy   = ISNULL(i.updatedBy,100)     
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
  END
END
GO
PRINT 'Trigger [TG_ProjectDescription(Audit)_InsertUpdate] created';
GO

/******************************************************************************
**				 Name: TG_ProjectDateStart(Audit)_InsertUpdate				 **
**				 Desc: Audit History for Project table						 **
**               Field: date_start                                           **
**				 Author: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_ProjectDateStart(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_ProjectDateStart(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_ProjectDateStart(Audit)_InsertUpdate]
ON [dbo].[Project]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(date_start)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Project', 
           ColumnName   = 'date_start',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[date_start]),'N/A'), 
           NewValue     = i.[date_start],
           ModifiedBy   =  ISNULL(i.updatedBy,100)       
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.date_start, '') != ISNULL(i.date_start, '');
  END
END
GO
PRINT 'Trigger [TG_ProjectDateStart(Audit)_InsertUpdate] created';
GO


/******************************************************************************
**				 Name: TG_ProjectDateEnd(Audit)_InsertUpdate				 **
**				 Desc: Audit History for Project table						 **
**               Field: date_end                                             **
**				 Author: Alain Quinonez										 **
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_ProjectDateEnd(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_ProjectDateEnd(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_ProjectDateEnd(Audit)_InsertUpdate]
ON [dbo].[Project]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(date_end)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Project', 
           ColumnName   = 'date_end',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[date_end]),'N/A'), 
           NewValue     = i.[date_end],
           ModifiedBy   =  ISNULL(i.updatedBy,100)       
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.date_end, '') != ISNULL(i.date_end, '');
  END
END
GO
PRINT 'Trigger [TG_ProjectDateEnd(Audit)_InsertUpdate] created';
GO

/******************************************************************************
**				 Name: TG_Eventuality(Audit)_InsertUpdate					 **
**				 Desc: Audit History for Eventuality table					 **
**				 Author: Veruzka Onofre										 **
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[TG_Eventuality(Audit)_InsertUpdate]') 
		AND type in (N'TR'))
BEGIN
	DROP TRIGGER [dbo].[TG_Eventuality(Audit)_InsertUpdate]
END
GO
CREATE TRIGGER [dbo].[TG_Eventuality(Audit)_InsertUpdate]
ON [dbo].[Eventuality]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(dateEvent)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'dateEvent',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[dateEvent]),'N/A'), 
           NewValue     = i.[dateEvent],
		   ModifiedBy   = 100
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.dateEvent, '') != ISNULL(i.dateEvent, '');
  END
  IF UPDATE([description])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'description',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(d.[description],'N/A'), 
           NewValue     = i.[description],
		   ModifiedBy   = 100  
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[description], '') != ISNULL(i.[description], '');
  END
  IF UPDATE([typeEvent_id])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'typeEvent_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100),d.[typeEvent_id]),'N/A'), 
           NewValue     = i.[typeEvent_id],
		   ModifiedBy   = 100          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[typeEvent_id], '') != ISNULL(i.[typeEvent_id], '');
  END
  IF UPDATE([injuryType_id])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'injuryType_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[injuryType_id]),'N/A'), 
           NewValue     = i.[injuryType_id],
		   ModifiedBy   = 100         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[injuryType_id], '') != ISNULL(i.[injuryType_id], '');
  END
  IF UPDATE([injuryPart_id])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'injuryPart_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[injuryPart_id]),'N/A'), 
           NewValue     = i.[injuryPart_id],
		   ModifiedBy   = 100  
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[injuryPart_id], '') != ISNULL(i.[injuryPart_id], '');
  END
  IF UPDATE([employee_id])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'employee_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[employee_id]),'N/A'), 
           NewValue     = i.[employee_id],
		   ModifiedBy   = 100       
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[employee_id], '') != ISNULL(i.[employee_id], '');
  END
  IF UPDATE([projectArea_id])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Eventuality', 
           ColumnName   = 'projectArea_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = ISNULL(CONVERT(VARCHAR(100), d.[projectArea_id]),'N/A'), 
           NewValue     = i.[projectArea_id],
		   ModifiedBy   = 100         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.[projectArea_id], '') != ISNULL(i.[projectArea_id], '');
  END
END
GO
PRINT 'Trigger [TG_Eventuality(Audit)_InsertUpdate] created';
GO

PRINT 'End of Script Execution....';
GO