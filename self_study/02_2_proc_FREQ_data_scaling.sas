/* proc FREQ 에서 변량을 scaling하기 */
/* 'DATA 선언하는 단'에서 처리를 해줘야함*/

data score;
input dept$ gender$ age score @@;

if score >= 90 then score_scaled='90점대';
else if score >= 80 then score_scaled='80점대';
else score_scaled='기타';

datalines;
Stat M 10 94 Stat F 10 96 Stat M 15 91 Stat M 15 86
Stat F 10 76 Stat M 20 88 Math M 20 71 Math F 20 66
Math M 15 81 Math F 10 77 Math F 15 55 Math F 20 78
;
run;

proc freq data=score order=data;
tables dept gender dept*score_scaled;
tables dept*score_scaled / norow nopercent;
run;