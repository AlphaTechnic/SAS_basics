/* chisq + measure -> 연관성 측도 */

data edueco;
input edu eco count @@;
cards;
1 1 255 1 2 105 1 3 81
2 1 110 2 2 92 2 3 66
3 1 90 3 2 113 3 3 88
;
run;

proc freq data=edueco order=data;
weight count;
tables edu*eco / nocol nopercent chisq measures;
run;
