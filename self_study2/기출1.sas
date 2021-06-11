/*1*/
/*
표본을 뽑은 방법이 샘플을 임의로 한꺼번에 채취한 뒤 조사하여 분류한 방식이므로
동질성 검정이 아닌 독립성 검정을 하는 것이 적절하다.
*/

/*
data AA;
input man$ wom$ count @@;
cards;
l l 18 m l 28 s l 14
l m 20 m m 51 s m 28
l s 12 m s 25 s s 9
;
run;

proc freq data=AA order=data;
weight count;
exact fisher;
tables man*wom / nocol nopercent expected chisq measures;
run;
*/
 
/*
H0: 남편의 신장과 부인의 신장은 독립적이다 기각못함. 남편의 신장과 부인의 신장은 독립적
연관성 측도 / ASE가 대략적으로 2미만이다. -> H0: 연관성 없다 를 5% 유의수준에서 기각못함
*/

/*2*/
/*
data BB;
input num x y @@;
cards;
01 20 10 02 30 16 03 40 22 04 50 30 05 60 35
06 70 40 07 80 45 08 90 50 09 100 60 10 25 15
;
run;

proc reg data=BB;
model y=x /dw noint;
plot y*x;
run;
quit;
*/
/*
(1)
H0: b0=0 에 대한 p-value가 0.05 이상이어서 5% 유의수준 내에서 기각 못함. b0=0 -> no int 적용
H1: b1=0 에 대한 p-value가 0.01 이하여서 1% 유의수준 내에서 기각. b1 = 0.57489


(2)
2행1열 (2, 1) 라고 표현하여 답안작성
결과 matrix의 (1, 1), (1, 2)를 보면, 데이터가 고르게 분포되어있다. -> 등분산
결과 matrix의 (2, 1), (3, 1)를 보면, 데이터의 분포가 정규성을 만족함을 알 수 있다.
dw 값이 2에 가깝다 -> 독립
결과 matrix의 (2, 2)를 보면, 데이터의 분포가 linear한 모형에 적합함을 알 수 있다. 
*/

/*3*/
/* lsd 다중비교 */
/* H0 기각이 되서, 유의미한 차이가 있다... 라고 되었을 때, 
그럼 어디에서?? 를 추적하는 중 */
/*
data CC;
input color$ time @@;
cards;
r 71 r 24 r 52 r 24 r 62 r 44 r 27 r 26 r 45 r 29
b 19 b 35 b 54 b 37 b 16 b 27 b 18 b 25 b 33 b 44
y 66 y 26 y 36 y 38 y 76 y 85 y 27 y 80 y 64 y 50
g 20 g 26 g 46 g 16 g 32 g 37 g 22 g 19 g 24 g 45 
;
run;

proc anova data=CC;
class color;
model time=color;
means color/ lines alpha=0.01 lsd;
means color/ hovtest=bartlett;
run;
quit;
*/
/*
(1)
p-value 0.01 이하이므로 수준(색깔)마다 (관심도) 유의한 차이가 있다고 할 수 있다. 
(2)
빨강과 초록은 유의한 차이가 있지 않다.
*/

/*4*/
data DD;
input gender grade prepare1 prepare2 prepare3 prepare4 env1 env2 att1 att2 need tot @@;
pre_aver = (prepare1 + prepare2 + prepare3 + prepare4) / 4;
env_aver = (env1 + env2) / 2;
att_aver = (att1 + att2 / 2;

cards;
1 1 5 5 5 3 3 4 5 3 5 4
1 1 5 5 5 5 5 4 4 4 5 4
1 1 3 3 2 4 4 5 4 3 3 4
1 1 4 5 3 5 4 4 4 3 2 4
1 2 5 4 5 5 4 3 3 5 4 5
1 2 2 2 2 4 4 4 4 3 3 2
1 2 4 3 4 5 5 4 3 2 2 3
1 2 5 4 5 5 4 3 4 4 2 4
1 3 4 3 4 1 2 3 2 3 4 3
1 2 2 3 2 5 4 5 4 2 3 3
2 3 3 2 2 4 4 3 3 4 4 3
2 2 4 4 4 4 4 3 4 3 4 4
2 4 3 4 4 4 4 3 2 3 3 4
2 3 4 4 3 4 2 3 2 3 3 3
2 4 3 3 2 4 4 3 3 4 3 3
2 3 4 4 3 5 4 3 5 3 2 4
2 1 4 3 4 3 4 4 3 2 2 3
2 3 2 2 3 5 4 3 4 3 4 2
2 1 4 3 4 4 3 4 3 3 2 3
2 4 4 4 4 4 4 3 3 3 4 4
1 2 3 2 2 3 4 3 3 2 3 3
1 4 4 3 4 4 3 4 3 3 4 4
1 3 4 4 4 4 4 4 4 4 4 4
1 2 3 3 3 3 3 3 3 3 3 3
1 2 4 3 4 4 3 3 3 3 4 4
1 4 3 3 3 4 4 3 4 3 3 3
;
run;

/*(1)*/
/*
proc anova data=DD;
class grade;
model pre_aver=grade;
means grade/ lines alpha=0.01 lsd;
means grade/ hovtest=bartlett;
run;
quit;
*/
/* 차이나지 않음 p-value가 0.05보다 커서 5% 이내 유의수준에서 기각못함. */

/*(2)*/

proc reg data=DD;
model tot = pre_aver env_aver / 
stb selection=backward slstay=0.15;
run;
