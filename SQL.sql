use project;
select * from finance;

-- 1st KPI
select year (issue_d) as `Year`, sum(loan_amnt) as `Total Loan amount` from finance group by year(issue_d);

-- 2nd KPI
select grade, sub_grade as `Sub Grade`,sum(revol_bal) as `Total Revol Balance`
from finance 
group by grade,sub_grade
order by grade;

-- 3rd KPI
select verification_status AS `Verification Status`, round(sum(total_pymnt),2) as `Total Payment`
from finance 
where verification_status in('Verified', 'Not Verified') 
group by verification_status;

-- 4th KPI
select addr_state as `State`, year(last_credit_pull_d) as `Last Credit Pull Date`,min(loan_status) as `Loan Status`
from finance where addr_state="AK"
group by addr_state, last_credit_pull_d
order by addr_state;

-- 5th KPI
select home_ownership as `Home Ownership`,  count(last_pymnt_amnt) as `Last Payment Amount`
from finance group by home_ownership;



















