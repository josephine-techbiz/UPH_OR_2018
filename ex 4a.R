# Set 2.2a - Question 4
library(lpSolveAPI)


# 10x1 + 5x2  <= 600
#  6x1 + 20x2 <= 600
#  8x1 + 10x2 <= 600
# Z = 2x1 + 3x2

ex4a <- make.lp(3,2)
set.column(ex4a, 1, c(10, 6, 8))
set.column(ex4a, 2, c(5, 20, 10))
set.rhs(ex4a, c(600,600,600))
set.objfn(ex4a, c(2,3))
set.constr.type(ex4a, rep("<=", 3))
lp.control(ex4a, sense="max")
solve(ex4a)


print(ex4a)

# Max Profit 
get.objective(ex4a) 
# X1
get.variables(ex4a) [1]
# X2
get.variables(ex4a)[2]

plot(ex4a)
