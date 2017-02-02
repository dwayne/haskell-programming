-- N.B. Yes = it squawks, No = it doesn't squawk i.e. it works

-- 1
bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10
-- Yes, because we're trying to apply a number to a number
wahoo = bigNum -- is one possile fix

-- 2
x = print
y = print "woohoo!"
z = x "hello world"
-- No

-- 3
a = (+)
-- b = 5
c = b 10
d = c 200
-- Yes, because b is not a function that takes two args
b = a -- is one possible fix

-- 4
a = 12 + b
b = 10000 * c
-- Yes, because c is not defined (assuming 3 was not defined in this file)
c = 1 -- is one possible fix
