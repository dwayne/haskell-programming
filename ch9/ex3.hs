mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- 1
a = [(x, y) | x <- mySqr, y <- myCube]

-- 2
b = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- 3
c = length b
