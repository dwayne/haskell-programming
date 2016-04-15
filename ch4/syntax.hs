-- Reading Syntax

-- 1
x = (+)

f xs = w `x` 1
  where w = length xs

-- 2
myId = \x -> x

-- 3
myHead = \(x : xs) -> x

-- 4
myFst (a, b) = a
