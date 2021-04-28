/* PROC PRINT 

label 옵션
var 옵션
by 옵션
정도의 의미를 보면 좋을듯
*/

data health;
input id gender$ age weight height;
cards;
101 M 14 59.0 167.5
102 F 13 56.5 160.0
103 F 13 55.0 156.0
104 M 14 62.5 169.5
105 M 13 60.5 170.0
;
run;

proc sort data=health out=s_health;
by age; /* 오름차순 정렬*/
run;

/*title이랑 footnote 같은 것을 쓸 수가 있었음!*/
title '키와 몸무게 자료에 의한 통계분석 실습';
footnote '통계학 및 실습 -- <실습자료>';
proc print data=s_health;
var id weight height;
by age;
id gender;
label 
	gender='성별'
	age='나이'
	weight='몸무게'
	height='키'
	id='고유번호';
run;

