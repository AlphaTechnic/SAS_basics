/* RETAIN
C언어에서 static 변수 선언이랑 같은 듯
*/

data accumulated;
input x @@;
/* retain - 유지하다 */
retain total 0;
total = x + total;

cards;
1 2 3 4 5 6
;
run;

proc print data=accumulated;
run;