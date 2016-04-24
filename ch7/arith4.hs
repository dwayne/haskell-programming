-- arith4.hs
module Arith4 where

-- id :: a -> a
-- id x = x

-- 4 and 5
-- roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
-- pointfree version
-- roundTrip = read . show

-- 6
roundTrip :: (Show a, Read b) => a -> b
roundTrip = read . show

main = do
  -- 4 and 5
  -- print (roundTrip 4)

  -- 6
  print (roundTrip 4 :: Int)

  print (id 4)
