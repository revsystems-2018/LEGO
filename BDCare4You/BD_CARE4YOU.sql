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

USE CareForYou
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
							[Email] VARCHAR(50) NOT NULL,
							[Job_Description] VARCHAR (50) NULL,
	
							[Created_Date] DATETIME NOT NULL CONSTRAINT [DF_Employee_Created_Date]  DEFAULT (getutcdate()),
							[Updated_Date] DATETIME NOT NULL CONSTRAINT [DF_Employee_Updated_Date]  DEFAULT (getutcdate())

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
CREATE TABLE [dbo].[Assignment]([Id] [int] IDENTITY(1,1) NOT NULL,
								[Safety_Equipment_Id] [int] NOT NULL,
								[Employee_Id] [int] NOT NULL,
								[Organization_Chart_Id] [int] NOT NULL,
								[Department_Id] [int] NOT NULL,
								CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
		CREATE TABLE [dbo].[Department]([Id] INT IDENTITY(1,1) NOT NULL,
										[Create_On] DATETIME CONSTRAINT DF_Create_OnDepartment DEFAULT GETDATE(),
										[Update_On] DATETIME,
										[Version] INT CONSTRAINT DF_VersionDepartment DEFAULT 0,
										[Code] VARCHAR(10) CONSTRAINT NN_CodeDepartment NOT NULL,
										[Name] VARCHAR(30) CONSTRAINT NN_NameDepartment NOT NULL,
										CONSTRAINT PK_Department PRIMARY KEY(Id ASC));
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
		CREATE TABLE [dbo].[Company]([Id] INT IDENTITY(1,1) NOT NULL,
									 [Create_On] DATETIME CONSTRAINT DF_Create_OnCompany DEFAULT GETDATE(),
									 [Update_On] DATETIME,
									 [Code] VARCHAR(10) CONSTRAINT NN_CodeCompany NOT NULL,
									 [Name] VARCHAR(50) CONSTRAINT NN_NameCompany NOT NULL,
									 [Instructor] VARCHAR(50) CONSTRAINT NN_InstructorCompany NOT NULL,
									 [Department_Id] INT NOT NULL,
									 CONSTRAINT PK_Company PRIMARY KEY(Id ASC));
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
		CREATE TABLE [dbo].[Rules]([Id] INT IDENTITY(1,1) NOT NULL,
								   [Create_On] DATETIME CONSTRAINT DF_Create_OnRules DEFAULT GETDATE(),
								   [Update_On] DATETIME,
								   [Employee_Id] INT NOT NULL,
								   [Company_Id] INT NOT NULL,
								   [State] VARCHAR(10) CONSTRAINT DF_StateRules DEFAULT 'ACTIVO',
								   CONSTRAINT PK_Rules PRIMARY KEY(Id ASC));
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
	CREATE TABLE [dbo].[Work] ([Id] INT IDENTITY(1,1) NOT NULL ,
							   [Created_On] DATETIME CONSTRAINT DF_Create_OnWork DEFAULT GETDATE(),
							   [Updated_On] DATETIME,
							   [Work_Amount] VARCHAR(25) NOT NULL,
							   [Work_Code] VARCHAR(25) NOT NULL,
							   [End_Date] DATETIME,
							   [Init_Date] DATETIME NOT NULL,
							   [Payment_Type] VARCHAR(25) NOT NULL,
							   [Employee_Id] INT NOT NULL ,    
							   [Position_Id] INT NOT NULL ,
							   CONSTRAINT PK_Work PRIMARY KEY (Id ASC));
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
	CREATE TABLE [dbo].[Incident] ([Id] INT IDENTITY(1,1) NOT NULL,
								   [Create_On] DATETIME CONSTRAINT DF_Create_OnIncident DEFAULT GETDATE(),
								   [Update_On] DATETIME,
								   [Incident_Name] VARCHAR(50) NOT NULL,
								   [Incident_Code] VARCHAR(50) NOT NULL,
								   [Incident_Type] VARCHAR(10) NOT NULL,
								   [Incident_Scope] VARCHAR(50) NOT NULL,
								   [Incident_Objective] VARCHAR(50) NOT NULL,
								   [Incident_Criteria] VARCHAR(50) NOT NULL,
								   [Incident_Periodicity] VARCHAR(10) NOT NULL,
								   [Employee_Id] INT NOT NULL,
								   [Department_Id] INT NOT NULL,
								   CONSTRAINT PK_Incident PRIMARY KEY (Id ASC));

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
		CREATE TABLE [dbo].[Position] ([Id] INT IDENTITY(1,1) NOT NULL,
									   [Name] VARCHAR(250) NOT NULL,
									   [Description] VARCHAR(1000) NULL, 
									   [Date_Start] DATE NOT NULL,
								       [Date_End] DATE NOT NULL,
									   [Create_Date] DATETIME NOT NULL CONSTRAINT DF_Position_Create_Date DEFAULT GETUTCDATE(),
								       [Updated_Date] DATETIME NOT NULL CONSTRAINT DF_Position_Update_Date DEFAULT GETUTCDATE(),
									   CONSTRAINT PK_Position PRIMARY KEY(Id ASC));
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
		CREATE TABLE [dbo].[Assigned] ([Id] INT IDENTITY(1,1) NOT NULL,
									   [Position_Id] INT NOT NULL,
									   [Department_Id] INT NOT NULL,
					                   [State_Assigned] VARCHAR(50) NOT NULL CHECK (State_Assigned IN('En curso', 'Detenido', 'Terminado')),
									   [Create_Date] DATETIME NOT NULL CONSTRAINT DF_Assigned_createDate DEFAULT GETUTCDATE(),
									   [Update_Date] DATETIME NOT NULL CONSTRAINT DF_Assigned_updateDate DEFAULT GETUTCDATE(),
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
		CREATE TABLE [dbo].[SafetyEquipment]([Id] INT IDENTITY(1,1) NOT NULL,
											 [Create_On] DATETIME CONSTRAINT DF_Create_OnSafetyEquipment DEFAULT GETDATE(),
											 [Update_On] DATETIME,
											 [Name] VARCHAR(30) CONSTRAINT NN_NameSafetyEquipment NOT NULL,
											 [Description] VARCHAR(500) CONSTRAINT NN_SafetyEquipmentDescription NOT NULL,
											 CONSTRAINT PK_SafetyEquipment PRIMARY KEY(Id ASC));
		PRINT 'Table SafetyEquipment created!';
	END
ELSE
	BEGIN
		PRINT 'Table SafetyEquipment already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the OrganizationChart table				 **
 **						    Autor: Alain Quinonez	                         **
 ******************************************************************************/
PRINT 'Creating the OrganizationChart table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[OrganizationChart]')
		       AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[OrganizationChart]([Id] INT IDENTITY(1,1) NOT NULL,
											   [Create_On] DATETIME CONSTRAINT DF_Create_OnOrganizationChart DEFAULT GETDATE(),
											   [Update_On] DATETIME,
											   [Title] VARCHAR(30) CONSTRAINT NN_TitleOrganizationChart NOT NULL,
											   [Description] VARCHAR(500) CONSTRAINT NN_OrganizationChartDescription NOT NULL,
											   CONSTRAINT PK_OrganizationChart PRIMARY KEY(Id ASC));
		PRINT 'Table OrganizationChart created!';
	END
ELSE
	BEGIN
		PRINT 'Table OrganizationChart already exists into the database';
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

		ALTER TABLE [dbo].[Assignment] WITH CHECK ADD CONSTRAINT [FK_Assignment_Employee] FOREIGN KEY([Employee_Id])
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
			CONSTRAINT FK_Rules_Company FOREIGN KEY (Company_Id)
			REFERENCES [dbo].[Company]([Id])
GO
ALTER TABLE [dbo].[Rules] CHECK
			CONSTRAINT [FK_Rules_Company]
GO

/******************************************************************************
 **		 Define the relationship between Work y EMPLOYEE.				 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
        WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Work]')
        AND parent_object_id = OBJECT_ID(N'[dbo].[Work]'))
	   
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  
        CONSTRAINT [FK_Employee_Work] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])

 GO
 ALTER TABLE [dbo].[Work] CHECK 
        CONSTRAINT [FK_Employee_Work]
 GO


/******************************************************************************
 **		 Define the relationship between Work y Position.				 **
 ******************************************************************************/
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
        WHERE object_id = OBJECT_ID(N'[dbo].[FK_Position_Work]')
        AND parent_object_id = OBJECT_ID(N'[dbo].[Work]'))
	   
 ALTER TABLE [dbo].[Work]  WITH CHECK ADD  
        CONSTRAINT [FK_Position_Work] FOREIGN KEY([Position_Id])
 REFERENCES [dbo].[Position] ([Id])

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
	ALTER TABLE [dbo].[Incident]  WITH CHECK ADD CONSTRAINT [FK_Incident_Employee] FOREIGN KEY(Employee_Id)
	REFERENCES [dbo].[Employee] (Id)
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
FOREIGN KEY (Position_Id) REFERENCES [dbo].[Position]([Id]);
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
 FOREIGN KEY (Department_Id) REFERENCES [dbo].[Department]([Id]);
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
      CONSTRAINT [FK_Assignment_SafetyEquipment] FOREIGN KEY([Safety_Equipment_Id])
      REFERENCES [dbo].[SafetyEquipment] ([Id])
GO
ALTER TABLE [dbo].[Assignment] CHECK
    CONSTRAINT [FK_Assignment_SafetyEquipment]
GO

/******************************************************************************
 **			Define the relationship between  Assignment and Department. 	 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Assignment_Department]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Assignment]'))
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD
      CONSTRAINT [FK_Assignment_Department] FOREIGN KEY([Department_Id])
      REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Assignment] CHECK
    CONSTRAINT [FK_Assignment_Department]
GO

/******************************************************************************
 **			Define the relationship between  Assignment and Department. 	 **
 ******************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Assignment_OrganizationChart]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Assignment]'))
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD
      CONSTRAINT [FK_Assignment_OrganizationChart] FOREIGN KEY([Organization_Chart_Id])
      REFERENCES [dbo].[OrganizationChart] ([Id])
GO
ALTER TABLE [dbo].[Assignment] CHECK
    CONSTRAINT [FK_Assignment_OrganizationChart]
GO