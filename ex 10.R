# Set 2.2a - Question 10
library(lpSolveAPI)

# x1 : Grano, x2 : Wheatie
# 0.2x1 + 0.4x2 <= 60
#  x1   +        <= 200
#       +    x2  <= 120
# Z = x1 + 1.35x2

ex10 <- make.lp(3,2)
set.column(ex10, 1, c(.2, 1, 0))
set.column(ex10, 2, c(.4, 0, 1))
set.rhs(ex10, c(60,200,120))
set.objfn(ex10, c(1, 1.35))
set.constr.type(ex10, rep("<=", 3))
lp.control(ex10, sense="max")
solve(ex10)


print(ex10)

# Max Profit 
get.objective(ex10) 
grano <- get.variables(ex10)[1]
wheatie <- get.variables(ex10)[2]

# grano
cat(sprintf("%1.0f (%.0f percent)\n", grano, grano/(grano+wheatie)*100))
# wheatie
cat(sprintf(" %1.0f (%.0f percent)\n", wheatie, wheatie/(grano+wheatie)*100))

plot(ex10)