data a;
	input x @@;
	total = x + total;
	retain total 0;
	cards;
	1 2 3 4 5 6 7 8 9 10
	;
	run;

proc print data=a; run;
	