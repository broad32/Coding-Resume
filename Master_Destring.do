clear
cd "\\Client\H$\Dropbox\BRAC_project\BSR\dta"

*#delimit;
*FY13/17 covered in two pieces
forvalues yr = 13/15 {
*Import main report
import excel using FY`yr'.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
replace component=lower(component)
replace nearest_city=lower(nearest_city)

* Numerical Loop for Main Report
local numvars "num_building_own building_own_sqft bldg_leased bldg_leased_sqft bldg_other bldg_other_sqft total_bldg total_bldg_sqft acres_owned total_acres prv"

   foreach var in `numvars' {
   capture confirm string variable `var'
	  if !_rc {
      replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
      destring `var', replace
	  }
   }
   
*Save Main Report
save FY`yr'_sansemp, replace

*Import Employment Data

import excel using FY`yr'_Employment.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
*Should I drop sites listed as "other"?

*Numerical Loop for Employment Tables

local numvars "army navy marine airforce active_duty_total army_ng army_reserve navy_reserve marine_reserve air_ng airforce_reserve reserve_total civilian grand_total_employment other"

   foreach var in `numvars' {
      capture confirm string variable `var'
	  if !_rc {
	  
	  replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
	  destring `var', replace
    }  
   }



save FY`yr'_emp, replace
}


*Import main report for FY17
import excel using FY17.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
replace component=lower(component)
replace nearest_city=lower(nearest_city)

* Numerical Loop for Main Report FY17
local numvars "num_building_own building_own_sqft bldg_leased bldg_leased_sqft bldg_other bldg_other_sqft total_bldg total_bldg_sqft acres_owned total_acres prv"

   foreach var in `numvars' {
   capture confirm string variable `var'
	  if !_rc {
      replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
      destring `var', replace
	  }
   }
   
*Save Main Report for FY17
save FY17_sansemp, replace

*Import Employment Data for FY17

import excel using FY17_Employment.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
*Should I drop sites listed as "other"?

*Numerical Loop for Employment Tables FY17

local numvars "army navy marine airforce active_duty_total army_ng army_reserve navy_reserve marine_reserve air_ng airforce_reserve reserve_total civilian grand_total_employment nafciviliantotal other"

   foreach var in `numvars' {
      capture confirm string variable `var'
	  if !_rc {
	  
	  replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
	  destring `var', replace
    }  
   }



save FY17_emp, replace

*FY10-12
forvalues yr = 10/12 {
*Import complete report
import excel using FY`yr'.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
replace component=lower(component)
replace nearest_city=lower(nearest_city)

* Numerical Loop for Main Report
local numvars "num_building_own building_own_sqft bldg_leased bldg_leased_sqft bldg_other bldg_other_sqft total_bldg total_bldg_sqft acres_owned total_acres prv mil civ other"

   foreach var in `numvars' {
   capture confirm string variable `var'
	  if !_rc {
      replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
      destring `var', replace
	  }
   }
   
*Save Complete Report
save FY`yr'_complete, replace
}

*FY00-09
forvalues yr = 4/9 {
*Import complete report
import excel using FY0`yr'.xlsx, firstrow case(l) clear
replace site=lower(site)
replace state=lower(state)
replace component=lower(component)
replace nearest_city=lower(nearest_city)

* Numerical Loop for Main Report
local numvars "num_building_own building_own_sqft bldg_leased bldg_leased_sqft bldg_other bldg_other_sqft total_bldg total_bldg_sqft acres_owned total_acres prv mil civ other"

   foreach var in `numvars' {
   capture confirm string variable `var'
	  if !_rc {
      replace `var' = subinstr(`var',",","",.)
      replace `var' = subinstr(`var',"$","",.)
      destring `var', replace
	  }
   }
   
*Save Complete Report
save FY0`yr'_complete, replace
}
