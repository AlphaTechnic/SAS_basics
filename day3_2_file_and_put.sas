data a;
	input a1-a3;
	sum = a1+a2+a3;
	cards;
	1 2 3
	4 5 6
	;
data b;
	set a;
	file "~/data.txt";
	put a1 a2 a3 sum;
run;