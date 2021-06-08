/* 동질성 검정 */
/* 카이제곱 0.4 쯤되니 기각못함. 연령별 음료수 선호도차이가 없다. */

data soft;
input age$ beverage$ count @@;
cards;
20대 coke 10 20대 pepsi 14 20대 fanta 4 20대 others 12
30대 coke 13 30대 pepsi 9 30대 fanta 10 30대 others 8
40대 coke 12 40대 pepsi 8 40대 fanta 10 40대 others 10
;
run;


proc freq data=soft order=data;
weight count;
exact fisher;
tables age*beverage / nocol nopercent expected chisq;
run;
 