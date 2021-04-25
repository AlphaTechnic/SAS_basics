/* 2-6 */
data cholest;
	input density @@;
	
	if density >= 350 then density_scaled='350 이상';
	else if density >= 330 then density_scaled='330 이상 350 미만';
	else if density >= 310 then density_scaled='310 이상 330 미만';
	else if density >= 290 then density_scaled='290 이상 310 미만';
	else if density >= 270 then density_scaled='270 이상 290 미만';
	else if density >= 250 then density_scaled='250 이상 270 미만';
	else if density >= 230 then density_scaled='230 이상 250 미만';
	else if density >= 210 then density_scaled='210 이상 230 미만';
	else if density >= 190 then density_scaled='190 이상 210 미만';
	else density_scaled='170미만';
	
	cards;
	239 161 210 179 212 195 301 357 233 256
	234 195 199 284 245 174 310 286 176 212
	297 249 282 233 205 286 269 305 247 292
	;
run;

/* (가) 도수분포표 및 히스토그램 */
/* 도수분포표 */
proc freq data=cholest order=data;
weight density;
tables density_scaled;
run;

/* 히스토그램 */
proc univariate data=cholest;
histogram density /
outhistogram=outhisto
vaxis=0 to 30 by 5
midpoints = 130 to 400 by 20
nrow=1 ncol=1;
run;

/* (나) 평균, 중위수, 분산, 표준편차 등 기술통계량 */
proc means data=cholest maxdec=2 N mean std median max min;
	var density;
	output out=choelst_out;
run;

proc print data=choelst_out;
run;