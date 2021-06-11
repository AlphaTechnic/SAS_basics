/* 08-3 glm 이원배치법 교호작용 시너지 */
/* 이원배치법 */

data sales;

do city ='large ', 'middle', 'small ';
	do design = 'a', 'b', 'c';
		do rep = 1, 2, 3;
			input sales @@;
			output;
		end;
	end;
end;

cards;
23 20 21    22 19 20    19 18 21
22 20 19    24 25 22    20 19 22
18 18 16    21 23 20    20 22 24
;
run;

proc glm data=sales;
class city design;
model sales = city design city*design;
means city design city*design;
run;
quit;