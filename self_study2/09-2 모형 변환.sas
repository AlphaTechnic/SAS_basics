/* 09-2 모형 변환 */

data A;
input x y @@;
z = sqrt(y);
cards;
20 16.3 20 26.7 30 39.2 30 63.3 30 51.3 40 98.4 40 65.7
50 104.1 50 155.6 60 217.2
;
run;

proc reg data=A;
model y=z/ dw;
model y=x/ dw;
plot z*x;
run;