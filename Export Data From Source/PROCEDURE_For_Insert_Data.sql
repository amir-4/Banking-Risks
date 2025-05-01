
CREATE OR ALTER PROCEDURE dbo.Load_Data AS
	BEGIN 
	DECLARE @Start_Time DATETIME , @End_Time DATETIME 
	SET @Start_Time = GETDATE()
	BEGIN TRY
		PRINT '------------------------------------------------' ;
		PRINT 'LOADING THE DATA';
		PRINT '------------------------------------------------' ;

		TRUNCATE TABLE Banking_Data ; 

		BULK INSERT Banking_Data 
		FROM 'E:\Projects\Banking Risks\Dataset\Banking.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	SET @End_time = GETDATE() ;
			PRINT 'THE LOAD DURATION : ' + CAST (DATEDIFF(second , @Start_Time , @End_time)AS NVARCHAR)+ ' SECONDS' 
			PRINT '------------------------------'
	END TRY
BEGIN CATCH
		PRINT'===================================='
		PRINT 'ERROR OCCUR WHEN LOADING DATA' ;
		PRINT 'Erorr Massege' + ERROR_MESSAGE();
		PRINT 'Erorr Massege' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Erorr Massege' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT'===================================='
END CATCH

END

EXEC dbo.Load_Data;

