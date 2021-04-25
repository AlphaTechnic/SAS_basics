/* 20121277 김주호 */
/* 2장 연습문제 */

/* 2-3 */
data king;
	input name$ age @@;
	
	if _N_ <= 14 then war='Before';
	else war='After';
	agegroup=int(age/10)*10;
cards;
태조 73 정종 62 태종 45 세종 53 문종 38 
단종 16 세조 51 예종 28 성종 37 연산군 30
중종 56 인종 30 명종 33 선조 56 광해군 66
인조 54 효종 40 연종 33 숙종 59 경종 36
영조 82 정조 48 순조 44 헌종 22 철종 32
고종 67 순종 52
;
run;


/* (1) 임진왜란 전 후 각각에 대하여, 기술통계량, 줄기-잎그림, 상자그림 */
proc univariate data=king plot;
	var age;
	class war;
run;

/* (2) age(나이)의 최댓값, 최솟값, 중위수, 평균, 표준편차 등을 새로운 데이터셋에 저장 */
/* default 값에서 중위수(median)지표를 추가로 더 구하기 위한 작업을 한다. */
proc means data=king maxdec=2 mean std max min median;
	var age;
	class war;
	output out=kingout;
run;
/* for debuging */
proc print data=kingout;
run;

/* (3) agegroup에 대한 일차원빈도표, war*agegroup에 대한 이차원빈도표 */
proc freq data=king;
	tables war agegroup war*agegroup;
run;