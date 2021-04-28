/* proc BOXPLOT 실습 */
/* proc boxplot은 반드시 반드시 sorting을 하고 써야한다. */
/* plot y*x이다. */

data cholest;
input gender$ age super @@;
cards;
M 23 40 M 64 88 M 66 110 M 31 86 M 55 137
M 48 78 M 58 111 M 31 88 M 27 80 M 25 86
F 57 84 F 33 86 F 23 35 F 42 116 F 49 76
F 35 55 F 49 73 F 44 89 F 50 127 F 60 87
;
run;

proc sort data=cholest;
by gender;
run;

proc boxplot data=cholest;
plot age*gender / boxstyle=skeletal;
plot age*gender / boxstyle=schematic;
run;