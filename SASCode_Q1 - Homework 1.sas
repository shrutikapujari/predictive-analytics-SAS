PROC IMPORT OUT= WORK.pizza 
            DATAFILE= "C:\Users\rxr180059\Downloads\Pizza(3).csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;


	proc print data=pizza;
	title 'Pizza'; 
	run; 

	proc contents data=pizza;
	run; 


/**********************************************************************
 *   PRODUCT:   SAS
 *   VERSION:   9.4
 *   CREATOR:   External File Interface
 *   DATE:      02JUN24
 *   DESC:      Generated SAS Datastep Code
 *   TEMPLATE SOURCE:  (None Specified.)
 ***********************************************************************/
    data WORK.pizza    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'C:\Users\rxr180059\Downloads\Pizza(3).csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
       informat SurveyNum best32. ;
       informat Arugula best32. ;
       informat PineNut best32. ;
       informat Squash best32. ;
       informat Shrimp best32. ;
       informat Eggplant best32. ;
       format SurveyNum best12. ;
       format Arugula best12. ;
       format PineNut best12. ;
       format Squash best12. ;
       format Shrimp best12. ;
       format Eggplant best12. ;
    input
                SurveyNum
                Arugula
                PineNut
                Squash
                Shrimp  
                Eggplant  
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;

	proc print data=pizza;
	title 'Pizza'; 
	run; 

	proc contents data=pizza;
	run; 

data pizzatoppingrating;
set pizza; 



proc print data = pizzatoppingrating; 
run; 




