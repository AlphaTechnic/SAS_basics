/*숙제 1 - MERGE와 SET의 차이를 묻고 있음
MERGE -> 가로 병합
SET -> 세로 병합
*/

data data1;
input class num name$ gender$ major$ age loc$;

cards;
1 1 김승현 M 통계 20 서울
1 2 최경희 F 전산 20 광역시
;
run;

data data2;
input class num name$ test1-test4;

cards;
1 1 김승현 80 77 125 135
1 2 최경희 70 68 118 121
;
run;

data data3;
input class num name$ gender$ major$ age loc$;
cards;
2 1 강성혁 M 통계 21 서울
2 2 정수진 F 전산 22 서울
;
run;

data data4;
input class num name$ test1-test4;
cards;
2 1 강성혁 89 72 127 129
2 2 정수진 90 88 140 145
;
run;

data horizon_merg1;
merge data1 data2;
run;
data horizon_merg2;
merge data3 data4;
run;

data verti_merg;
set horizon_merg1 horizon_merg2;
run;

proc print data=verti_merg;
run;
