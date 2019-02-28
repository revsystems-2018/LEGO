USE Care4You
-----Area------
/*
DECLARE @Code VARCHAR(10);
DECLARE @Name VARCHAR(50);
DECLARE @ModifiedBy INT;

EXECUTE [dbo].[SP_InsertArea] @Code ='Elc-01'
							 ,@Name ='Electricity'
							 ,@ModifiedBy = 100;
*/
 /*
DECLARE @IdArea INT;
DECLARE @Code VARCHAR(10);
DECLARE @Name VARCHAR(30);
DECLARE @ModifiedBy INT;

EXECUTE [dbo].[SP_UpdateArea] @IdArea = 1
								,@Code ='Elc-01'
								,@Name = 'Electricity'
								,@ModifiedBy = 100;
*/
/*
DECLARE @IdArea INT;
EXECUTE [dbo].[SP_DeleteArea] @IdArea = 2
*/

-----Training------
/*
DECLARE @Code VARCHAR(10);
DECLARE @Name VARCHAR(50);
DECLARE @instructor VARCHAR(50);
DECLARE @Area_Id INT;
DECLARE @ModifiedBy INT;

EXECUTE [dbo].[SP_InsertTraining] @Code ='Elceeeeee'
								  ,@Name ='Electricidad Industrial'
								  ,@Instructor ='Romero Carlos'
								  ,@Area_Id =1
								  ,@ModifiedBy = 100;
*/
 /*
DECLARE @IdTraining INT;
DECLARE @Code VARCHAR(10);
DECLARE @Name VARCHAR(30);
DECLARE @Instructor VARCHAR(50);
DECLARE @Area_Id INT;
DECLARE @ModifiedBy INT;

EXECUTE [dbo].[SP_UpdateTraining] @IdTraining = 2
								,@Code ='Elc-002'
								,@Name = 'qimbol'
								,@Instructor = 'Romero Carlos'
								,@Area_Id = 1
								,@ModifiedBy = 100;
*/
/*
DECLARE @IdTraining INT;
EXECUTE [dbo].[SP_DeleteTraining] @IdTraining = 1
*/