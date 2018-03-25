# Set 2.2a - Question 6
library(lpSolveAPI)

# x1 : Sheets, x2 : Bars
# x1        <= 550
# x2        <= 580
# 3x1 + 4x2 <= 2400

# Z = 40x1 + 35x2

ex6 <- make.lp(3,2)
set.column(ex6, 1, c(1,0,3))
set.column(ex6, 2, c(0,1,4))
set.rhs(ex6, c(550,580,2400))
set.objfn(ex6, c(40,35))
set.constr.type(ex6, rep("<=", 3))
lp.control(ex6, sense="max")
solve(ex6)


print(ex6)

# Max Profit 
get.objective(ex6) 
# Sheets
get.variables(ex6) [1]
# Bars
get.variables(ex6)[2]

plot(ex6)
