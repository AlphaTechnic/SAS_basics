/* 내가 읽어들일 자료가 이미 정리가 된 것이라면 weight를 쓸 수 있다*/
data drink;
input age drink$ count @@;
cards;
18 a 10 19 a 13 20 a 12
18 b 14 19 b 7 20 b 4
18 c 2 19 c 10 20 c 6
18 d 12 19 d 8 20 d 10
;
run;

proc freq data=drink;
/*count로 weight을 적어라. 제거하고 실행해보기*/
weight count;
tables age*drink / nocol nopercent;
run;