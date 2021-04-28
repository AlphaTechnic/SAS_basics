/* PROC SUMMARY
proc summary는 proc means나 proc univariate와는 다르게 
data set을 생성하는 데에 그 목적이 있기 때문에 얘는
(proc means와 proc univariate와는 다르게 <- 얘들은 '선택적'이었음)

output out을 반드시 반드시 설정해야 하며,(tuple로 여러 개 설정할 수도 있음.)
출력을 따로 별도로 해야함.
*/

data score;
input dept$ gender$ age score @@;
datalines;
Stat M 10 94 Stat F 10 96 Stat M 15 91 Stat M 15 86
Stat F 10 76 Stat M 20 88 Math M 20 71 Math F 20 66
Math M 15 81 Math F 10 77 Math F 15 55 Math F 20 78
;
run;

proc summary data=score;
class dept gender;
var age score;
output out=n_score mean=a_mean s_mean;
run;

proc print data=n_score;
run;
