module Either where


-- 1
-- >>> lefts' [Left 1, Left 2, Left 3]
-- [1, 2, 3]
-- >>> lefts' [Left 1, Right 2, Left 3]
-- [1, 3]
lefts' :: [Either a b] -> [a]
lefts' = foldr left []
  where
    left (Left a) as  = a:as
    left (Right _) as = as


-- 2
-- >>> rights' [Right 1, Right 2, Right 3]
-- [1, 2, 3]
-- >>> rights' [Right 1, Left 2, Right 3]
-- [1, 3]
rights' :: [Either a b] -> [b]
rights' = foldr right []
  where
    right (Right b) bs = b:bs
    right (Left _) bs  = bs


-- 3
-- >>> partitionEithers' [Left 1, Right 2, Left 3]
-- ([1, 3], [2])
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr partition ([], [])
  where
    partition (Left a) (as, bs)  = (a:as, bs)
    partition (Right b) (as, bs) = (as, b:bs)


-- 4
-- >>> eitherMaybe' (+1) (Left "hello")
-- Nothing
-- >>> eitherMaybe' (+1) (Right 1)
-- Just 2
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just $ f b


-- 5
-- >>> either' (+1) (*5) (Left 2)
-- 3
-- >>> either' (+1) (*5) (Right 2)
-- 10
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a)  = f a
either' _ g (Right b) = g b


-- 6
-- Same as eitherMaybe' but written in terms of either'
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' g = either' (const Nothing) (Just . g)
