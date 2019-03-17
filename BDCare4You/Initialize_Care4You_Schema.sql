/******************************************************************************
**  Name: Script SQL Data Base Initialize Care4You
**
**  Authors:	Boris Omar Pérez Santos
**
**  Date: 06/19/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:						             Description:
** --------     -------------				---------------------------------------------
** 02/05/2019   Boris Omar Perez Santos			Initial version
** 02/06/2019   Ricardo Veizaga					Employee Initialization Data
** 02/06/2019   Alain Quinonez					Initialization Data, Work
** 02/07/2019	Boris Omar Perez Santos			Inserts for Incident and 
*******************************************************************************/
USE Care4You;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insert data into the Department table...';
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'Elc-01','Electricity');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'hew-01','Heavy Work');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'fwo-01','Fine Work');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'roo-01','Roofed');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'fro-01','Fake Roof');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'iog-01','Installation of Gas');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'flo-01','Flooring');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'ins-01','Inspection');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'wsp-01','Work Supervision');
INSERT INTO [dbo].[Department](Created_Date,Updated_Date,Code,Name)
VALUES (GETDATE(), GETDATE(), 'hid-01','Hidrosanitary');
PRINT 'Department table done...';


PRINT 'Insert data into the Company table...';
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_Id)
VALUES (GETDATE(), GETDATE(), 'Elc001','Industrial Electricity','Ing. Rocabado Marcelo',1);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_Id)
VALUES (GETDATE(), GETDATE(), 'Elc002','Home Electricity','Ing. Rocabado Marcelo',1);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_Id)
VALUES (GETDATE(), GETDATE(), 'rco001','Reinforced Concrete','Ing. Flores Antonio',1);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'hid002','Hidrosanitary Normative','Arq. Romero Luis',8);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'Elc003','Industrial Electricity upgrade','Ing. Campero Jose',1);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'Elc004','Home Eletricity Normative','Ing. Daza Enrique',1);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'igs001','Installation of Gas Normative','Ing. Romero Antonio',6);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'far001','Fake Roof Upgrade','Arq. Gutierres Maria',5);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'qa001','QA','Ing. Fernandez Rolando',3);
INSERT INTO [dbo].[Company](Created_Date, Updated_Date, Code, Name, Instructor, Department_id)
VALUES (GETDATE(), GETDATE(), 'rco002','Reinforced Concrete Normative','Ing. Flores Antonio',2);
PRINT 'Company table done...';


PRINT 'Insert data into the Employee table...';
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [Email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'4507569', N'Miguel', N'Lopez', N'av guillermo urquidi', 4231247, N'm@m.com', N'good driver', CAST(N'2018-06-20 22:27:23.723' AS DateTime), CAST(N'2018-06-20 22:27:23.723' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'232323cb', N'Dave', N'Roberts', N'Av. ayacucho', 4647151, N'daveRbts@hotmail.com', N'good driver', CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'25546', N'Marcelo', N'Equise', N'av villazon s/n', 4567897, N'marcelo@hotmail.com', N'constructor', CAST(N'2018-06-21 05:31:01.990' AS DateTime), CAST(N'2018-06-21 05:31:01.990' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'12354cb', N'Jorge', N'Posada', N'san martin 456', 70700001, N'jposada@hotmail.com', N'Good driver', CAST(N'2018-06-21 05:35:18.390' AS DateTime), CAST(N'2018-06-21 05:35:18.390' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'335293or', N'Rubert ', N'Alba', N'av capitan Ustariz', 70789909, N'alba@hotmail.com', N'chief', CAST(N'2018-06-21 05:36:50.283' AS DateTime), CAST(N'2018-06-21 05:36:50.283' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'798772lp', N'Ivan', N'Paniagua', N'Av blanco galindo', 45078990, N'ivanp@gmail.com', N'guard', CAST(N'2018-06-21 05:38:06.297' AS DateTime), CAST(N'2018-06-21 05:38:06.297' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'677769sc', N'Carolina', N'Andrade', N'calle los ceibos', 67805477, N'candrade@hotmail.com', N'secratary', CAST(N'2018-06-21 05:39:46.970' AS DateTime), CAST(N'2018-06-21 05:39:46.970' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'7654456or', N'Mario', N'Bross', N'calle 16 de julio 655', 4557768, N'bross@acme.com', N'plumber', CAST(N'2018-06-21 05:41:41.420' AS DateTime), CAST(N'2018-06-21 05:41:41.420' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES ( N'798080lp', N'Ernesto', N'Cadima', N'calle junin 789', 4321345, N'cadimaernesto@gmail.com', N'account manager', CAST(N'2018-06-21 05:43:48.140' AS DateTime), CAST(N'2018-06-21 05:43:48.140' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'765666', N'Pedro', N'Picapiedra', N'calle espana 345', 4321345, N'pedrop@gmail.com', N'supervisor', CAST(N'2018-06-21 05:45:22.607' AS DateTime), CAST(N'2018-06-21 05:45:22.607' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'4556577cb', N'Pablo', N'Marmol', N'calle jordan 900', 77606679, N'pablomp@gmail.com', N'builder', CAST(N'2018-06-21 05:47:00.390' AS DateTime), CAST(N'2018-06-21 05:47:00.390' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'4567890cb', N'Demetrio', N'Angulo', N'calle mayor rocha 123', 65455888, N'angulo@gmail.com', N'builder', CAST(N'2018-06-21 05:48:12.080' AS DateTime), CAST(N'2018-06-21 05:48:12.080' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'8979778cb', N'Claudia', N'Mendieta', N'av heroinas 234', 76512300, N'claudia@gmail.com', N'secretary', CAST(N'2018-06-21 05:49:49.183' AS DateTime), CAST(N'2018-06-21 05:49:49.183' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES ( N'8979778cb', N'Maria', N'Gumucio', N'calle Calama 567', 76512300, N'mariag@gmail.com', N'builder', CAST(N'2018-06-21 05:51:23.220' AS DateTime), CAST(N'2018-06-21 05:51:23.220' AS DateTime));
INSERT [dbo].[Employee] ([Dni], [First_Name], [Last_Name], [Address], [Phone], [email], [Job_Description], [Created_Date], [Updated_Date])
VALUES (N'878787cb', N'Juan', N'Perez', N'calle dario montano 494', 76512300, N'jperez@gmail.com', N'builder', CAST(N'2018-06-21 05:52:20.810' AS DateTime), CAST(N'2018-06-21 05:52:20.810' AS DateTime));
PRINT 'Employee table done...';


PRINT 'Insert data into the Rules table...';
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_Id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 2, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 3, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 4, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 5, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
INSERT INTO [dbo].[Rules](Created_Date, Updated_Date, Company_id, [state])
VALUES (GETDATE(), GETDATE(), 1, 'ACTIVO');
PRINT 'Rules table done...';


PRINT 'Insert data into the Position table...';
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Edificio acme', 'Edificio Acme ubicado en la calle Z colchero #213/34 departamentos de tipo residencial', '1999-10-10', '2013-10-20', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Parque recreativo el Niño', 'Cancha multifuncional zona de juegos paseos peatonales', '2014-02-10', '2015-05-20', CAST('2014-02-10 22:27:23.723' AS DateTime), CAST('2015-05-20 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('construcción del puente Río Guanuma', 'Comunicación de Yamasà y la capital del país', '2000-02-10', '2001-07-20', CAST('2000-02-10 22:27:23.723' AS DateTime), CAST('2001-07-20 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Hospital Merida', 'Clínica Mérida con 18 consultorios 3 quirófanos', '2011-11-10', '2012-11-01', CAST('2011-11-10 22:27:23.723' AS DateTime), CAST('2012-11-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Mercado Municipal', 'Barrio PetroleroLa-150 puestos', '2011-06-10', '2012-08-01', CAST('2011-06-10 22:27:23.723' AS DateTime), CAST('2012-08-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('CITE', 'CITE ESCUELA NAVAL Y MILITAR', '2012-01-20', '2016-03-01', CAST('2012-01-20 22:27:23.723' AS DateTime), CAST('2016-03-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Coliseo Z', 'POLIDEPORTIVO CANCHA MÚLTIPLE', '2012-01-20', '2016-03-01', CAST('2012-01-20 22:27:23.723' AS DateTime), CAST('2016-03-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Areas Verdes', 'Plaza 14 de Septiembre', '2016-04-20', '2016-06-01', CAST('2016-04-20 22:27:23.723' AS DateTime), CAST('2016-06-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Obelisco', 'Obelisco CBBA', '2014-02-11', '2014-04-01', 100, CAST('2014-02-11 22:27:23.723' AS DateTime), CAST('2014-04-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('MISICUNI', 'Represa que creará energia agua reservas  abastecimiento para los terrenos productores entre otros', '1990-04-20', '2017-06-01', CAST('1990-04-20 22:27:23.723' AS DateTime), CAST('2017-06-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Tren Bioceanico', 'Son tres o 4 los departamentos para este proyecto de Bolivia  Brazil Chile', '2015-04-20', '2018-06-01', CAST('2015-04-20 22:27:23.723' AS DateTime), CAST('2018-06-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Metro', 'Para transporte de Pasajeros y cargas de noche', '2015-04-20', '2018-06-01', CAST('2015-04-20 22:27:23.723' AS DateTime), CAST('2018-06-01 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Tranvias', 'Comunicacion de los minucipios de cercado de cbba y Colcaphirua  Quillacollo Sacaba Vinto', '2007-09-09', '2019-05-15', CAST('2007-09-09 22:27:23.723' AS DateTime), CAST('2007-09-09 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('Puente Futurista', 'La construcción de la pasarela peatonal (puente futurista) que unirá al cine Center con el Boulevard de la Recoleta', '2018-01-23', '2020-05-30', CAST('2018-01-23 22:27:23.723' AS DateTime), CAST('2020-05-30 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Position]([Name],[Description],[Date_Start],[Date_End],[Created_Date],[Updated_Date])
VALUES('CARRETERA ATOCHA - TUPIZA', 'La construcción de la carretera Atocha y Tupiza', '2002-09-09', '2004-05-15', CAST('2002-09-09 22:27:23.723' AS DateTime), CAST('2004-05-15 22:27:23.723' AS DateTime));
PRINT 'Position table done...';


PRINT 'Insercion de datos dentro la tabla Work ....';
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2008-01-31 00:00:00.000', '2008-06-30 00:00:00.000', '2000', 'OBAL002', '2008-06-30 00:00:00.000', '2008-01-31 00:00:00.000', 'Efectivo', 1, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2007-11-11 00:00:00.000', '2008-04-11 00:00:00.000', '2100', 'OBAL003', '2008-04-11 00:00:00.000', '2007-11-11 00:00:00.000', 'Efectivo', 2, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2007-12-05 00:00:00.000', '2008-05-05 00:00:00.000', '8000', 'OBAL004', '2008-05-05 00:00:00.000', '2007-12-05 00:00:00.000', 'Efectivo', 3, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2010-05-31 00:00:00.000', '2010-10-31 00:00:00.000', '8000', 'OBAL005', '2010-10-31 00:00:00.000', '2010-05-31 00:00:00.000', 'Efectivo', 4, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2008-01-06 00:00:00.000', '2008-06-06 00:00:00.000', '2200', 'OBAL006', '2008-06-06 00:00:00.000', '2008-01-06 00:00:00.000', 'Efectivo', 5, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2008-01-24 00:00:00.000', '2008-06-24 00:00:00.000', '2300', 'OBAL007', '2008-06-24 00:00:00.000', '2008-01-24 00:00:00.000', 'Efectivo', 6, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2009-02-08 00:00:00.000', '2009-07-08 00:00:00.000', '5000', 'OBAL008', '2009-07-08 00:00:00.000', '2009-02-08 00:00:00.000', 'Efectivo', 7, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2008-12-29 00:00:00.000', '2009-05-29 00:00:00.000', '5100', 'OBAL009', '2009-05-29 00:00:00.000', '2008-12-29 00:00:00.000', 'Efectivo', 8, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ( '2009-01-16 00:00:00.000', '2009-06-16 00:00:00.000', '5100', 'OBAL010', '2009-06-16 00:00:00.000', '2009-01-16 00:00:00.000', 'Efectivo', 9, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-05-03 00:00:00.000', '2009-10-03 00:00:00.000', '6400', 'OBAL011', '2009-10-03 00:00:00.000', '2009-05-03 00:00:00.000', 'Efectivo', 1, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2010-12-05 00:00:00.000', '2011-05-05 00:00:00.000', '2300', 'OBAL012', '2011-05-05 00:00:00.000', '2010-12-05 00:00:00.000', 'Efectivo', 2, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2007-12-11 00:00:00.000', '2008-05-11 00:00:00.000', '2400', 'OBAL013', '2008-05-11 00:00:00.000', '2007-12-11 00:00:00.000', 'Efectivo', 3, 1);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-01-29 00:00:00.000', '2009-06-29 00:00:00.000', '2700', 'OBAL032', '2009-06-29 00:00:00.000', '2009-01-29 00:00:00.000', 'Deposito Bancario', 7,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-01-04 00:00:00.000', '2009-06-04 00:00:00.000', '2900', 'OBAL033', '2009-06-04 00:00:00.000', '2009-01-04 00:00:00.000', 'Deposito Bancario', 8,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2008-12-29 00:00:00.000', '2009-05-29 00:00:00.000', '3100', 'OBAL034', '2009-05-29 00:00:00.000', '2008-12-29 00:00:00.000', 'Deposito Bancario', 9,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2008-12-17 00:00:00.000', '2009-05-17 00:00:00.000', '2800', 'OBAL035', '2009-05-17 00:00:00.000', '2008-12-17 00:00:00.000', 'Deposito Bancario', 5,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-02-16 00:00:00.000', '2009-07-16 00:00:00.000', '2700', 'OBAL036', '2009-07-16 00:00:00.000', '2009-02-16 00:00:00.000', 'Deposito Bancario', 6,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-02-08 00:00:00.000', '2009-07-08 00:00:00.000', '3100', 'OBAL037', '2009-07-08 00:00:00.000', '2009-02-08 00:00:00.000', 'Deposito Bancario', 2,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-02-10 00:00:00.000', '2009-07-10 00:00:00.000', '3000', 'OBAL038', '2009-07-10 00:00:00.000', '2009-02-10 00:00:00.000', 'Deposito Bancario', 3,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2009-03-07 00:00:00.000', '2009-08-07 00:00:00.000', '2800', 'OBAL039', '2009-08-07 00:00:00.000', '2009-03-07 00:00:00.000', 'Deposito Bancario', 4,2);
INSERT INTO Work (Created_Date, Updated_Date, Work_Amount, Work_Code, End_Date, Init_Date, Payment_Type, Employee_Id, Position_Id)
VALUES ('2010-01-16 00:00:00.000', '2010-06-16 00:00:00.000', '3200', 'OBAL040', '2010-06-16 00:00:00.000', '2010-01-16 00:00:00.000', 'Deposito Bancario', 7,2);
PRINT 'Tabla Work, insercion Completado...';


PRINT 'Insert data into the Assigned table...';
INSERT INTO [dbo].[Assigned]([Position_id], [Department_id], [State_Assigned], [Created_Date], [Updated_Date])
VALUES(1, 2, 'Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime));
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 2, 3);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 1, 4,);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 4, 4,);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 1, 5);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 1, 6);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 1, 7);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2018-06-20 22:27:23.723' AS DateTime), CAST('2018-06-20 22:27:23.723' AS DateTime), 1, 8);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2014-02-10 22:27:23.723' AS DateTime), CAST('2015-05-20 22:27:23.723' AS DateTime), 2, 7);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2000-02-10 22:27:23.723' AS DateTime), CAST('2001-07-20 22:27:23.723' AS DateTime), 3, 2);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2000-02-10 22:27:23.723' AS DateTime), CAST('2001-07-20 22:27:23.723' AS DateTime), 3, 3);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2011-11-10 22:27:23.723' AS DateTime), CAST('2012-11-01 22:27:23.723' AS DateTime), 4, 2);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2011-11-10 22:27:23.723' AS DateTime), CAST('2012-11-01 22:27:23.723' AS DateTime), 4, 1);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2011-11-10 22:27:23.723' AS DateTime), CAST('2012-11-01 22:27:23.723' AS DateTime), 5, 1);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2012-01-20 22:27:23.723' AS DateTime), CAST('2016-03-01 22:27:23.723' AS DateTime), 6, 8);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2012-01-20 22:27:23.723' AS DateTime), CAST('2012-01-20 22:27:23.723' AS DateTime), 7, 2);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2016-04-20 22:27:23.723' AS DateTime), CAST('2016-06-01 22:27:23.723' AS DateTime), 8, 7);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2014-02-11 22:27:23.723' AS DateTime), CAST('2014-04-01 22:27:23.723' AS DateTime), 9, 8);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('1990-04-20 22:27:23.723' AS DateTime), CAST('2017-06-01 22:27:23.723' AS DateTime), 8, 2);
INSERT INTO [dbo].[Assigned]([State_Assigned], [Created_Date], [Updated_Date], [Position_id],[Department_id])
VALUES('Terminado', CAST('2015-04-20 22:27:23.723' AS DateTime), CAST('2018-06-01 22:27:23.723' AS DateTime), 7, 9);
PRINT 'Assigned table done...';


PRINT 'Insert data into the Incident table...';
INSERT INTO [dbo].[Incident](Created_Date, Updated_Date, Incident_Name, Incident_Code, Incident_Type, Incident_Scope, Incident_Objective, Incident_Criteria, Incident_Periodicity, Employee_Id)
VALUES ('2017-05-05 00:00:00.000','2017-12-05 00:00:00.000', 'WEEKNESS Incident', 'AUD-10','EXTERNAL','Strategic scope','Reduce weekness','Aplication standarts','ANNUAL', 1);
INSERT INTO [dbo].[Incident](Created_Date, Updated_Date, Incident_Name, Incident_Code, Incident_Type, Incident_Scope, Incident_Objective, Incident_Criteria, Incident_Periodicity, Employee_Id)
VALUES ('2017-05-20 00:00:00.000','2017-12-20 00:00:00.000', 'ACCIDENT Incident', 'AUD-20','INTERNAL','Strategic scope','Reduce accidents','Aplication standart ISO 9001:2015','MONTHLY', 2);
INSERT INTO [dbo].[Incident](Created_Date, Updated_Date, Incident_Name, Incident_Code, Incident_Type, Incident_Scope, Incident_Objective, Incident_Criteria, Incident_Periodicity, Employee_Id)
VALUES ('2018-06-20 00:00:00.000','2018-06-20 00:00:00.000', 'ACCIDENT Incident', 'AUD-30','INTERNAL','Strategic scope','Reduce incidents','Aplication internal rule','MONTHLY', 2);
INSERT INTO [dbo].[Incident](Created_Date, Updated_Date, Incident_Name, Incident_Code, Incident_Type, Incident_Scope, Incident_Objective, Incident_Criteria, Incident_Periodicity, Employee_Id)
VALUES ('2018-06-20 00:00:00.000','2018-06-20 00:00:00.000', 'ACCIDENT Incident', 'AUD-40','INTERNAL','Strategic scope','Reduce incidents','Aplication internal rule','MONTHLY', 4);
INSERT INTO [dbo].[Incident](Created_Date, Updated_Date, Incident_Name, Incident_Code, Incident_Type, Incident_Scope, Incident_Objective, Incident_Criteria, Incident_Periodicity, Employee_Id)
VALUES ('2018-06-20 00:00:00.000','2018-06-20 00:00:00.000', 'ACCIDENT Incident', 'AUD-50','INTERNAL','Strategic scope','Reduce incidents','Aplication internal rule','MONTHLY', 5);
PRINT 'Incident table done...';



--SafetyEquipment
PRINT 'Insert data into the SafetyEquipment table...';
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Vidrios y espejos','Vidrios transparentes');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Pintura','Paramentos');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Instalaciones Hidrosanitarias','equipo de seguridad');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Instalaciones Eléctricas','Instalación de luminarias y tomacorrientes');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),' Carpintería metálica','Carpintería de hierro');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Pisos','Piso de cemento con endurecedor');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Granitos','Mesones de cocina');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Vialidad','La seguridad vial en los lugares de trabajo es esencial para tener una alta visibilidad');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Traje de apicultor','Diseñado para protección completa de las personas que realizan actividades en zonas');
INSERT INTO [dbo].[SafetyEquipment]([Created_Date], [Updated_Date], [Name], [Description])
     VALUES (GETDATE(),GETDATE(),'Salud e Higiene','La industria requiere de productos de higiene personal y limpieza de áreas');

PRINT 'Insert data into the Migration table...';



--SafetyEquipment
PRINT 'Insert data into the OrganizationChart table...';
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Vidrios','Vidrios transparentes');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Pintura','Paramentos');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Hidrosanitarias','equipo de seguridad');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Instalaciones','Instalación de luminarias y tomacorrientes');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),' Carpintería','Carpintería de hierro');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Pisos','Piso de cemento con endurecedor');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Granitos','Mesones de cocina');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Vialidad','La seguridad vial en los lugares de trabajo es esencial para tener una alta visibilidad');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Trajes','Diseñado para protección completa de las personas que realizan actividades en zonas');
INSERT INTO [dbo].[OrganizationChart]([Created_Date], [Updated_Date], [Title], [Description])
     VALUES (GETDATE(),GETDATE(),'Salud','La industria requiere de productos de higiene personal y limpieza de áreas');

PRINT 'Insert data into the Migration table...';


--Assignment
PRINT 'Insert data into the Assignment table...';
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (1, 2, 1, 3);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (2, 1, 2, 2);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (3, 2, 3, 3);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (2, 3, 4, 2);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (4, 5, 2, 5);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (5, 2, 3, 5);
INSERT INTO [dbo].[Assignment]([Safety_Equipment_Id], [Employee_Id], [Organization_Chart_Id], [Department_Id])
     VALUES (1, 2, 3, 4);

PRINT 'Insert data into the Migration table...';

COMMIT TRANSACTION;