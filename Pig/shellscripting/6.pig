h1b = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage('\t') as (s_no:chararray,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage,year,worksite:chararray,longitute:double,latitute:double);

bag1 = group h1b ALL;
bag2 = foreach bag1 generate COUNT(h1b.soc_name)as totalApplications;
jk = foreach h1b generate year,case_status;
group = GROUP jk by year;
count = foreach grp generate $0,COUNT($1) as case_application;

percnt = foreach count generate $0,ROUND_TO(((case_application/(double)totalrec.totalApplications)*100),2);

ordr = order percnt by $1 desc;
