/* 20121277 김주호 */

data factory;
input id loc scale last this sales h_cost b_cost;
nprofit = sales - h_cost - b_cost;

if scale >= 120 then size='Large';
else size='Small';

cards;
1 0 244 128 385 23521 5230 5344
2 1 59 155 203 9160 2459 493
3 0 120 281 312 21900 6304 6115
4 0 120 291 319 22354 6590 6346
5 0 120 238 313 17421 5362 6225
6 1 65 180 234 10531 3622 449
7 1 120 306 302 22147 4406 4998
8 1 90 214 305 14025 4173 966
9 0 96 155 169 8812 1955 1260
10 1 120 133 188 11729 3224 6442
;

/*1*/
proc rank data=factory out=rankout ties=low descending;
var nprofit;
ranks rnprofit;
run;

proc sort data=rankout;
by rnprofit;
run;

proc print data=rankout;
run;

/*2*/
proc freq data=factory order=data;
tables size loc*size; 
run;

data Size;
input Large_or_small$ count @@;
cards;
Large 6 Small 4
;
run;

proc freq data=Size order=data;
weight count;
exact binomial;
tables Large_or_small /
	binomial (p = 0.55);
run;


/*3*/
proc means data=factory maxdec=2 mean std median cv;
class size;
var nprofit;
run;

proc means data=factory clm alpha=0.02;
var nprofit;
run;

/* sort */
proc sort data=factory;
by size;
run;

proc boxplot data=factory;
plot nprofit*size 
	/ boxstyle=schematic; /* 이상치를 쩜으로 표시해줌 */
run;

/*4*/
proc means data=factory maxdec=2 mean;
var last this;
output out= aa;
run;


data last_and_this;
input last_or_this$ day @@;
if last_or_this = 'last' then day = day + 50;
cards;
last 128 last 155 last 281 last 291 last 238
last 180 last 306 last 214 last 155 last 133
this 385 this 203 this 312 this 319 this 313
this 234 this 302 this 305 this 169 this 188
;

proc ttest data=last_and_this;
class last_or_this;
var day;
run;


/*5*/
proc ttest data=factory;
class size;
var nprofit;
run;