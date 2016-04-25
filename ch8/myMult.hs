myMult :: Integral a => a -> a -> a
myMult x y
  | sy == 0 || sy == 1                 = go x y 0
  | sy == (-1) && (sx == 0 || sx == 1) = go y x 0
  | otherwise                          = go ax ay 0
  where
    sx = signum x
    sy = signum y
    ax = abs x
    ay = abs y
    go x 0 xy = xy
    go x y xy = go x (y - 1) (x + xy)
