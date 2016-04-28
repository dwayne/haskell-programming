fibs = 1 : scanl (+) 1 fibs

-- 1

fibs20 = take 20 fibs

-- 2

fibsLessThan100 = takeWhile (< 100) fibs
-- N.B. filter won't work here

-- 3

factorial = scanl (*) 1 [2..]
