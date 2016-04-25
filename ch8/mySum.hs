mySum :: (Eq a, Num a) => a -> a
mySum = go 0
  where
    go s n =
      let
        sign = signum n
      in
        if sign == (-1) || sign == 0 then
          s
        else
          go (s + n) (n - 1)
