{-# LANGUAGE FlexibleInstances #-}
-- Option 1.1 and 3

class TooMany a where
  tooMany :: a -> Bool

-- 1

-- Use with Option 1.1
-- instance TooMany (Int, String) where
--   tooMany (n, _) = n > 42

-- Option 1.2
newtype Pair = Pair (Int, String) deriving Show

instance TooMany Pair where
  tooMany (Pair (n, _)) = n > 42

-- 2

newtype Group = Group (Int, Int) deriving Show

instance TooMany Group where
  tooMany (Group (m, n)) = m + n > 42

-- 3

-- Requires FlexibleInstances
instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany $ x + y
-- Can I do it another way?
