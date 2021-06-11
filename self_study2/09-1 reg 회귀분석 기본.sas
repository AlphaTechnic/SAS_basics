/* 09-1 reg 회귀분석 기본 */
/* 회귀분석 기본*/

data adsales;
input company adver sales @@;
cards;
01 11 23 02 19 32 03 23 36 04 26 46 05 56 93
06 62 99 07 29 49 08 30 50 09 38 65 10 39 70
11 46 71 12 49 89
;
run;

proc reg data=adsales;
model sales=adver /dw noint;
plot sales*adver;
run;
quit;