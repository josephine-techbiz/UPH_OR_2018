# Set 2.2a - Question 5
library(lpSolveAPI)

# x1 : product A, x2 : product B
# -.2x1 + .8x2  <= 0
#  x1   +       <= 100
#  2x1  + 4x2   <= 240
# Z = 20x1 + 50x2

ex5 <- make.lp(3,2)
set.column(ex5, 1, c(-0.2, 1, 2))
set.column(ex5, 2, c(0.8,0,4))
set.rhs(ex5, c(0,100,240))
set.objfn(ex5, c(20,50))
set.constr.type(ex5, rep("<=", 3))
lp.control(ex5, sense="max")
solve(ex5)


print(ex5)

# Max Profit 
get.objective(ex5) 
# Product A
get.variables(ex5) [1]
# Product B
get.variables(ex5)[2]

plot(ex5)
