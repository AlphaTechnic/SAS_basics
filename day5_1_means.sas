/* means 
일변량 자료의 평균, 표준편차, 최대, 최소 등의 정보를 제공
*/

data score;
input dept$ gender$ age score @@;
cards;
stat m 10 94
stat f 10 96
math m 20 71
math f 20 66
math m 15 81
;
run;

proc means data=score;
class dept;
var age;
run;
