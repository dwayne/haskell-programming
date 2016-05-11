module Listy where

newtype Listy a = Listy [a]
  deriving (Eq, Show)

-- Uncomment to see the orphan instances error
-- instance Monoid (Listy a) where
--   mempty = Listy []
--   mappend (Listy l) (Listy l') = Listy $ mappend l l'
