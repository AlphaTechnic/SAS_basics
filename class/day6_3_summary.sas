data score;
	input dept$ gender$ age score @@;

datalines;
stat m 10 94 stat f 10 96 stat m 15 91 stat m 15 86
stat f 10 76 stat m 20 88 math f 20 66 math m 20 71
math m 15 b81 mth f 10 77 math f 15 55 math f 20 78
;
run;

proc summary data=score;
class dept gender;
var age score;
output out=n_score mean = a_mean s_mean;
run;

proc print data=n_score;
run;