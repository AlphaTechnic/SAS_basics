/* PROC UNIVARIATE 

주의. by
by 구문을 쓰려면 하여튼, by (군집) 이 군집에 대하여 sort를 먼저 선행해야 탈이 없다.
*/

data cholest;
input gender$ age super @@;

cards;
M 23 40 M 64 88 M 66 110 M 31 86 M 55 137
M 48 78 M 58 111 M 31 88 M 27 80 M 25 86
M 20 80 M 32 47 M 63 106 M 23 65 M 62 74
M 43 66 M 43 79 M 36 58 M 67 123 M 27 87
M 29 88 M 48 90 M 63 56 M 27 73 M 19 112
M 59 110 M 65 118 M 26 52 M 53 106 M 42 67
M 60 57 F 30 66 F 25 69 F 40 65 F 38 52 
F 57 84 F 33 86 F 23 35 F 42 116 F 49 76
F 35 55 F 49 73 F 44 89 F 50 127 F 60 87
F 63 142 F 47 77 F 23 76 F 27 58 F 36 91
F 48 107 F 23 98 F 74 128 F 44 84 F 56 146
F 53 75 F 37 120 F 41 80 F 41 82 F 57 123
;
run;

proc sort data=cholest;
by gender;
run;


proc univariate data=cholest;
class gender;
histogram age / 
	outhistogram=outhisto
	vaxis=0 to 40 by 5 /* y축(vertical) 지정. y축은 항상 '백분위' */
	midpoints=10 to 80 by 10 /* x축 지정 */
	nrow=2 ncol=1;
run;

/* 이게 도수분포표를 출력해줌. hw 잘못 제출함..ㅜ */
proc print data=outhisto label;
run;

/* '평균'과 '표준편차'를 비롯한 다양한 통계량들을 tuple을 맥여서 구해보자. output out 이용 */
proc univariate data=cholest;
by gender;
var super age; /* 변수 tuple로 맥임 */

output out=univ_out
	mean=s_mean a_mean std=s_std a_std
	pctlpts=33.3 66.6 /* Percent Line Points 지정하고자하는 퍼센트를 차례로 나열 */
	pctlpre=s_p a_p;
	
label super='콜레스테롤 과포화율' age='나이';
run;

