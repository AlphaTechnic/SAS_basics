data set1;
	input a1-a3;
	cards;
	1 2 3
	4 5 6
	;
data set2;
	input a1 a2 a4;
	cards;
	7 8 9
	1 2 3
	;
data set3;
	set set1 set2;
run;

proc print data=set3; run;