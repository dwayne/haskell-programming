-- ex 7

-- 1
module Jammin where

                 -- 7       -- 8
import Data.List (maximumBy, sortBy, groupBy)

data Fruit
  = Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Show, Ord) -- 4 Add Ord

-- data JamJars = Jam Fruit Int deriving (Eq, Show)

-- 2
data JamJars = Jam {
  fruit :: Fruit, jarsCanned :: Int
} deriving (Eq, Show, Ord) -- 4 Add Ord

-- 3
--
-- The cardinality of JamJars is
-- 4 x 2^64 = 2^2 x 2^64 = 2^66 = 73786976294838206464

-- 5
row1 = Jam Peach 10
row2 = Jam Plum 5
row3 = Jam Apple 16
row4 = Jam Blackberry 12
row5 = Jam Peach 2
row6 = Jam Peach 1
row7 = Jam Apple 8
row8 = Jam Blackberry 4
allJam = [row1, row2, row3, row4, row5, row6, row7, row8]

-- 6
totalJarsCanned :: [JamJars] -> Int
totalJarsCanned = sum . (map jarsCanned)
-- test
-- totalJarsCanned (take 4 allJam) == 43

-- 7
compareCanned :: JamJars -> JamJars -> Ordering
compareCanned (Jam _ n) (Jam _ n') = compare n n'

mostRow :: [JamJars] -> JamJars
mostRow = maximumBy compareCanned
-- test
-- mostRow (take 4 allJam) == Jam { fruit = Apple, jarsCanned = 16 }

-- 9
compareKind :: JamJars -> JamJars -> Ordering
compareKind (Jam k _) (Jam k' _) = compare k k'

sortJam :: [JamJars] -> [JamJars]
sortJam = sortBy compareKind

-- 10
equalKind :: JamJars -> JamJars -> Bool
equalKind (Jam k _) (Jam k' _) = k == k'

groupJam :: [JamJars] -> [[JamJars]]
groupJam = (groupBy equalKind) . sortJam
