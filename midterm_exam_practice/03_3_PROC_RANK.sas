/* PROC RANK */

data cholest;
input gender$ age super @@;
label gender='성별';

cards;
M 23 40 M 64 88 M 66 110 M 31 86 M 55 137
F 57 84 F 33 86 F 23 35 F 42 116 F 49 76
F 52 86
;
run;

proc rank data=cholest out=rankout ties=low descending;
where gender='F';
var super;
ranks r_super;
run;

proc sort data=rankout;
by r_super;
run;

proc print data=rankout;
run;