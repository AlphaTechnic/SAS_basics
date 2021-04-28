data traffic;
	input kind $ count;
	cards;
	sub 110
	car 90
	bus 60
	sub_bus 40
	;
run;

proc chart data=traffic;
	hbar kind / freq=count type=freq;
	pie kind / freq=count;
run;