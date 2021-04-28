/* proc univariate HISTOGRAM 실습*/
/* histogram은 univariate 안에서 쓰는 option이라는 것을 기억 */

data cholest;
input gender$ age super @@;
cards;
M 23 40 M 64 88 M 66 110 M 31 86 M 55 137
M 48 78 M 58 111 M 31 88 M 27 80 M 25 86
F 57 84 F 33 86 F 23 35 F 42 116 F 49 76
F 35 55 F 49 73 F 44 89 F 50 127 F 60 87
;
run;

proc univariate data=cholest;
class gender;
histogram age / 
/* hitogram 안에서 먹히는 option문들*/
outhistogram=outhisto
cfill=orange vaxis=0 to 40 by 5
midpoints = 10 to 80 by 10 nrow=2 ncol=1;
/*--------------------------------*/
run;
