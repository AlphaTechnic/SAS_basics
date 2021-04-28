/* 
SET의 2가지 기능

1. 만든 data를 불러들임 (set A)
2. 세로 병함 (set A B)
*/

/* SET 기능 1 */
data tire;
input fact$ tire @@;
cards;
A1 49 A1 73 A1 58
A2 31 A2 40
A3 46 A3 31
A4 45 A4 73
;
run;

data tire2;
set tire;
if tire > 40 then class = 1;
else class = 2;
run;

proc print data=tire2;
run;


/* SET 기능 2 */
data set1;
input A1-A3;
cards;
1 2 3
4 5 6
;
run;

data set2;
input A1 A2 A4;
cards;
7 8 9
10 11 12
;
run;

data set_merge_vertical;
set set1 set2;
run;

proc print data=set_merge_vertical;
run;


