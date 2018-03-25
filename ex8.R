# Set 2.2a - Question 8
library(lpSolveAPI)

# x1 : Practical, x2 : Humanistic 
# x1 + x2 <= 30
# x1      >= 10
#      x2 >= 10

# Z = 1500x1 + 1000x2

ex8 <- make.lp(3,2)
set.column(ex8, 1, c(1,1,0))
set.column(ex8, 2, c(1,0,1))
set.rhs(ex8, c(30,10,10))
set.objfn(ex8, c(1500,1000))
set.constr.type(ex8, c("<=",">=",">="))
lp.control(ex8, sense="max")
solve(ex8)


print(ex8)

# Max Profit 
get.objective(ex8) 
# Practical
get.variables(ex8) [1]
# Humanistic 
get.variables(ex8)[2]

plot(ex8)
