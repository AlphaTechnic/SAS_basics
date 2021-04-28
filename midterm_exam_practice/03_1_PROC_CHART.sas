/* (G)CHART */

/* SAS를 이용하여 수직축이 "상대도수"인 막대그래프를 그려보는 예제*/
/*
지하철 : 110명
승용차 : 90명
버스 : 60명
지하철 + 버스 : 40명
*/

data traffic;
input kind$ count @@;

cards;
sub 110
car 90
bus 60
sub_bus 40
;
run;

proc CHART data=traffic;
vbar kind
	/ freq=count type=percent;
pie kind
	/ freq=count;
run;