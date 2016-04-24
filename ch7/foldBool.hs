-- foldBool :: a -> a -> Bool -> a
-- foldBool = error "Error: Need to implement foldBool!"

-- Using a case expression
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y condition =
  case condition of
    True  -> x
    False -> y

-- Using guards
foldBool2 :: a -> a -> Bool -> a
foldBool2 x y condition
  | condition = x
  | otherwise = y
