-- 1
-- Returns True if any Bool in the list is True
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2
-- Returns True if a -> Bool applied to any of the
-- values in the list returns True
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False
-- f        :: a -> Bool
-- (||)     :: Bool -> Bool -> Bool
-- (||) . f :: a -> Bool -> Bool

-- N.B. Not sure how to get rid of the f.

-- 3
-- In addition to the recursive and fold based myElem, write a version
-- that uses any
myElem :: Eq a => a -> [a] -> Bool
-- recursive
-- myElem x [] = False
-- myElem x (y:ys) = x == y || myElem x ys

-- fold based
-- myElem x = foldr ((||) . (== x)) False

-- using any
myElem x = any (== x)

-- 4
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5
-- Behaves the same as the built-in map
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []
-- f       :: a -> b
-- (:)     :: b -> [b] -> [b]
-- (:) . f :: a -> [b] -> [b]

-- 6
-- Behaves the same as the built-in map
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b -> if f a then a : b else b) []

-- 7
-- Flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (flip $ foldr (:)) []

-- 8
-- Maps a function over a list and concatenates the results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> foldr (:) b (f a)) []

-- 9
-- squishAgain flattens a list of lists into a list. This it time re-uses
-- the squishMap function
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10
-- It takes a comparison function and a list and returns the greatest element of
-- the list based on the last value that the comparison returned GT for
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy comp l@(x:xs) =
  foldr (\a b -> if comp a b == GT then a else b) x l
-- It doesn't produce the desired result for:
-- myMaximumBy (\_ _ -> LT) [1..10]
-- => 1 (should be 10)

-- 11
-- It takes a comparison function and a list and returns the least element of
-- the list based on the last value that the comparison returned LT for
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy comp l@(x:xs) =
  foldr (\a b -> if comp a b == LT then a else b) x l
-- It doesn't produce the desired result for:
-- myMinimumBy (\_ _ -> GT) [1..10]
-- => 1 (should be 10)

-- N.B. The only way I know how to get a value of type a is by taking the value
-- from the given list because we don't know anything about the type a.
