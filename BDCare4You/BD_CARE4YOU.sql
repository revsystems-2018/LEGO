/******************************************************************************
**  Name: Script SQL Data Base "Care4You"
**
**  Authors:	Boris Omar Pérez Santos
**				Alain Quinonez
**				Veruzka Onofre
**				Ricardo Veizaga
**				
**  Date: 02/05/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                         Description:
** --------     -------------     ---------------------------------------------
** 02/05/2019   Boris Perez			 Initial version
** 02/05/2018	Ricardo Veizaga		 Create table Work 
** 02/05/2018   Veruzka Onofre       Adding employee table
** 02/05/2018   Alain Quinonez       Adding Position and Assigned table
** 02/06/2018   Boris Perez			 Adding SafetyEquipment, , and  table
*******************************************************************************/

USE Care4You
GO

IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'ETL' ) 
    EXEC('CREATE SCHEMA [ETL] AUTHORIZATION [dbo]');
GO
/******************************************************************************
 ******************************************************************************
 **							TABLES CREATIONS								 **
 ******************************************************************************
 ******************************************************************************/

/******************************************************************************
 **							Creating the Employee Table						 **
 **							Autor: Boris Perez								 **
 ******************************************************************************/
 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') 
		       AND type in (N'U'))
 BEGIN
CREATE TABLE [dbo].[Employee](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Dni] VARCHAR(15) NOT NULL,
	[First_Name] VARCHAR(50) NOT NULL,
	[Last_Name] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	[Phone] INT NOT NULL,
	[email] VARCHAR(50) NOT NULL,
	[Job_Description] VARCHAR (50) NULL,
	
	[CreatedBy] INT NOT NULL CONSTRAINT [DF_Employee_CreatedBy]  DEFAULT ((100)),
	[CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_Employee_CreatedDate]  DEFAULT (getutcdate()),
	[ModifiedBy] INT NOT NULL CONSTRAINT [DF_Employee_ModifiedBy]  DEFAULT ((100)),
	[ModifiedDate] DATETIME NOT NULL CONSTRAINT [DF_Employee_ModifiedDate]  DEFAULT (getutcdate()),
	[Rowversion] TIMESTAMP NOT NULL,

 CONSTRAINT [PK_IdEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
 	
	PRINT 'Table Employee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END
GO
SET ANSI_PADDING OFF
GO

/******************************************************************************
 **							Creating the Assignment Table					 **
 **							Autor: Alain Quinonez							 **
 ******************************************************************************/
 SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
PRINT 'Creating the Assignment table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Assignment]') 
		       AND type in (N'U'))
 BEGIN
CREATE TABLE [dbo].[Assignment](
	[IdAssignment] [int] IDENTITY(1,1) NOT NULL,
	[SafetyEquipmentId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Rowversion] TIMESTAMP NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[IdAssignment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

	 	PRINT 'Table Assignment created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Assignment already exists into the database';
	END
GO
SET ANSI_PADDING OFF
GO


/******************************************************************************
 **							Creating the Department table					 **
 **							Autor: Veruzka Onofre							 **
 ******************************************************************************/
PRINT 'Creating the Department table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Department]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Department](
								  Id INT IDENTITY(1,1) NOT NULL
								  ,[create_On] DATETIME CONSTRAINT DF_Create_OnDepartment DEFAULT GETDATE()
								  ,[update_On] DATETIME
								  ,[version] INT CONSTRAINT DF_VersionDepartment DEFAULT 0
								  ,[code] VARCHAR(10) CONSTRAINT NN_CodeDepartment NOT NULL
								  ,[name] VARCHAR(30) CONSTRAINT NN_NameDepartment NOT NULL
								  ,[ModifiedBy] INT NOT NULL CONSTRAINT DF_ModifiedByDepartment  DEFAULT (100)
								  ,[Rowversion] TIMESTAMP NOT NULL
								  ,CONSTRAINT PK_Department PRIMARY KEY(Id ASC)
								  );
		PRINT 'Table Department created!';
	END
ELSE
	BEGIN
		PRINT 'Table Department already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the Company table						 **
 **							Autor: Veruzka Onofre							 **
 ******************************************************************************/
PRINT 'Creating the Company table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Company]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Company](
									  Id INT IDENTITY(1,1) NOT NULL
									  ,[create_On] DATETIME CONSTRAINT DF_Create_OnCompany DEFAULT GETDATE()
									  ,[update_On] DATETIME
									  ,[version] INT CONSTRAINT DF_VersionCompany DEFAULT 0
									  ,[code] VARCHAR(10) CONSTRAINT NN_CodeCompany NOT NULL
									  ,[name] VARCHAR(50) CONSTRAINT NN_NameCompany NOT NULL
									  ,[instructor] VARCHAR(50) CONSTRAINT NN_InstructorCompany NOT NULL
									  ,[Department_id] INT NOT NULL
									  ,[ModifiedBy] INT NOT NULL CONSTRAINT DF_ModifiedByCompany  DEFAULT (100)
									  ,[Rowversion] TIMESTAMP NOT NULL
									  ,CONSTRAINT PK_Company PRIMARY KEY(Id ASC)
									  );
		PRINT 'Table Company created!';
	END
ELSE
	BEGIN
		PRINT 'Table Company already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the Rules table			             **
 **							Autor: Ricardo Veizaga							 **
 ******************************************************************************/
PRINT 'Creating the Rules table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Rules]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Rules](
												Id INT IDENTITY(1,1) NOT NULL
												,[create_On] DATETIME CONSTRAINT DF_Create_OnRules DEFAULT GETDATE()
												,[update_On] DATETIME
												,[version] INT CONSTRAINT DF_VersionRules DEFAULT 0
												,[employee_id] INT NOT NULL
												,[Company_id] INT NOT NULL
												,[state] VARCHAR(10) CONSTRAINT DF_StateRules DEFAULT 'ACTIVO'
												,[ModifiedBy] INT NOT NULL CONSTRAINT DF_ModifiedByRules  DEFAULT (100)
												,[Rowversion] TIMESTAMP NOT NULL
												,CONSTRAINT PK_Rules PRIMARY KEY(Id ASC)
												);
		PRINT 'Table Rules created!';
	END
ELSE
	BEGIN
		PRINT 'Table Rules already exists into the database';
	END
GO


-- »»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»
--                             Table: Work
--                             Autor: Boris Perez
-- ««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

PRINT 'Creating the Work table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Work]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE Work (
			id               INT IDENTITY(1,1) NOT NULL ,
			created_on       DATETIME NOT NULL,
			updated_on       DATETIME,
			version          INT CONSTRAINT DF_version_Work DEFAULT 0,
			Work_amount  VARCHAR(9) NOT NULL,
			Work_code    VARCHAR(10) NOT NULL,
			end_date         DATETIME ,
			init_date        DATETIME NOT NULL,
			payment_type     VARCHAR(20) NOT NULL,
			employee_id 	 INT NOT NULL ,    
			
			Position_id       INT NOT NULL ,
			
			ModifiedBy INT,
			[Rowversion] TIMESTAMP NOT NULL,
			CONSTRAINT PK_Work PRIMARY KEY (id)
	);
	
		PRINT 'Table Work created!';
	END
 ELSE
	BEGIN
		PRINT 'Table Work already exists into the database.........';
	END
go

/******************************************************************************
 **							Creating the "Incident"						     **
 **						    Autor: Ricardo Veizaga				             **
 ******************************************************************************/

PRINT 'Creating the Incident table....';

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Incident')
)
BEGIN
	CREATE TABLE Incident(
				id INT IDENTITY(1,1) NOT NULL
				,create_On DATETIME CONSTRAINT DF_Create_OnIncident DEFAULT GETDATE()
				,update_On DATETIME
				,version INT CONSTRAINT DF_VersionIncident DEFAULT 0
				,IncidentName VARCHAR(50) NOT NULL
				,IncidentCode VARCHAR(50) NOT NULL
				,IncidentType VARCHAR(10) NOT NULL
				,IncidentScope VARCHAR(50) NOT NULL
				,IncidentObjective VARCHAR(50) NOT NULL
				,IncidentCriteria VARCHAR(50) NOT NULL
				,IncidentPeriodicity VARCHAR(10) NOT NULL
				,employeeId INT
				,DepartmentId INT NOT NULL
				,ModifiedBy INT
				,[Rowversion] TIMESTAMP NOT NULL
				CONSTRAINT PK_Incident PRIMARY KEY (id ASC)
	);

	PRINT 'Table Incident created!';
END
ELSE
 BEGIN
  PRINT 'Table Incident already exists into the database.........';
 END
GO

/******************************************************************************
 **							Creating the Position table						 **
 **						    Autor: Boris Perez		                         **
 ******************************************************************************/
 PRINT 'Creating the Position table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Position]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Position](id INT IDENTITY(1,1) NOT NULL,
	                                 name VARCHAR(250) NOT NULL,
									 [description] VARCHAR(1000) NULL, 
									 [date_start] DATE not null,
								     [date_end] DATE not null,
									 [createBy] INT NOT NULL CONSTRAINT DF_Position_createdBy DEFAULT (100),
									 [createDate] DATETIME NOT NULL CONSTRAINT DF_Position_createDate DEFAULT GETUTCDATE(),
									 [updatedBy] INT NOT NULL CONSTRAINT DF_Position_updateBy DEFAULT (100),
								     [updateDate] DATETIME NOT NULL CONSTRAINT DF_Position_updateDate DEFAULT GETUTCDATE(),
									 [Rowversion] TIMESTAMP NOT NULL,
									 CONSTRAINT PK_Position PRIMARY KEY(id ASC)
		);
		PRINT 'Table Position created!';
	END
ELSE
	BEGIN
		PRINT 'Table Position already exists into the database';
	END
GO


/******************************************************************************
 **							Creating the Assigned table					     **
 **						    Autor: Veruzka Onofre	                         **
 ******************************************************************************/
 PRINT 'Creating the Assigned table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Assigned]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE Assigned(Id INT IDENTITY(1,1) NOT NULL,
		                          Position_id INT NOT NULL,
								  Department_id INT NOT NULL,
					              estado VARCHAR(50) NOT NULL CHECK (estado IN('En curso', 'Detenido', 'Terminado')),
							      [createBy] INT NOT NULL CONSTRAINT DF_Assigned_createdBy DEFAULT (100),
							      [createDate] DATETIME NOT NULL CONSTRAINT DF_Assigned_createDate DEFAULT GETUTCDATE(),
								  [updateBy] INT NOT NULL CONSTRAINT DF_Assigned_updateBy DEFAULT (100),
								  [updateDate] DATETIME NOT NULL CONSTRAINT DF_Assigned_updateDate DEFAULT GETUTCDATE(),
								  [Rowversion] TIMESTAMP NOT NULL,
								  CONSTRAINT PK_Assigned PRIMARY KEY(Id ASC)
		);
		PRINT 'Table Assigned created!';
	END
ELSE
	BEGIN
		PRINT 'Table Assigned already exists into the database';
	END
GO


/******************************************************************************
 **							Creating the SafetyEquipment table				 **
 **						    Autor: Alain Quinonez	                         **
 ******************************************************************************/
PRINT 'Creating the SafetyEquipment table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[SafetyEquipment]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[SafetyEquipment](
									  Id INT IDENTITY(1,1) NOT NULL
									  ,[create_On] DATETIME CONSTRAINT DF_Create_OnSafetyEquipment DEFAULT GETDATE()
									  ,[update_On] DATETIME
									  ,[version] INT CONSTRAINT DF_VersionSafetyEquipment DEFAULT 0
									  ,[name] VARCHAR(30) CONSTRAINT NN_NameSafetyEquipment NOT NULL
									  ,[description] VARCHAR(500) CONSTRAINT NN_SafetyEquipmentDescription NOT NULL
									  ,[ModifiedBy] INT
									  ,[Rowversion] TIMESTAMP NOT NULL
									  ,CONSTRAINT PK_SafetyEquipment PRIMARY KEY(Id ASC)
									  );
		PRINT 'Table SafetyEquipment created!';
	END
ELSE
	BEGIN
		PRINT 'Table SafetyEquipment already exists into the database';
	END
GO

/******************************************************************************
 ******************************************************************************
 **							CREATING THE FORIGN KEY							 **
 ******************************************************************************
 ******************************************************************************/

/******************************************************************************
 **			Define the relationship between Assigment and Employee.  		 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_Assignment_Employee]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Assignment]'))
	BEGIN

		ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Employee] FOREIGN KEY([EmployeeId])
		REFERENCES [dbo].[Employee] ([Id])
    	ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Employee]
	END
GO


/******************************************************************************
 **			Define the relationship between Company and Department.  			 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Company_Department]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Company]'))
ALTER TABLE [dbo].[Company]  WITH CHECK ADD
			CONSTRAINT FK_Company_Department FOREIGN KEY (Department_id)
			REFERENCES [dbo].[Department](Id)
GO
ALTER TABLE [dbo].[Company] CHECK
			CONSTRAINT [FK_Company_Department]
GO

/******************************************************************************
 **		 Define the relationship between Rules and Company.	 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Rules_Company]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Rules]'))
ALTER TABLE [dbo].[Rules]  WITH CHECK ADD
			CONSTRAINT FK_Rules_Company FOREIGN KEY (Company_id)
			REFERENCES [dbo].[Company](Id)
GO
ALTER TABLE [dbo].[Rules] CHECK
			CONSTRAINT [FK_Rules_Company]
GO

/******************************************************************************
 **		 Define the relationship between Work y EMPLOYEE.				 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
        WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_Work]')
        AND parent_object_id = OBJECT_ID(N'[dbo].[Work]'))
	   
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  
        CONSTRAINT [FK_employee_Work] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])

 GO
 ALTER TABLE [dbo].[Work] CHECK 
        CONSTRAINT [FK_employee_Work]
 GO


/******************************************************************************
 **		 Define the relationship between Work y Position.				 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
        WHERE object_id = OBJECT_ID(N'[dbo].[FK_Position_Work]')
        AND parent_object_id = OBJECT_ID(N'[dbo].[Work]'))
	   
 ALTER TABLE [dbo].[Work]  WITH CHECK ADD  
        CONSTRAINT [FK_Position_Work] FOREIGN KEY([Position_id])
 REFERENCES [dbo].[Position] ([id])

 GO
 ALTER TABLE [dbo].[Work] CHECK 
        CONSTRAINT [FK_Position_Work]
 GO


/******************************************************************************
 **		 Define the relationship between Incident y Employee.					 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Incident_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Incident]'))
	ALTER TABLE [dbo].[Incident]  WITH CHECK ADD CONSTRAINT [FK_Incident_Employee] FOREIGN KEY(employeeId)
	REFERENCES [dbo].[Employee] (id)
GO
	ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Employee]
GO

/******************************************************************************
 **			Define the relationship between Position and Assigned.  		 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Position_Assigned]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Assigned]'))
ALTER TABLE Assigned WITH CHECK ADD CONSTRAINT [FK_Position_Assigned] 
FOREIGN KEY (Position_id) REFERENCES Position([Id]);
GO
ALTER TABLE [dbo].[Assigned] CHECK CONSTRAINT [FK_Position_Assigned]
GO

/******************************************************************************
 **			Define the relationship between Department and Assigned.  			 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Department_Assigned]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Assigned]'))
ALTER TABLE Assigned WITH CHECK ADD CONSTRAINT [FK_Department_Assigned]
 FOREIGN KEY (Department_id) REFERENCES Department([Id]);
GO
ALTER TABLE [dbo].[Assigned] CHECK CONSTRAINT [FK_Department_Assigned]
GO

/******************************************************************************
 **			Define the relationship between  Assignment and SafetyEquipment. 	 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Assignment_SafetyEquipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Assignment]'))
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD
      CONSTRAINT [FK_Assignment_SafetyEquipment] FOREIGN KEY([SafetyEquipmentId])
      REFERENCES [dbo].[SafetyEquipment] ([Id])
GO
ALTER TABLE [dbo].[Assignment] CHECK
    CONSTRAINT [FK_Assignment_SafetyEquipment]
GO

