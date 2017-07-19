2b) find top 5 locations in the US who have got certified visa for each year?
   
 fil = FILTER h1b by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
 dis =foreach fil generate worksite,year;
 grp2013 = group dis by (worksite,year);
 cunt2013 = foreach grp2013 generate $0.year,$0.worksite,COUNT(dis.$0) as Visa;
 yr = group cunt2013 by $0;
 top5 = foreach yr { sorted = order cunt2013 by Visa desc ; top = limit sorted 5 ; generate flatten(top); };

 dump top5;

