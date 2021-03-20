data cholest;
	input gender $ age super @@;
	label gender='성별';
	cards;
	m 23 40 m 64 88
	f 30 66 f 25 69 f 57 84
	;
	
proc rank data=cholest out=rankout ties=low descending;
/* where gender='f'; */
var super;
ranks r_super;
run;

proc print data=rankout;
run;