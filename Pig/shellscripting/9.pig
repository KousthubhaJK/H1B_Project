h1b = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage('\t') as (s_no:chararray,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage,year,worksite:chararray,longitute:double,latitute:double);

jk1 = group h1b ALL;
jk2 = foreach jk1 generate COUNT(h1b.soc_name)as totalApplications;
recd = foreach h1b generate employer_name,case_status;
fil_succ = FILTER recd by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
recd1 = foreach fil_succ generate employer_name,case_status;
groupby = group recd1 by employer_name;
coutofEmpl = foreach groupby generate $0,COUNT(recd1.case_status) as cerftifiedApplications;

percnt = foreach coutofEmpl generate $0,(cerftifiedApplications/(double)jk2.totalApplications)*100;

ordr = order percnt by $1 desc;
lim = LIMIT ordr 10;
