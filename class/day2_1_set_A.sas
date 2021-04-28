data tire;
input fact $ tire @@;
cards;
a1 49 a1 73 a1 58 a2 31
;
run;

data tire2;
	set tire;
	if tire > 50 
		then class = 1;
	else
		class = 2;
run;

proc print data=tire2;
run;