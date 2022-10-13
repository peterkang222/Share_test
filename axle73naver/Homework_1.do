capture program drop Sample_mean
capture drop xvar
set seed 10101
program Sample_mean, rclass 
set obs 30
tempvar x 
generate `x' = runiform()
mean(`x')
return scalar xvar = r(table)[1,1]
end
simulate xvar = r(xvar), rep(400) : Sample_mean
list in 1/10, clean
histogram xvar, frequency
