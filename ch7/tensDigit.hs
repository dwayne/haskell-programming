-- 1

-- Given
-- tensDigit :: Integral a => a -> a
-- tensDigit x = d
--   where xLast = x `div` 10
--         d     = xLast `mod` 10

-- a)
tensDigit :: Integral a => a -> a
tensDigit x = d
  where (xLast, _) = x `divMod` 10
        (_, d)     = xLast `divMod` 10

-- b) Yes, my version has the same type as the original

-- c)
hundredsDigit :: Integral a => a -> a
hundredsDigit = tensDigit . (`div` 10)
