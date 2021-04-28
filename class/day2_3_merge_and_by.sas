data a;
	input a1-a3;
	cards;
	1 2 3
	4 5 6
	;
data b;
	input a1 a2 a4;
	cards;
	1 2 3
	7 8 9
	;
data new1; 
	merge a b;
proc print; run;

data new2;
	merge a b;
	by a1;
proc print; run;