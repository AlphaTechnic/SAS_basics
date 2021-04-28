data exam;
	input name $ sex $ dept $ age height weight @@;
	cards;
	김철수 m stat 20 170 67
	강민호 m stat 25 169 70
	;
run;

proc sort data=exam out=exam1;
by descending age;
run;

proc print data=exam;
run;
proc print data=exam1;
run;