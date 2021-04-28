/* 
MERGE는 기본적으로 뒤의 data set 정보를 추가 및 업뎃 해주는거.

1. by 구문 미사용 -> rear의 data set으로 업뎃. rear로 덮어쓴다고 보면 됨.
2. by 구문 사용 
	-> by A1 a1의 값이 같으면 같은 사람으로 인식하고 다르면 추가하자는 개념. 반드시 sort를 선행해야함
*/

data front;
input a1-a3;
cards;
1 2 3
4 5 6
;
run;

data rear;
input a1 a2 a4;
cards;
4 8 9
10 11 12
;
run;

data new1;
merge front rear;
run;

proc print data=new1;
run;

/* by구문! SORT 선행함*/
proc sort data=front;
by a1;
run;
proc sort data=rear;
by a1;
run;

data new2;
merge front rear;
by a1;
run;

proc print;
run;