module Optional where

data Optional a
  = Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

  mappend (Only x) (Only y) = Only $ mappend x y
  mappend (Only x) _        = Only x
  mappend _        (Only y) = Only y
  mappend _        _        = Nada

-- tests
-- import Data.Monoid
-- Only (Sum 1) `mappend` Only (Sum 1)
-- Only (Product 4) `mappend` Only (Product 2)
-- Only (Sum 1) `mappend` Nada
-- Only [1] `mappend` Nada
-- Nada `mappend` Only (Sum 1)
