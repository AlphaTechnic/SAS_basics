/*
DELETE -> 관찰치의 삭제. if 구문과 함께 사용
*/

data list3;
input a1-a3;
sum = a1+a2+a3;
if sum < 10 then delete;

cards;
1 2 3
4 5 6
;
run;

proc print data=list3;
run;


