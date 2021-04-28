/* PROC MEANS
주의1. var
통계량을 구해야하는 대상을 VAR로 지정해줘야한다.
이걸 안하면, int 변수를 갖는 column 전부에 대하여 통계량을 조사하기 때문에 난잡해진다.

주의2. by
by 구문을 쓸때는 반드시 sort를 선행한다.

주의3. default
default로 5가지의 통계량 : N(자료의 수), mean, std dev(표준편차), min, max
를 조사해주는데, 다른 지표를 조사한답시고 option을 주면,
기존 default 5개에 option에 건 지표를 추가로 얹는 것이 아닌
기존 default를 '지우고' option을 보여주기 때문에, 기존 default를 모두 일일이 입력을 해줘야만 한다.

주의4. 출력
proc means는 '출력'까지를 자동으로 해주므로, proc print가 필요 없다.

주의5. maxdec=2
proc means에만 먹히는 명령어로 소숫점 아래 2자리 까지만 보여주는 옵션이다.
*/

data score;
input dept$ gender$ age score @@;
cards;
Stat M 11 94 Stat F 10 96 Stat M 15 91 Stat M 15 86
Stat F 10 76 Stat M 20 88 Math M 20 71 Math F 20 66
Math M 15 81 Math F 10 77 Math F 15 55 Math F 20 78
;
run;

proc means data=score maxdec=2;
class dept;
var age;
run;

/* class 혹은 var에 tuple을 맥일 수도 있다. */
proc means data=score maxdec=2;
class dept gender;
var age score;

output out = scoreout
	mean (age score) = m_age m_score
	std (age score) = s_age s_score;
run;

proc print data=scoreout;
run;