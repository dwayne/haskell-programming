module BinaryTree where


data BinaryTree a
  = Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)


-- 1
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f a =
  case f a of
    Nothing -> Leaf
    Just (l, m, r) -> Node (unfold f l) m (unfold f r)


-- 2
-- >>> treeBuild 0
-- Leaf
-- >>> treeBuild 1
-- Node Leaf 0 Leaf
-- >>> treeBuild 2
-- Node (Node Leaf 1 Leaf) 0 (Node Leaf 1 Leaf)
-- >>> treeBuild 3
-- Node (Node (Node Leaf 2 Leaf) 1 (Node Leaf 2 Leaf)) 0 (Node (Node Leaf 2 Leaf) 1 (Node Leaf 2 Leaf))
treeBuild :: Integer -> BinaryTree Integer
treeBuild n
  | n < 0     = Leaf
  | otherwise = unfold f 0
    where
      f k
        | k == n    = Nothing
        | otherwise = Just (k+1, k, k+1)
