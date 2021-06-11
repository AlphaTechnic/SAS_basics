/* 기출 2 */


data AA;
input num size income fams edu;
if size >= 24 then size_type = 1;
else size_type = 2;

if fams <= 2 then family_type = 1;
else if fams <= 4 then family_type = 2;
else family_type = 3;


cards;
1 16 22 2 12
2 17 22 2 16
3 26 26 3 15 
4 24 45 4 9
5 22 37 4 11
6 21 50 3 18
7 32 56 6 16
8 18 34 3 16
9 30 60 5 10
10 20 40 2 12
;
run;



/*1*/
/*
proc anova data=AA;
class size_type;
model income=size_type;
means size_type/ lines alpha=0.01 lsd;
means size_type/ hovtest=bartlett;
run;
quit;
*/

/*
H0 : 연소득이 차이나지 않음 을 유의수준 5%이내에서 기각하지 못함. 차이나지 않음
*/

/*2*/
/*
proc anova data=AA;
class family_type;
model size=family_type;
means family_type/ lines alpha=0.03 duncan;
means family_type/ hovtest=bartlett;
run;
quit;
*/
/* 
H0 : 유의한 차이가 없다 를 기각 (H0에 대한 p -value가 0.01보다 작아서 1% 유의수준 내에서 기각됨)
family_type 3와 1,2가 유의한 차이가 난다.
*/

/*
proc glm;
class family_type;
model size=family_type;
contrast '1 2 vs 3' family_type .5 .5 -1;
means family_type / lsd;
run;
quit;
*/

/* 
H0 : family_type 1, 2와 3는 유의한 차이가 없다 를 기각 (H0에 대한 p-value가 0.01보다 작아서
1% 유의 수준 내에서 기각됨)
*/

/*3*/
/*
proc reg data=AA;
model size = income fams edu/ 
stb selection=backward slstay=0.05;
run;
*/

/*
b0 = 10.45122, fams의 회귀계수= 3.57317
두 데이터 모두 p-value가 0.05 이하여서 5% 유의수준 내에서 H0 : 회귀계수=0 을 기각.
income 과 edu의 회귀계수는 p-value가 0.05를 넘어서 기각할 수 없다.
선택된 변수 fams
*/


/*4*/
/*
proc reg data=AA;
model size=fams /dw;
plot size*fams;
run;
quit;
*/

/*
(2, 1), (3, 1)을 보면 정규성 만족
(1, 1), (1, 2)을 보면 등분산 만족
dw 값이 2근처 -> 독립성

/*5*/

proc freq data=AA order=data;
exact fisher;
tables family_type*size_type / nocol nopercent expected chisq;
run;


/* H0: 독립이다에 대한 p-value가 0.0821이어서 5% 유의수준 내에서 기각하지 못함. 
family_type과 size_type은 유의한 차이가 없다. 독립이다.*/