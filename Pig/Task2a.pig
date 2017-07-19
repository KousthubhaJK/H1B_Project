2 a) Which part of the US has the most Data Engineer jobs for each year?
pig-script:
```````````


dis =foreach H1B generate worksite,job_title,year;
fil2011 = FILTER dis by job_title == 'DATA ENGINEER';
grp2011 = group fil2011 by (worksite,year);
cunt2011 = foreach grp2011 generate group,COUNT(fil2011.$0) as mostData;
odr2011 = ORDER cunt2011 by $1 desc;
lim2011 = LIMIT odr2011 1;


dis =foreach H1B generate worksite,job_title,year;
fil2012 = FILTER dis by job_title == 'DATA ENGINEER';
grp2012 = group fil2012 by (worksite,year);
cunt2012 = foreach grp2012 generate group,COUNT(fil2012.$0) as mostData;
odr2012 = ORDER cunt2012 by $1 desc;
lim2012 = LIMIT odr2012 1;

dis =foreach H1B generate worksite,job_title,year;
fil2013 = FILTER dis by job_title == 'DATA ENGINEER';
grp2013 = group fil2013 by (worksite,year);
cunt2013 = foreach grp2013 generate group,COUNT(fil2013.$0) as mostData;
odr2013 = ORDER cunt2013 by $1 desc;
lim2013 = LIMIT odr2013 1;


dis =foreach H1B generate worksite,job_title,year;
fil2014 = FILTER dis by job_title == 'DATA ENGINEER';
grp2014 = group fil2014 by (worksite,year);
cunt2014 = foreach grp2014 generate group,COUNT(fil2014.$0) as mostData;
odr2014 = ORDER cunt2014 by $1 desc;
lim2014 = LIMIT odr2014 1;


dis =foreach H1B generate worksite,job_title,year;
fil2015 = FILTER dis by job_title == 'DATA ENGINEER';
grp2015 = group fil2015 by (worksite,year);
cunt2015 = foreach grp2015 generate group,COUNT(fil2015.$0) as mostData;
odr2015 = ORDER cunt2015 by $1 desc;
lim2015 = LIMIT odr2015 1;


dis =foreach H1B generate worksite,job_title,year;
fil2016 = FILTER dis by job_title == 'DATA ENGINEER';
grp2016 = group fil2016 by (worksite,year);
cunt2016 = foreach grp2016 generate group,COUNT(fil2016.$0) as mostData;
odr2016 = ORDER cunt2016 by $1 desc;
lim2016 = LIMIT odr2016 1;

unionALL = union lim2011,lim2012,lim2013,lim2014,lim2015,lim2016;

