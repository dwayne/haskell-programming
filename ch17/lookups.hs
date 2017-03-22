module Lookups where

import Data.List (elemIndex)

-- Exercises: Lookups

-- 1
added :: Maybe Integer
added = (+3) <$> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])


-- 2
y :: Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z
-- Try replacing y and/or z with Nothing
-- That's so cool how we've abstracted the possibility of failure
-- Look how simple the code for tupled has become
-- Though it takes some thinking to understand why it works


-- 3
x' :: Maybe Int
x' = elemIndex 3 [1, 2, 3, 4, 5]

y' :: Maybe Int
y' = elemIndex 4 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x' <*> y'


-- 4
as = [1, 2, 3]
bs = [4, 5, 6]

a :: Maybe Integer
a = lookup 3 $ zip as bs

b :: Maybe Integer
b = lookup 2 $ zip as bs

summed :: Maybe Integer
summed = sum <$> ((,) <$> a <*> b)
-- Is this correct?
-- sum for 2-tuple just returns the second element in the tuple
