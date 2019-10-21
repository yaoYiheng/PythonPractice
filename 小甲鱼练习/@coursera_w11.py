def future_value(present_value,annual_rate,periods_per_year,years):
    rate_per_period = annual_rate/periods_per_year
    periods = periods_per_year * years
    future_value = present_value*(1+rate_per_period)**periods
    print(future_value)
                 
