data a;
	input a1-a3;
	sum = a1+a2+a3;
	cards;
	1 2 3
	4 5 6
	;
proc print data=a; run;

data b;
	set a;
	keep sum;
proc print; run;

data c;
	set a;
	drop sum;
proc print; run;