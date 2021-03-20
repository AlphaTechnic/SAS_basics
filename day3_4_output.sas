data a b1 b2;
	input data @@;
	if data < 3
		then output b1;
	else output b2;
	cards;
	1 2 3 4 5
	;

proc print data=b1; run;
proc print data=b2; run;