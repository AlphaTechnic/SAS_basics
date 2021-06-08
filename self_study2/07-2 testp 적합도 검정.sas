/* 적합도 검정*/
/* testp 9:3:3:1??   검정통계량 0.47쯤 되니 기각 못함. 9:3:3:1이 맞다*/

data bean;
input type count @@;
cards;
1 315 2 108 3 101 4 32
;
run;

proc freq data=bean;
weight count;
tables type / nocum testp=(0.5625, 0.1875, 0.1875, 0.0625);
run;
