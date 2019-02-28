/******************************************************************************
**  Name: Script SQL Data Base "Care4You"
**
**  Authors:	Boris Omar Pérez Santos
**				Ricardo Veizaga
**				Nicaela Onofre
**				Alain Quinonez
**
**  Date: 02/05/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                         Description:
** --------     -------------			 ---------------------------------------------
** 02/06/2019   Boris Omar Pérez Santos			Initial version
** 02/06/2019   Ricardo Veizaga					Creating DimEmployee, DimTraining
** 02/06/2019   Nicaela Onofre			        Creating Dimention Project
** 02/06/2019   Alain Quinonez			        Creating DimItem
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
 **							Creating the DimEmployee Table					 **
 **							Autor: Ricardo Veizga							 **
 ******************************************************************************/
 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
GO
PRINT 'Creating the DimEmployee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimEmployee]') 
		       AND type in (N'U'))
 BEGIN
CREATE TABLE [dbo].[DimEmployee](
	[IdEmployee] [int] NOT NULL,
	[Dni] [varchar](15) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[JobPosition] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL

 CONSTRAINT [PK_DimIdEmployee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


	PRINT 'Table DimEmployee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table DimEmployee already exists into the database';
	END
SET ANSI_PADDING OFF
GO

/******************************************************************************
 **							Creating the DimTraining Table					 **
 **							Autor: Alain Quinonez							 **
 ******************************************************************************/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
PRINT 'Creating the DimTraining table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimTraining]') 
		       AND type in (N'U'))
 BEGIN
CREATE TABLE [dbo].[DimTraining](
	[IdTraining] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Instructor] [varchar](50) NOT NULL

 CONSTRAINT [PK_DimIdTraining] PRIMARY KEY CLUSTERED 
(
	[IdTraining] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


	PRINT 'Table DimTraining created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table DimTraining already exists into the database';
	END
SET ANSI_PADDING OFF
GO


/******************************************************************************
 **							Creating the DimProject Table					 **
 **							Autor: Veruzka Onofre  							 **
 ******************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
GO
PRINT 'Creating the DimProject table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimProject]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimProject]([IdProject] INT NOT NULL,
	                             [Name] VARCHAR(250) NOT NULL,
								 [Description] VARCHAR(1000) NULL, 
							     [Date_Start] DATE NOT NULL,
								 [Date_End] DATE NOT NULL,
								 [Project_Status] VARCHAR(50) NOT NULL,
								 [Area] VARCHAR(128) NOT NULL,
							     CONSTRAINT PK_DimProject_Id PRIMARY KEY([IdProject]ASC)
		);

		PRINT 'Table DimProject created!';
	END
ELSE
	BEGIN
		PRINT 'Table DimProject already exists into the database';
	END
GO
SET ANSI_PADDING OFF
GO


/******************************************************************************
 **							Creating the DimItem Table						 **
 **							Autor: Boris Perez							 **
 ******************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
GO
PRINT 'Creating the DimItem table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimItem]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DimItem]([IdItem] INT,
	                             [ItemName] VARCHAR(50) NOT NULL,
								 [ItemDescription] VARCHAR(200) NULL,
								 [ItemCategory] VARCHAR(250) NOT NULL,
								 [ItemSubCategory] VARCHAR(250) NOT NULL,
								 [ItemType] VARCHAR(50) NOT NULL,
							     CONSTRAINT PK_DimItem_Id PRIMARY KEY([IdItem] ASC)
		);

		PRINT 'Table DimItem created!';
	END
ELSE
	BEGIN
		PRINT 'Table DimItem already exists into the database';
	END
GO
SET ANSI_PADDING OFF
GO

/******************************************************************************
 **							Creating the FactEventuality Table				 **
 **							Autor: Ricardo Veizaga							 **
 ******************************************************************************/
PRINT 'Creating the FactEventuality table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[FactEventuality]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[FactEventuality]([IdEventuality] INT NOT NULL
										,[IdEmployee] INT NOT NULL
										,[IdTraining] INT NOT NULL
										,[IdProject] INT NOT NULL
										,[IdItem] INT NOT NULL
										,[typeEvent] VARCHAR(10) NOT NULL
										,[injuryPart] VARCHAR(50) NOT NULL
										,[injuryType] VARCHAR(50) NOT NULL
										,[dateEvent] DATE NULL
										,[description] VARCHAR(250) NULL
										,CONSTRAINT [PK_FactEventuality] PRIMARY KEY CLUSTERED 
											([IdEventuality] ASC,
											 [IdEmployee] ASC,
											 [IdTraining] ASC,
										  	 [IdProject] ASC,
											 [IdItem] ASC)
											 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF
											,IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
											ON [PRIMARY]
										) ON [PRIMARY]
		PRINT 'Table FactEventuality created!';
	END
ELSE
	BEGIN
		PRINT 'Table FactEventuality already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the ETL Employee Table					 **
 **							Autor: Alain Quinonez							 **
 ******************************************************************************/
PRINT 'Creating the [ETL].[Employee] table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Employee]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Employee](
								  [IdEmployee] [int] NOT NULL
								  ,[Dni] [varchar](15) NOT NULL
								  ,[Name] [varchar](50) NOT NULL
								  ,[JobPosition] [varchar](50) NOT NULL
								  ,[Contrato] [varchar](50) NOT NULL
								  ) ON [PRIMARY]
		PRINT 'Table [ETL].[Employee] created!';
	END
ELSE
	BEGIN
		PRINT 'Table [ETL].[Employee] already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the ETL Training Table					 **
 **							Autor: Veruzka Onofre							 **
 ******************************************************************************/
PRINT 'Creating the [ETL].[Training] table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Training]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Training](
								  [IdTraining] [int] NOT NULL
								  ,[Name] [varchar](50) NOT NULL
								  ,[Instructor] [varchar](50) NOT NULL
								  ) ON [PRIMARY]
		PRINT 'Table [ETL].[Training] created!';
	END
ELSE
	BEGIN
		PRINT 'Table [ETL].[Training] already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the ETL Eventuality Table				 **
 **							Autor: Ricardo Veizaga							 **
 ******************************************************************************/
PRINT 'Creating the [ETL].[Eventuality] table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Eventuality]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Eventuality]([IdEventuality] INT NOT NULL
										,[IdEmployee] INT NOT NULL
										,[IdTraining] INT NULL
										,[IdProject] INT NOT NULL
										,[IdItem] INT NULL
										,[typeEvent] VARCHAR(10) NOT NULL
										,[injuryPart] VARCHAR(50) NOT NULL
										,[injuryType] VARCHAR(50) NOT NULL
										,[dateEvent] DATE NULL
										,[description] VARCHAR(250) NULL
								  ) ON [PRIMARY]
		PRINT 'Table [ETL].[Eventuality] created!';
	END
ELSE
	BEGIN
		PRINT 'Table [ETL].[Eventuality] already exists into the database';
	END
GO
/******************************************************************************
 **							Creating the ETL Project Table					 **
 **							Autor: Boris Perez								 **
 ******************************************************************************/
PRINT 'Creating the [ETL].[Project] table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Project]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Project](
								  [IdProject] INT NOT NULL
	                             ,[Name] VARCHAR(250) NULL
								 ,[Description] VARCHAR(1000) NULL
							     ,[Date_Start] DATE NOT NULL
								 ,[Date_End] DATE NULL
								 ,[Project_Status] VARCHAR(50)  NULL
								 ,[Area] VARCHAR(128)  NULL
								  ) ON [PRIMARY]
		PRINT 'Table [ETL].[Project] created!';
	END
ELSE
	BEGIN
		PRINT 'Table [ETL].[Project] already exists into the database';
	END
GO

/******************************************************************************
 **							Creating the ETL Item Table						 **
 **							Autor: Alain Quinonez							 **
 ******************************************************************************/
PRINT 'Creating the [ETL].[Item] table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Item]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [ETL].[Item]([IdItem] INT NOT NULL
	                          ,[ItemName] VARCHAR(50) NOT NULL
							  ,[ItemDescription] VARCHAR(200) NULL
							  ,[ItemCategory] VARCHAR(250) NOT NULL
							  ,[ItemSubCategory] VARCHAR(250) NOT NULL
							  ,[ItemType] VARCHAR(50) NOT NULL
							  ) ON [PRIMARY]
		PRINT 'Table [ETL].[Item] created!';
	END
ELSE
	BEGIN
		PRINT 'Table [ETL].[Item] already exists into the database';
	END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimEmployee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEventuality]'))
ALTER TABLE [dbo].[FactEventuality]  WITH CHECK ADD
		CONSTRAINT [FK_DimEmployee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[DimEmployee] ([IdEmployee])
GO
ALTER TABLE [dbo].[FactEventuality] CHECK CONSTRAINT [FK_DimEmployee]
GO

/**/

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimTraining]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEventuality]'))
ALTER TABLE [dbo].[FactEventuality]  WITH CHECK ADD  CONSTRAINT [FK_DimTraining] FOREIGN KEY([IdTraining])
REFERENCES [dbo].[DimTraining] ([IdTraining])
GO
ALTER TABLE [dbo].[FactEventuality] CHECK CONSTRAINT [FK_DimTraining]
GO

/**/

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimProject]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEventuality]'))
ALTER TABLE [dbo].[FactEventuality]  WITH CHECK ADD  CONSTRAINT [FK_DimProject] FOREIGN KEY([IdProject])
REFERENCES [dbo].[DimProject] ([IdProject])
GO
ALTER TABLE [dbo].[FactEventuality] CHECK CONSTRAINT [FK_DimProject]
GO

/**/

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DimItem]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEventuality]'))
ALTER TABLE [dbo].[FactEventuality]  WITH CHECK ADD  CONSTRAINT [FK_DimItem] FOREIGN KEY([IdItem])
REFERENCES [dbo].[DimItem] ([IdItem])
GO
ALTER TABLE [dbo].[FactEventuality] CHECK CONSTRAINT [FK_DimItem]
GO

/******************************************************************************
**  Name: ETL.DW_MergeEmployees
**  Desc: Merges Source ETL.Employee changes into Destination
**  dbo.DimEmployee table. 
**  Called By SQL Job ETL
**
**  Author: Alain Quinonez
**
**  Created: 02/07/2019
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeEmployee]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[DW_MergeEmployee]
END
GO
CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[IdEmployee] = source.[IdEmployee]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Dni]   = source.[Dni]
			,[Name] = source.[Name]
			,[JobPosition] = source.[JobPosition]
			,[Contrato] = source.[Contrato]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [IdEmployee]
		,[Dni]
		,[Name]
		,[JobPosition]
		,[Contrato]
	  )
	  VALUES
	  (
		source.[IdEmployee]
		,source.[Dni]
		,source.[Name]
		,source.[JobPosition]
		,source.[Contrato]
	  );
END
GO
PRINT 'Procedure [dbo].[DW_MergeEmployee] created';
GO
/******************************************************************************
**  Name: ETL.DW_MergeTraininies
**  Desc: Merges Source ETL.Training changes into Destination 
**  dbo.DimTraining table.
**  Called By SQL Job ETL
**
**  Author: Boris Omar Perez Santos
**
**  Created: 02/07/2019
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeTraining]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[DW_MergeTraining]
END
GO
CREATE PROCEDURE [ETL].[DW_MergeTraining]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimTraining] AS target
	USING [ETL].[Training] AS source
	ON
	(
	  target.[IdTraining] = source.[IdTraining]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Name] = source.[Name]
			,[Instructor] = source.[Instructor]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[IdTraining]
		,[Name]
		,[Instructor]
	  )
	  VALUES
	  (
		source.[IdTraining]
		,source.[Name]
		,source.[Instructor]
	  );
END
GO
PRINT 'Procedure [ETL].[DW_MergeTraining] created';
GO
/******************************************************************************
**  Name: ETL.DW_MergeEventuality
**  Desc: Merges Source ETL.FactEventuality changes into Destination
**  dbo.Eventuality table. 
**	Called By SQL Job ETL
**  Author: Ricardo Veizaga
**
**  Created: 02/07/2019
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeEventuality]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[DW_MergeEventuality]
END
GO
CREATE PROCEDURE [ETL].[DW_MergeEventuality]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[FactEventuality] AS target
	USING [ETL].[Eventuality] AS source
	ON
	(target.[IdEventuality]     = source.[IdEventuality]
	  AND target.[IdEmployee]     = source.[IdEmployee]
	  AND target.[IdTraining]     = source.[IdTraining]
	  AND target.[IdProject] = source.[IdProject]
	  AND target.[IdItem]    = source.[IdItem]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [typeEvent] = source.[typeEvent]
			,[injuryPart] = source.[injuryPart]
			,[injuryType] = source.[injuryType]
			,[dateEvent]    = source.[dateEvent]
			,[description] = source.[description]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  ([IdEventuality]
		,[IdEmployee]
		,[IdTraining]
		,[IdProject]
		,[IdItem]
		,[typeEvent]
		,[injuryPart]
		,[injuryType]
		,[dateEvent]
		,[description]
	  )
	  VALUES
	  ( source.[IdEventuality]
		,source.[IdEmployee]
		,ISNULL(source.[IdTraining],1)
		,source.[IdProject]
		,ISNULL(source.[IdItem],1)
		,ISNULL(source.[typeEvent],'N/A')
		,ISNULL(source.[injuryPart],'N/A')
		,ISNULL(source.[injuryType],'N/A')
		,ISNULL(source.[dateEvent],getDate())
		,ISNULL(source.[description],'N/A')
	  );
END
GO
PRINT 'Procedure [ETL].[DW_MergeEventuality] created';
GO
/******************************************************************************
**  Name: ETL.DW_MergeProject
**  Desc: Merges Source ETL.DeProject changes into Destination
**  dbo.DimProject table. 
**	Called By SQL Job ETL
**  Author: Boris Omar Perez Santos
**
**  Created: 02/07/2019
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeProject]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[DW_MergeProject]
END
GO
CREATE PROCEDURE [ETL].[DW_MergeProject]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimProject] AS target
	USING [ETL].[Project] AS source
	ON
	(
	  target.[IdProject] = source.[IdProject]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Name] = ISNULL(source.[Name],'N/A')
			,[Description] = source.[Description]
			,[Date_Start] = source.[Date_Start]
			,[Date_End] = ISNULL(source.[Date_End],GETDATE())
			,[Project_Status] = ISNULL(source.[Project_Status],'N/A') 
			,[Area] = ISNULL(source.[Area],'N/A') 
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[IdProject]
		,[Name]
		,[Description]
		,[Date_Start]
		,[Date_End]
		,[Project_Status]
		,[Area]
	  )
	  VALUES
	  (
		source.[IdProject]
		,source.[Name]
		,source.[Description]
		,source.[Date_Start]
		,ISNULL(source.[Date_End],GETDATE())
		,ISNULL(source.[Project_Status],'N/A') 
		,ISNULL(source.[Area],'N/A') 
	  );
END
GO
PRINT 'Procedure [ETL].[DW_MergeProject] created';
GO
/******************************************************************************
**  Name: ETL.DW_MergeItem
**  Desc: Merges Source ETL.Item changes into Destination
**  dbo.DimItem table. 
**	Called By SQL Job ETL
**  Author: Veruzka Onofre
**
**  Created: 02/07/2019
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeItem]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[DW_MergeItem]
END
GO
CREATE PROCEDURE [ETL].[DW_MergeItem]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimItem] AS target
	USING [ETL].[Item] AS source
	ON
	(
	  target.[IdItem] = source.[IdItem]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [ItemName]    = source.[ItemName]
			,[ItemDescription] = source.[ItemDescription]
			,[ItemCategory]    = source.[ItemCategory]
			,[ItemSubCategory] = source.[ItemSubCategory]
			,[ItemType]    = source.[ItemType]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[IdItem]
		,[ItemName]
		,[ItemDescription]
		,[ItemCategory]
		,[ItemSubCategory]
		,[ItemType]
	  )
	  VALUES
	  (
		source.[IdItem]
		,source.[ItemName]
		,source.[ItemDescription]
		,source.[ItemCategory]
		,source.[ItemSubCategory]
		,source.[ItemType]
	  );
END
GO
PRINT 'Procedure [ETL].[DW_MergeItem] created';
GO