import Data.Time

data DatabaseItem
  = DbString String
  | DbNumber Integer
  | DbDate UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  , DbNumber 999
  ]

-- 1
-- Filters for DbDate values and returns
-- a list of the UTCTime values inside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = [t | (DbDate t) <- db]

-- 2
-- Filters for DbNumber values and returns
-- a list of the Integer values inside them
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = [n | (DbNumber n) <- db]

-- 3
-- Gets the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4
-- Sums all of the DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5
-- Gets the average of the DbNumber values
avgDb :: [DatabaseItem] -> Double
avgDb db = if n == 0 then 0 else (fromIntegral total) / n
  where
    numbers = filterDbNumber db
    (total, n) = foldr (\num (subtotal, count) -> (subtotal + num, count + 1))
                       (0, 0)
                       numbers
