
9) Which are top ten employers who have the highest success rate in petitions?


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
dump lim;


output:-

(INFOSYS LIMITED,4.329538093120773)
(TATA CONSULTANCY SERVICES LIMITED,2.141488020596547)
(WIPRO LIMITED,1.57518289260919)
(DELOITTE CONSULTING LLP,1.203285988585969)
(ACCENTURE LLP,1.1072309401171379)
(IBM INDIA PRIVATE LIMITED,0.9993521946280448)
(MICROSOFT CORPORATION,0.8355856643502212)
(HCL AMERICA, INC.,0.7497889220285467)
(ERNST & YOUNG U.S. LLP,0.5954147369893537)
(LARSEN & TOUBRO INFOTECH LIMITED,0.5606763820819366)

