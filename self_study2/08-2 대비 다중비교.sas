/* glm - contrast 다중비교 대비! 대비는 anova에 없음 glm해야됨*/
/* do loop 연습은 덤 */

data onefac;
do density=1 to 4;
input y @@;
output;
end;

cards;
6250 6150 6080 6200
6300 6290 6120 6220
6420 6170 6020 6010
6220 6180 6040 6030
6320 6080 6020 6000
;
run;

proc glm;
class density;
model y=density;
contrast '1 2 3 vs 4' density .33333 .33333 .33333 -1;
contrast '1 vs 2 3 4' density 1 -.33333 -.33333 -.33333;
contrast '1 2 vs 3 4' density .5 .5 -.5 -.5;
contrast '1 vs 2' density 1 -1 0 0;
contrast '3 vs 4' density 0 0 1 -1;
means density / lsd;
run;
quit;
