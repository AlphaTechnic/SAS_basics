/* proc FREQ 실습 */
/* 도수분포표 개념. 변량들 기본적으로 알파벳 순 혹은 오름차순(숫자)으로 제시되는데,
order=data는 이를 "읽어들인 순서"로 바꾸는 option이다.*/

data score;
input dept$ gender$ age score @@;
datalines;
Stat M 10 94 Stat F 10 96 Stat M 15 91 Stat M 15 86
Stat F 10 76 Stat M 20 88 Math M 20 71 Math F 20 66
Math M 15 81 Math F 10 77 Math F 15 55 Math F 20 78
;
run;

proc freq data=score order=data;
tables dept gender dept*gender;
tables dept*gender / norow nopercent;
run;
