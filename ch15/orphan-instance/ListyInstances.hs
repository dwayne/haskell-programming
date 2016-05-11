module ListyInstances where

import Data.Monoid
import Listy

instance Monoid (Listy a) where
  mempty = Listy []
  mappend (Listy l) (Listy l') = Listy $ mappend l l'
