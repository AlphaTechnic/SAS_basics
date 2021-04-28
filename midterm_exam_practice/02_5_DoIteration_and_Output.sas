/* 
DO 반복문은 반복의 최종값만을 데이터 셋에 저장시킨다.
반복되는 과정의 값들을 활용하고 싶을 때는 output 명령어로 
어딘가(column 혹은 새로운 data set)에 밀어 내면 된다.

1. column에 밀어넣거나 -> output;
2. table에 밀어넣거나 -> output some_data_set;
*/

/* 1. index column 만들어보기*/
data col;
do i = 0 to 6 by 2;
input data @@;
/*밑의 output을 없애보면, 반복의 최종값만이 데이터셋에 저장되는걸 볼 수 있다.*/
output;
end;

cards;
1 2 3 4 5 6
;

proc print data=col;
run;


/* 2. 새로운 table에 넣어버리기 */
data a under3 over3;
input data @@;
if data < 3 then output under3;
else output over3;

cards;
1 2 3 4 5 6
;

proc print data=under3;
run;
proc print data=over3;
run;