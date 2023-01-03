/*
Topic: Bangkok Airways
Group: 5
Members:
	Pauruetai Kobsahai 			6322770064
	Thanakrit Loetpricha 		6322770114
	Chanon Charuchinda 			6322770692
	Warangkana Wuttisupasiri 	6322770759
	Tul Tulyapornchote 			6322800077
*/

use bangkokairways_final;

/*---By Pauruetai Kobsahai	6322770064-----------------------------------------------------------------------------*/

/*
	Query 1: Show a list of employees who are supervisors. The result should diesplay 
    employee id, employee full name, and their title
*/
select
	EMP_ID as "Employee ID",
	concat(FName,' ', LName) as Fullname,
	title "Title"
from employee where title like "%Supervisor%" 
group by EMP_ID;

/*
	Query 2: Show the total number of employees for each title
*/
select
	title as "Title",
    count(*) as "Total Employees"
from employee 
where title != ""
group by title
order by count(*) desc;

/*
	Query 3: Display the total number of flights in each stats.
    The result should show the statis and the total number of flights
*/
select
    status as "Status",
    count(*) as "Total"
from flight_schedule 
group by status
order by count(*) desc;

/*
	Query 4: Display the number of route groups by route type.
    The result show the route type and the number of routes.
*/
select 
    route_type as "Route Type",
    count(*) as "Total Route"
from route
group by route_type;

/*
	Query 5: List all captain id, their full name, year and the name of month 
    of their employment time.
*/
 select
     EMP_ID as "Captain ID",
     concat(FName,' ', LName) as Fullname,
     year(employment_date) as 'year',
     monthname(employment_date) as 'Month'
 from employee as p
 inner join pilot as fp
 on p.EMP_ID = fp.PEMP_ID
 group by EMP_ID;
 
 /*
	Query 6: Find the BMI of employees, which can be calculated from 
    weight in kilograms and height in meters squared.
 */
select
	emp.emp_id, 
    concat_ws(" ", emp.fname, emp.mname, emp.lname) as "Full name",
    ac.height,
    ac.weight,
    round(weight / pow(height/100,2),3) as bmi
from employee as emp
inner join air_crew as ac
on emp.emp_id = ac.aemp_id
order by ac.height desc, ac.weight desc;

/*
	Query 7: Show the BMI of employees, which can be calculated from weight in kilograms and height in meters squared and 
    classify the employee into weight classification as overweight and healthy weight.
 */
 with emp_profile as (
	select
		emp.emp_id, 
		concat_ws(" ", emp.fname, emp.mname, emp.lname) as "Full name",
		ac.height,
		ac.weight,
		round(weight / pow(height/100,2),3) as bmi
	from employee as emp
	inner join air_crew as ac
	on emp.emp_id = ac.aemp_id
)

select
	*,
	case 
		when bmi < 18.5 then "Underweight"
        when bmi >= 18.5 and bmi < 25 then "Healthy weight"
        when bmi >= 25 and bmi < 30 then "Overweight"
        else "Obesity"
    end as "Weight Classification"
from emp_profile;

/*
	Query 8: Bangkok Airways is planning to give a raise to all employee who stayed with the company for certain amount 
    of years using the following scale. For those who worked at the company for less than 5 years, greater than and equal
    to 5 but less than 8 years, and more than 8 years, will get a raise of 5%, 8%, and 10% from the current salary respectively. 
*/
select 
	*,
    round(
		case 
			when year_with_company < 5 then current_salary * 105 / 100
			when year_with_company >= 5 and year_with_company < 8 then current_salary * 108/100
			else current_salary * 110 / 100
		end
    ) as new_salary
from (
	select
		emp_id,
		case
			when e1.mname != "" then concat(e1.fname, " " , e1.mname, " ", e1.lname)
			else concat(e1.fname, " ", e1.lname)
		end as employee_name,
		e1.employment_date,
		timestampdiff(year,e1.employment_date,now()) as year_with_company,
		e1.salary as current_salary
	from employee as e1
) as temp;

/*
	Query 9: Show a list of employees that have supervisors. The result should display 
    employee name, supervisor name, and the difference in their salary.
*/
select
	e1.emp_id as employee_id,
	case
		when e1.mname != "" then concat(e1.fname, " " , e1.mname, " ", e1.lname)
        else concat(e1.fname, " ", e1.lname)
    end as employee_name,
    e2.emp_id as supervisor_id,
    case
		when e2.mname != "" then concat(e2.fname, " " , e2.mname, " ", e2.lname)
        else concat(e2.fname, " ", e2.lname)
    end as supervisor_name,
    e2.salary - e1.salary as salary_diff
from employee as e1
left join employee as e2
on e1.semp_id = e2.emp_id
where e1.emp_id != e2.emp_id;

/*
	Query 10: Display the number of distances for each airplane. 
    The result must show the airplane id and the total of distance.
*/
select
	airp_id as "Airplane ID",
    sum(distance) as "Total Distance"
from (
	select 
		ap.airp_id,
		ap.company,
		ap.model,
		ap.manufacture_date,
		r.r_id,
		r.distance
	from airplane as ap
	inner join airplane_operation_fs_route as afs
	on ap.airp_id = afs.airp_id
	inner join route as r
	on afs.r_id = r.r_id
) as temp
group by airp_id
order by sum(distance) desc;


/*---By Thanakrit Loetpricha	6322770114---------------------------------------------------------------------------*/

/*
	Query 1: Show the list of Route id and departure - arrival id for each route
*/
select 
     R_ID as "Route ID",
     concat(DEPT_AIRPT,' - ', ARR_AIRPT) as Route
 from route
 group by R_ID;

/*
	Query 2: Display total Discount and total Service charge of passenger by ID of passenger.
*/
select
	PPAX_ID as "Passenger ID",
    sum(discount) as "Total Discount",
    sum(service_charge) as "Total Service Charge"
    from payment
group by PPAX_ID
order by PPAX_ID;

/*
	Query 3: Show the query of total seats in each seat type by using seat ID.
*/
select
    ST_ID as "Seat ID",
    Sname as "Seat Type",
    count(ST_ID) as "Total Seat" 
from seat as p
inner join seat_type as fp
on p.ST_ID = fp.SeatT_ID
group by ST_ID;

/*
	Query 4: Display the list of 5 highest salaries per year for each employee 
    with name and employee ID.
*/
select 
    EMP_ID as "Employee ID",
	concat(FName,' ', LName) as Fullname,
    salary as "total Salary"
from employee
order by salary DESC
limit 5;

/*
	Query 5: Show status of Bangkok Airways. The result must show the flight id, flight code 
    and the status of Bangkok Airways flights.
*/
select 
    FLTS_ID as "Flight ID",
    FLTCode as "Flight Code",
    Status as "Status"
from flight_schedule where airline_name = 'Bangkok Airways'
group by FLTS_ID;

/*
	Query 6: Show the total income for each airline.
*/
with cte1 as (
	select 
		pay.pymt_id,
		service_charge,
		discount,
		price,
        flts_id
	from payment as pay
	inner join ticket as tk
	on pay.pymt_id = tk.pymt_id
	inner join seat as s
	on s.seat_id = tk.seat_id
	inner join seat_type as st
	on s.st_id = st.seatt_id
),
cte2 as (
	select
		fs.flts_id,
		fs.fltcode,
		fs.airline_name,
		r.distance * 6.0 as route_price
	from flight_schedule as fs 
	inner join airplane_operation_fs_route as afs
	on fs.flts_id = afs.flts_id
	inner join route as r
	on afs.r_id = r.r_id
)

select 
	airline_name,
	format(round(sum(total_price)),0) as total_income
from (
	select 
	cte1.*,
	cte2.fltcode,
	cte2.airline_name,
	cte2.route_price,
	service_charge + price + route_price - discount as total_price
	from cte1 
	inner join cte2
) as temp
group by airline_name
order by sum(total_price) desc;

/*
	Query 7: Show the number of cancellations by countries.
*/
select 
    nationality as "Nationality",
    count(*) as "Total Cancellation"
from cancellation as c
inner join payment as pay
on c.pymt_id = pay.pymt_id
inner join passenger as p
on pay.ppax_id = p.pax_id
left join (
	select 
		tpax_id as pax_id,
		"Thai" as nationality
	from thai_passenger
	union all
	select 
		fpax_id, 
		nationality
	from foreign_passenger
) as temp
on p.pax_id = temp.pax_id
group by nationality;

/*
	Query 8: Display all the flight code and the airplane that is responsible for the scheduled flight.
*/
select 
	flts.fltcode as "Flight Code",
	aor.airp_id as "Airplane ID",
	flts.flt_date as "date"
from flight_schedule as flts 
inner join airplane_operation_fs_route as aor
on flts.flts_id = aor.flts_id
inner join airplane as air 
on aor.airp_id = air.airp_id
order by flts.flt_date asc;

/*
	Query 9: Display the jobs (Maintenance engineer, Pilot, Cabin crew, Network Planning, and Staff) of all the employee 
*/
select memp_id, "maintenance Engineer" as job from maintenance_engineer
union all
select pemp_id, "Pilot" as job from pilot
union all
select aemp_id, "Air Crew" as job from air_crew;

/*
	Query 10: Display the number of employee for each job titles, total salary, and average employee
*/
select 
	job as "Job Title", 
    count( distinct emp_id) as "Number Employee", 
    sum(salary) as "Total Salary",
    round(avg(salary)) as "Average Salary"
from (
	select
	emp.*,
	case
		when emp_id in (select memp_id from maintenance_engineer) then "Maintenance Engineer"
		when emp_id in (select pemp_id from pilot) then "Pilot"
		when emp_id in (select cemp_id from cabin_crew) then "Cabin Crew"
		when emp_id in (select nemp_id from network_planning) then "Network Planning"
		else "Staff"
	end as job 
from employee as emp
) as temp
group by job
order by  count( distinct emp_id) desc ,avg(salary) desc;


/*---By Chanon Charuchinda	6322770692------------------------------------------------------------------------------*/

/*
	Query 1: how a list of passengers that purchase at least one insurance. The result should display passenger id, passenger full name, 
    the type of insurance, and the coverage amount.
*/
select 
	p.pax_id as "Passenger ID",
	case
		when p.mname != "" then concat(p.fname," ", left(p.mname,1), ". ", p.lname)
        else concat(p.fname, " ", p.lname)
    end as "Fullname",
    ti.categories as "Insurance Type",
    case 
		when ti.coverage_amount = 0 then "Ticket Price"
        else ti.coverage_amount
    end as "Coverage"
from passenger as p
inner join payment as pay
on p.pax_id = pay.ppax_id
inner join travel_insurance as ti 
on pay.pymt_id = ti.pymt_id;


/*
	Query 2: Display the number of foreign passengers groups by country. 
    The result must show the country and the associated number of passengers. 
*/
select
	fp.nationality as "Nationality",
	count(*) as "Total Passengers"
from passenger as p
inner join foreign_passenger as fp
on p.pax_id = fp.fpax_id
group by fp.nationality;

/*
	Query 3: Classified the passenger into categories of adult and senior citizens using the conversion. 
    Then count the number of each category. The result should display the category's name and the count. 
*/
select 
	cat as "Passenger Type",
	count(*) as "Passenger Num"
from (
	select
		*,
		timestampdiff(year,timestamp(dob),now()) as age,
		case
			when timestampdiff(year,timestamp(dob),now()) > 35 then "senior"
			else "adult"
		end as "cat"
	from passenger
) as temp
group by cat;


/*
	Query 4: Find the purchase price of the travel insurance, which can be calculated from multiplying the number of travelers 
    and type of categories after mapping. For insurance of type trip cancellation put null.
*/
select
	ti_id as "Travel Insurance ID",
    categories,
    case 
		when categories like "%Loss of Life%" then 300 * travel_num
		when categories like "%Personal Liability%" or categories like "%Medical Expense%" then 200 * travel_num
        when categories like "%Loss or Damage of Bagage%" then 100 * travel_num
        when categories like "%Bagage Delay%" then 80 * travel_num
        else null
    end as "Purchase Price"
from travel_insurance;


/*
	Query 5: Show a list of country, the number of airports, and the average number of supported flights per hours
*/
select
	country as "Country",
    count(*) as "Airport number",
    round(avg(flightline_num)) as "Average Flight per hours"
from airport
group by country;


/*
	Query 6: Find the frequency of each route
*/
select 
	dept_airpt as "Departure Airport",
	arr_airpt as "Arrival Airport",
	count(*) as "Frequency"
from route
group by dept_airpt, arr_airpt;


/*
	Query 7: Show the total number of ticket purchase for each day of the week
*/
select 
	dayname(reservation_date) as "Weekday",
    count(*) as "Total Tickets"
from ticket
group by dayname(reservation_date);


/*
	Query 8: List all the payments that are made for purchasing tickets by the FlyerBonus members. 
    The result should display FlyerBonus ID, Fullname, Total payment, and number of ticket purchases.
*/
select 
	flyer_id "FlyerBonus ID",
    fullname as "Fullname",
    service_charge + seat_price + route_price - discount as "Total payment",
    count(flyer_id) as "Num tickets"
from (
	select
		fm.flyer_id,
		concat(p.fname, " ", p.lname) as fullname,
		pay.service_charge,
		pay.discount,
		st.price as seat_price,
		r.distance * 6.0 as route_price
	from flyerbonus_membership as fm
	inner join passenger as p
	on fm.flpax_id = p.pax_id
	inner join payment as pay
	on p.pax_id = pay.ppax_id
	inner join ticket as t
	on t.pymt_id = pay.pymt_id
	inner join seat as s
	on s.seat_id = t.seat_id
	inner join seat_type as st
	on st.seatt_id = s.st_id
	inner join airplane_operation_fs_route as afr
	on afr.flts_id = t.flts_id
	inner join route as r
	on afr.r_id = r.r_id
) as temp
group by flyer_id;


/*
	Query 9: Show the accumulated points of each FlyerBonus member by making an assumption that points can be calculated 
    from base_point + round(r.point * seat_price * 0.005), which is 5% of seat_price. The result should display FlyerBonus ID, 
    Fullname, membership level, total point, and discount rate.
*/
select
	flyer_id as "FlyerBonus ID",
    fullname as "Fullname",
    member_level "Membership",
    round(base_point / count(*) + point_earned) as "Total Points",
    member_discount as "Discount"
from (
	select
		fm.flyer_id,
		ml.mem_name as member_level,
		ml.qualifying_point as base_point,
		concat(p.fname, " ", p.lname) as fullname,
		round(r.point * st.price * 0.005) as point_earned,
        fm.mem_discount as member_discount
	from flyerbonus_membership as fm
	inner join membership_level as ml
	on fm.ml_id = ml.ml_id
	inner join passenger as p
	on fm.flpax_id = p.pax_id
	inner join payment as pay
	on p.pax_id = pay.ppax_id
	inner join ticket as t
	on t.pymt_id = pay.pymt_id
	inner join seat as s
	on s.seat_id = t.seat_id
	inner join seat_type as st
	on st.seatt_id = s.st_id
	inner join airplane_operation_fs_route as afr
	on afr.flts_id = t.flts_id
	inner join route as r
	on afr.r_id = r.r_id
) as temp
group by flyer_id;

/*
	Query 10: Find Passengers who have registered for FlyerBonus membership and display when is their next membership renewal date. 
    If the passenger is a Priority member, which is default level, put renew date as null
*/
select
	fm.flyer_id as "Member ID",
    case 
		when p.mname != "" then concat(p.fname, " '", p.mname ,"' ", p.lname)
        else concat(p.fname," ",p.lname)
	end as "Fullname",
    p.passport_num as "Passport number",
    ml.mem_name as "Member Level",
    fm.signup_date as "Signup date",
    case 
		when ml.validation_period = 12 then date_add(fm.signup_date, interval 12 month)
        else null
    end as "Renew Date"
from passenger as p
right join flyerbonus_membership as fm
on fm.flpax_id = p.pax_id
left join membership_level as ml
on fm.ml_id = ml.ml_id;


/*
	Query 11: Show a list of all airplanes, a set of flight schedules that they operated on, and the 
    total flight time during the period starting from 28th October to 1st November 2022. 
*/
with airtime as 
(
	select 
		fs.flts_id,
		fs.fltcode,
        fs.flt_date,
		timediff(fs.schedulearr_time,fs.scheduledept_time) as flight_time,
		fs.airline_name,
		ap.airp_id,
		ap.model
	from flight_schedule as fs
	inner join airplane_operation_fs_route as operate
	on fs.flts_id = operate.flts_id
	inner join airplane as ap
	on ap.airp_id = operate.airp_id
)
 select 
	airp_id,
    model,
    group_concat(fltcode separator ', ') as flight_code,
    sec_to_time(sum(time_to_sec(flight_time))) as total_flight_time  
from airtime
where flt_date between '2022-10-28' and '2022-11-01'
group by airp_id
order by airp_id asc;


/*
	Query 12: Display how many times Airplane model Airbus has undergone Light Maintenance A/B checks, Line Maintenance C check, 
    and the approximate remaining operational years. The result should be ordered by the age of the airplane in descending order. 
    On average, airplanes can operate for 30 years. Use this number as the base to calculate the remaining years of 
    service for each airplane airbus model. 
*/
with airplane_summary as 
(
	select 
		airp_id,
		company,
		model,
		type as "airplane_type",
		manufacture_date,
		timestampdiff(hour,timestamp(manufacture_date),now()) as age_hours,
		timestampdiff(year,timestamp(manufacture_date),now()) as age_years,
        timestampdiff(month,timestamp(manufacture_date),now()) as age_months
	 from airplane	
     where model like '%Airbus%'
)
select
	airp_id as "Airplane ID",
    model,
    manufacture_date,
    floor(age_months / 4) as check_ab_num,
    floor(age_months / 24) as check_c_num,
    age_years as "Age",
    30 - age_years as remaining_years
from airplane_summary
order by age desc;


/*
	Query 13: Show a list of pilot and copilot of each flight schedule that is not codeshare flights. 
    The list must contains the Flight Code, Airline name, name of the pilot, and s/he cockpit position
*/
select
	fs.fltcode as "Flight Code",
    fs.airline_name as "Airline",
    concat(emp.fname, " ", if(left(emp.mname,1) != "", concat(left(emp.mname,1),"."), left(emp.mname,1)), " ",  emp.lname) as "Fullname",
    pff.cockpit_position as "Position"
from pilot as pil
inner join employee as emp
on pil.pemp_id = emp.emp_id
inner join pilot_fly_flightsch as pff
on pil.pemp_id = pff.p_emp_id
inner join flight_schedule as fs
on pff.flts_id = fs.flts_id
where fs.fltcode like "%PG%" and fs.airline_name = "Bangkok Airways"
order by fs.fltcode, pff.cockpit_position;


/*
	Query 14: Generate a Flight Schedule Dashboard similar to that is commonly seen at an airport
*/
select 
	fs.fltcode as "Flight Code",
    fs.airline_name as "Airline",
    fs.checkin_counter as "Checkin Counter",
	date(fs.scheduledept_time) as "Departure Date",
    time(fs.scheduledept_time) as "Departure Time",
    concat(
		mod(hour(TIMEDIFF(fs.scheduledept_time,fs.schedulearr_time)), 24), ' hours ',
		minute(TIMEDIFF(fs.scheduledept_time,fs.schedulearr_time)), ' minutes'
	) as "Travel Duration",
	r.distance as "Distance (km)",
    concat(ap1.airpt_name," (", ap1.iata_code,")") as "Deptature",
    concat(ap2.airpt_name, " (", ap2.iata_code, ")") as "Arrival"
from flight_schedule as fs
inner join airplane_operation_fs_route as operate
on fs.flts_id = operate.flts_id
inner join route as r
on r.r_id = operate.r_id
inner join airport as ap1
on ap1.airpt_id = r.dept_airpt
inner join airport as ap2
on ap2.airpt_id = r.arr_airpt;


/*
	Query 15: Create a list to show the total number of cancellations made by each country.
*/
select 
    nationality as "Nationality",
    count(*) as "Total Cancellation"
from cancellation as c
inner join payment as pay
on c.pymt_id = pay.pymt_id
inner join passenger as p
on pay.ppax_id = p.pax_id
left join (
	select 
		tpax_id as pax_id,
		"Thai" as nationality
	from thai_passenger
	union all
	select 
		fpax_id, 
		nationality
	from foreign_passenger
) as temp
on p.pax_id = temp.pax_id
group by nationality
order by count(*) desc;

/*
	Query 16: Schedule the next three Check A type checks for all the airplanes. The table must shows airplane id, model, 
    a list of engineer responsible for the check, and the three scheduled check dates separated by "|" symbol.
*/
select 
	airp_id,
    model,
    group_concat(distinct M_EMP_ID separator ", ") as engineer,
    group_concat(distinct next_check separator "| ") as schedule_checkA
from (
	select 
		mca.m_emp_id, 
		ap.*,
        date_add(
			date_add(
				manufacture_date,
				interval floor(timestampdiff(month,timestamp(manufacture_date),now())) month
			),
			interval (rank() over (partition by airp_id order by m_emp_id)) * 4 month
		) as next_check
	from maintenancee_check_airplane as mca
	inner join airplane as ap
	on mca.airp_id = ap.airp_id
) as temp
group by airp_id;

/*
	Query 17: Create a list to show the number of employees for each job title, 
    the total expenditure that Bangkok Airways spent on them, and the average salary of each job title.
*/
select 
	job as "Job Title", 
    count( distinct emp_id) as "Number Employee", 
    format(sum(salary),0) as "Total Salary",
    format(round(avg(salary)),0) as "Average Salary"
from (
	select
	emp.*,
	case
		when emp_id in (select memp_id from maintenance_engineer) then "Maintenance Engineer"
		when emp_id in (select pemp_id from pilot) then "Pilot"
		when emp_id in (select cemp_id from cabin_crew) then "Cabin Crew"
		when emp_id in (select nemp_id from network_planning) then "Network Planning"
		else "Staff"
	end as job 
from employee as emp
) as temp
group by job
order by  count( distinct emp_id) desc ,avg(salary) desc;

/*
	Query 18: Find the number of speakers from a set of spoken languages among the cabin crew
*/
with cte as (
	select
	substring_index(second_language, ", ",1) as flang,
	case 
		when substring_index(substring_index(second_language, ", ",2), ", ", -1) != second_language
		then substring_index(substring_index(second_language, ", ",2), ", ", -1)
		else null
	end as slang,
	case 
		when substring_index(substring_index(second_language,", ",3), ", ",-1) != 
		substring_index(substring_index(second_language, ", ",2), ", ", -1)
		then substring_index(substring_index(second_language,", ",3), ", ",-1)
		else null
	end as tlang,
	case 
		when substring_index(second_language, ", ",-1) != 
		substring_index(substring_index(second_language,", ",3), ", ",-1)
		then substring_index(second_language, ", ",-1) 
		else null
	end as frlang
	from cabin_crew as cc
)

select flang as "Language", count(*) as frequency
from (
	select flang from cte
	union all
	select slang from cte
	union all 
	select tlang from cte
	union all 
	select frlang from cte
) as temp
where flang is not null
group by flang
order by count(*) desc;


/*
	Query 19: Calculate the number of cancellations made for the category of travel insurance.
*/
select 
	cancel_type as "Cancellation Categories", 
	count(*) as "Frequency"
from (
	select
	pay.*,
	case
		when pay.pymt_id in (select pymt_id from ticket) then "Ticket"
		when pay.pymt_id in (select pymt_id from travel_insurance) then "Travel Insurance"
		else "Unknown"
	end cancel_type
	from cancellation as c
	inner join payment as pay
	on c.pymt_id = pay.pymt_id
) as temp
group by cancel_type;

/*
	Query 20: Find the Average spending on seat for passenger from different area (combination of street and county)
*/
select 
	street,
    county,
    round(avg(price)) as "Average Spending on Seat"
from (
	select
		p.pax_id, 
		pa.street, 
		pa.county,
		pay.pymt_mode,
		temp.sname,
		temp.price
	from passenger as p
	inner join passenger_address as pa
	on p.pax_id = pa.papax_id
	inner join payment as pay
	on p.pax_id = pay.ppax_id
	inner join (
		select t.pymt_id, st.sname, st.price
		from ticket as t
		inner join seat as s
		on t.seat_id = s.seat_id
		inner join seat_type as st
		on s.st_id = st.seatt_id
	) as temp 
	on pay.pymt_id = temp.pymt_id
) as temp
group by street, county
order by avg(price) desc;


/*---By Warangkana Wuttisupasiri	6322770759-----------------------------------------------------------------------*/

/*
	Query 1: Display the full name of Passenger who born after year 1990
*/
select concat(Fname, " ", MName, " ", LName) as "Full Name", DOB from passenger
where year(DOB) >= 1990;

/*
	Query 2: Find the Coordinates of the airport where its city starts with "c"
*/
select city as "City", AIRPT_name as 'Airport',
concat(latitude,' ',longitude) as 'Coordinates'
from airport
Where City like 'c%';


/*
	Query 3: Find payment id that paid by Credit order by datetime
*/
select PYMT_datetime as "Datetime", PYMT_ID as "Payment ID paid by Credit"
from payment
where PYMT_mode = "credit"
order by PYMT_datetime asc;


/*
	Query 4: List the seat type name that have a price lower than 10000
*/
select Sname as "Name", price as "Price"
from seat_type
where price < 10000;


/*
	Query 5: Display number of employees which are male.
*/
select count(Egender) as "Male Employee" from employee
where Egender like "%M%";


/*
	Query 6: Display ID and First Name of Passenger whose nationality is Indian
*/
select p.Pax_ID as ID, p.Fname as 'Name', f.Nationality as Nationality
from passenger p
Inner join foreign_passenger f ON p.Pax_ID = f.FPax_ID
Where nationality = 'indian';


/*
	Query 7: Display the passenger id and name with their preferred language 
    who have a member discount more than or equal to 8.
*/
select p.Pax_ID as ID, concat(p.Fname, " ", p.MName, " ", p.LName)as 'Full Name', 
m.preferred_lang as 'Preferred Language', m.MEM_discount as "Member Discount"
from passenger p
Inner join flyerbonus_membership m ON p.Pax_ID = m.FLPax_ID
Where MEM_discount >= 8
Order By MEM_discount desc;


/*
	Query 8: Show the seat id, row number, and class of first 15 seats according to its ID
*/
select s.Seat_ID as "Seat ID", s.row_num as "Row number", t.Sname as 'Class'
from seat s
inner join seat_type t on s.st_id = t.SeatT_ID
order by s.seat_id asc
limit 15;


/*
	Query 9: Select Employee full name who is on the route order by Employee name
*/
select concat(e.Fname," ",e.Mname," ",e.Lname) as "Employee", concat(r.dept_airpt,' - ', r.arr_airpt) as'Route'
from employee e
join route r on e.emp_id = r.n_emp_id
where route_type = 'domestic'
order by Employee asc;


/*
	Query 10: Show the Seat ID and Typre of class which is business with the row number start with 'A'
*/
select s.ST_ID as "Seat ID", st.Sname as 'Class', s.row_num as 'Row Number' from Seat s
join seat_type st on st.SeatT_ID = s.ST_ID
where Sname like '%Business%' and s.row_num like "%A%";



/*---By Tul Tulyapornchote	6322800077-------------------------------------------------------------------------------*/

/*
	Query 1: List how many Flyerbonus members' member languages prefer.
*/
select preferred_lang as "Preferred language",
count(*) as "No. of membership"
from flyerbonus_membership
group by preferred_lang;

/*
	Query 2: Display how many flights each airline has in total.
*/
select airline_name as "Airline", 
count(airline_name) as "Total flight" 
from flight_schedule group by airline_name;


/*
	Query 3:  Display all payment ID with ATM purchase method
*/
select
PYMT_ID as "Payment ID"from payment
where PYMT_mode like "%ATM%" 
group by PYMT_ID;


/*
	Query 4: How many First Class seats are there
*/
select count(s.Seat_ID) as "First Class"
from seat s
inner join seat_type t on s.st_id = t.SeatT_ID
where SName = 'First';


/*
	Query 5: List Aircrew employee id, weight, and height that is greater than 180 in order
*/
select AEMP_ID as "Employee ID", weight as "Weight", height as "Height"
from air_crew
where height>=180 
order by height asc;


/*
	Query 6: List all payment id, Ticket ID, Schedule Departure Time and Schedule Arriving Time 
    which has 0 in seat id and get a discount of more than 200.
*/
select 
p.PYMT_ID as "Payment ID", t.TCK_ID as "Ticket ID", 
f.ScheduleDept_time as "Schedule Departure Time",
f.ScheduleArr_time as "Schedule Arriving Time",
p.discount from payment p
join ticket t on p.PYMT_ID = t.PYMT_ID
join flight_schedule f on t.FLTS_ID = f.FLTS_ID
where discount >= 200 and Seat_ID like "%0%"
order by p.discount desc;


/*
	Query 7: List all cash received ID along with Payment ID which Ask for paper medium
*/
select c.CASHR_ID as "Cash recieve ID", c.medium , c.PYMT_ID as "Paymeny ID"
from cash_receipt c
join payment p on c.PYMT_ID = p.PYMT_ID
where medium like "%paper%"
order by c.PYMT_ID asc;


/*
	Query 8: Display Flight ID, Seat ID, Seat class that use F12 Check-in Counter
*/
select f.FLTS_ID as "Flight ID" , f.checkin_counter as "Check-in counter", s.Seat_ID as "Seat ID", st.Sname as "Class" from ticket t
join seat s on s.Seat_ID = t.Seat_ID
join flight_schedule f on f.FLTS_ID = t.FLTS_ID
join seat_type st where st.Sname like "%First%" and f.checkin_counter like "%F12%";


/*
	Query 9: Display Network employee with Algorithm = Expert level and show their origin country.
*/
select n.NEMP_ID as "Network Planning Employee", n.algorithm_level as "Algorithm Level", ea.country from network_planning n
join employee e on e.EMP_ID = n.NEMP_ID
join employee_address ea on e.EMP_ID= ea.EEMP_ID
where n.algorithm_level like "%Expert%";

/*
	Query 10: Order the sign up date from the latest day and show up their passenger ID, 
    fullname, gender, phone number, email, and password.
*/
select  p.PAX_ID as 'Passenger ID', signup_date as 'Signup date', concat(FName," ",MName," ",LName) as "Name", 
Pgender as 'Gender', pnum as 'Phone No.', email as 'Email', passwd as ' Password'
from Passenger p
join Contact_Detail c on  c.CPAX_ID = p.PAX_ID
join FlyerBonus_membership f on f.FLPAX_ID = p.PAX_ID
order by signup_date desc;
