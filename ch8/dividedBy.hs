data DividedResult a = Result a | DividedByZero deriving Show

dividedBy :: Integral a => a -> a -> DividedResult a
dividedBy num denom
  | denom == 0                  = DividedByZero
  | signum num == signum denom  = Result r
  | otherwise                   = Result (-r)
  where
    r = go (abs num) (abs denom) 0
    go n d count
      | n < d     = count
      | otherwise = go (n - d) d (count + 1)
