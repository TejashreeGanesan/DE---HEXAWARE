-- string functions --

select ascii('CB'); /*return leftmost ascii value*/
select char(66);  /*return ascii value to character*/
select len('Microsift sql'); /*return length*/
select lower('JHON'); /*convert to lowercase*/
select replace('Microsoft sql','sql','server'); /*replace*/
select reverse('python');/*reverse the string */
select upper('aparna'); /*converts to upper*/
select str(136.564,8,4); /*STR(number, length, decimals)*/

-- numeric function --

--round 
select 3.516, round(3.516,2) as round_2,
round(3.516,1) as round_2,
round(3.516,0) as round_2;

-- abs
select -10 abs(-10);

