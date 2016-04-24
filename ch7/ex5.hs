-- 1

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  -- | otherwise = 'F'
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | y <  0.59 = 'F'
  where y = x / 100

-- If you put otherwise as the top-most guard then avgGrade will only ever
-- return 'F'.

-- 2

-- If you take avgGrade as it is written and reorder the guards it will still
-- typecheck but it will not work the same. For e.g. moving | y >= 0.7 and
-- placing it to the top of | y >= 0.9 will cause avgGrade to return a 'C' when
-- given 90. Previously, it would have returned an 'A'.

pal xs
  | xs == reverse xs = True
  | otherwise        = False

-- 3 b) It returns True when xs is a palindrome.

-- 4 The most general type for xs can be Eq a => [a].

-- 5

-- Prelude> :t pal
-- Eq a => [a] -> Bool

numbers x
  | x < 0  = -1
  | x == 0 = 0
  | x > 0  = 1

-- 6 c) It returns an indication of whether its argument is a positive or
-- negative number or zero.

-- 7 The most general type for x can be (Num a, Ord a) => a.

-- 8

-- Prelude> :t numbers
-- (Num a, Ord a, Num b) => a -> b
