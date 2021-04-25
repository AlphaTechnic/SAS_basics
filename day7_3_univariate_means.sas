/*추정*/
/*
점추정과 구간추정이 있다.
추정량으로 불편추정량을 쓴다. bar(x) s^2 hat(p)

UNIVARIATE, MENAS
t분포를 이용하기 때문에 정규성 가정 하에~ 라는 말이 나옴.
*/
data csi;
	input csi @@;
	LABEL csi='소비자 만족도 지수';
cards;
75 62 82 33 28 98 37 72 72 73 83 72 63 62
;

proc univariate data=csi cibasic alpha=0.05;
var csi;
run;

proc means data=csi n mean std clm alpha=0.05;
var csi;
run;