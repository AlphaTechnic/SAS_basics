/*freq*/
data score;
	input dept$ gender$ age score @@;
datalines;
stat m 10 94 stat f 10 96 stat m 15 91 stat m 15 86
stat f 10 76 stat m 20 88 math m 20 71 math f 20 66
math m 15 81 math f 10 77 math f 15 55 math f 20 78
;
run;

/*order 주는게 필요할 때가 있다.*/
proc freq data=score order=data;
tables dept gender age score dept*gender;
tables dept* gender/ norow nopercent;
run;