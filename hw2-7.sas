/* 2-7 */
data pulse;
	input pulse_per_min @@;
	
	if _N_ <= 22 then smoking='Before';
	else smoking='After';
	
	if pulse_per_min >= 74 then pulse_scaled='74 이상';
	else if pulse_per_min >= 73 then pulse_scaled='73 이상 74미만';
	else if pulse_per_min >= 72 then pulse_scaled='72 이상 73미만';
	else if pulse_per_min >= 71 then pulse_scaled='71 이상 72미만';
	else if pulse_per_min >= 70 then pulse_scaled='70 이상 71미만';
	else if pulse_per_min >= 69 then pulse_scaled='69 이상 70미만';
	else if pulse_per_min >= 68 then pulse_scaled='68 이상 69미만';
	else if pulse_per_min >= 67 then pulse_scaled='67 이상 68미만';
	else if pulse_per_min >= 66 then pulse_scaled='66 이상 67미만';
	else if pulse_per_min >= 65 then pulse_scaled='65 이상 66미만';
	else pulse_scaled='65미만';

	cards;
	72 70 68 67 73 71 72 70 69 70 68
	72 69 66 73 71 70 72 70 69 72 73
	74 72 69 68 72 72 72 71 67 73 69
	71 68 74 73 70 74 68 71 74 74 69
	;
run;

proc print data=pulse;
run;

proc sort data=pulse;
by smoking;
run;

/* (가) 흡연 before, after 각각 도수분포표, 히스토그램, 기술통계량(평균, 중위수, 표준편차) */
/* 도수분포표 */
proc freq data=pulse order=data;
tables pulse_scaled;
by smoking;
run;

/* 히스토그램 */
proc univariate data=pulse;
class smoking;
histogram pulse_per_min /
outhistogram=outhisto
vaxis=0 to 30 by 5
midpoints=63 to 75 by 1
nrow=2 ncol=1;
run;

/* 기술통계량 */
proc means data=pulse maxdec=2 N mean median max min std CV;
var pulse_per_min;
class smoking;
run;


/* (나) 자료 분석 */
/* 흡연 이후의 분당 맥박 수가 흡연 이전의 분당 맥박수보다 
평균은 0.82, 중위수는 1.50, 최댓값은 1.00, 최솟값은 1.00 정도 더 높다.
표준편차와 CV 값도 흡연 이후의 분당 맥박 수가 더 커서
data의 흩어진 정도도 흡연 이후가 좀 더 크다고 할 수 있다.*/