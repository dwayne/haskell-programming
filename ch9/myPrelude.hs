-- 1
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs
-- myOr (x:xs) = if x then True else myOr xs

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs
-- myAny f (x:xs) = if (f x) then True else myAny f xs

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem e (x:xs) = x == e || myElem e xs
-- Alternatively,
--
-- myElem e l = myAny (== e) l

-- 4
myReverse :: [a] -> [a]
myReverse = iter []
  where
    iter accum [] = accum
    iter accum (x:xs) = iter (x:accum) xs
-- Alternatively,
--
-- myReverse [] = []
-- myReverse (x:xs) = myReverse xs ++ [x]

-- 5
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = prepend x $ squish xs
 where
   prepend [] rest = rest
   prepend (x:xs) rest = x : prepend xs rest

-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = prepend (f x) $ squishMap f xs
  where
    prepend [] rest = rest
    prepend (x:xs) rest = x : prepend xs rest

-- 7
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy comp (x:xs) =
  let
    y = myMaximumBy comp xs
  in
    case comp x y of
      LT -> y
      EQ -> x
      GT -> x

-- 9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy comp (x:xs) =
  let
    y = myMinimumBy comp xs
  in
    case comp x y of
      LT -> x
      EQ -> x
      GT -> y

-- 10
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
