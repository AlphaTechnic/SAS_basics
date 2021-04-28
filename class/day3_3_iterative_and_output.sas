data a;
	do i = 0 to 10 by 2;
		input data @@;
		output;
	end;
	cards;
	1 2 3 4 5 6
	;

proc print data=a; run;