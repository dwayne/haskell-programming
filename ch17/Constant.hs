module Constant where

-- Exercise: Constant Instance

newtype Constant a b
  = Constant { getConstant :: a }
  deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant a) = Constant a

-- This was confusing to define but the examples helped
instance Monoid a => Applicative (Constant a) where
  pure _ = Constant mempty
  (Constant x) <*> (Constant y) = Constant $ mappend x y
