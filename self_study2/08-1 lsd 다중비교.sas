/* lsd 다중비교 */
/* H0 기각이 되서, 유의미한 차이가 있다... 라고 되었을 때, 
그럼 어디에서?? 를 추적하는 중 */

data harvest;
input fertile$ yield @@;
cards;
F1 148 F1 76 F1 134 F1 98
F2 166 F2 153 F2 255
F3 264 F3 214 F3 327 F3 304
F4 335 F4 436 F4 423 F4 380 F4 465
;
run;

proc anova data=harvest;
class fertile;
model yield=fertile;
means fertile/ lines alpha=0.01 lsd;
means fertile/ hovtest=bartlett;
run;
quit;
