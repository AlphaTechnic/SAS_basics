/* proc FREQ 에 weight 옵션을 거는 경우 실습 */
/* 이미 활용할 자료 자체가 '도수'를 구해놨다면, 구해놓은 것을 가져다 써야지
SAS보고 구하라고 하면 안된다. '도수'를 이 column으로 해라 라는 옵션 */

data drink;
input age drink$ count @@;
cards;
18 A 10 19 A 13 20 A 12
18 B 14 19 B 7 20 B 4
18 C 2 19 C 10 20 C 6
18 D 12 19 D 8 20 D 10
;
run;

proc freq data=drink;
/*-----이것을 도수로 하시오-----*/
weight count;
/*----------------------------*/
tables age*drink / nocol nopercent;
run;
