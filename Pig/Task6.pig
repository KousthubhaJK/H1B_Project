6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.

bag1 = group h1b ALL;
bag2 = foreach bag1 generate COUNT(h1b.soc_name)as totalApplications;


dis = foreach h1b generate year,case_status;
grp = GROUP dis by year;
cunt = foreach grp generate $0,COUNT($1) as case_application;

perc = foreach cunt generate $0,ROUND_TO(((case_application/(double)totalrec.totalApplications)*100),2);

odr = order perc by $1 desc;
