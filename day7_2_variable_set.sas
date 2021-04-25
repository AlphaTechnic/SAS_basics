/*freq*/
data score;
	input dept$ gender$ age score @@;
if score > 90 then score1='90점대';
else if score > 80 then score1='80점대';
else if score > 70 then score2='70점대';
else score1 = '기타';
datalines;
stat m 10 94 stat f 10 96 stat m 15 91 stat m 15 86
stat f 10 76 stat m 20 88 math m 20 71 math f 20 66
math m 15 81 math f 10 77 math f 15 55 math f 20 78
;
run;

/*order 주는게 필요할 때가 있다.*/
proc freq data=score order=data;
tables dept gender age score1 dept*gender;
tables dept* gender/ norow nopercent;
run;