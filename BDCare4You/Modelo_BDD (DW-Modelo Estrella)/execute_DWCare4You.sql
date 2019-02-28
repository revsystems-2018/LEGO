use Care4You;
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Employee';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Training';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Project';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Item';
EXECUTE [ETL].[PullDataToDatawarehouse] @table = 'Eventuality';

use DWCare4You;
EXECUTE [ETL].[DW_MergeEmployee];
EXECUTE [ETL].[DW_MergeTraining];
EXECUTE [ETL].[DW_MergeProject];
EXECUTE [ETL].[DW_MergeItem];
EXECUTE [ETL].[DW_MergeEventuality];

TRUNCATE TABLE [ETL].[Employee];
TRUNCATE TABLE [ETL].[Training];
TRUNCATE TABLE [ETL].[Project];
TRUNCATE TABLE [ETL].[Item];
TRUNCATE TABLE [ETL].[Eventuality];
