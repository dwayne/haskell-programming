newtype Constant a b
  = Constant { getConstant :: a }
  deriving (Eq, Show)
-- N.B. b is a phantom type
-- i.e. it has no corresponding witness at the value/term level


instance Functor (Constant a) where
  fmap _ (Constant a) = Constant a
  -- Initially I had
  --
  -- fmap _ c = c
  --
  -- But, that doesn't work since f :: b -> c and c :: Constant a b. Hence,
  -- the result type should be Constant a c which it isn't if we simply
  -- return c. That's why we have to deconstruct the type and then rebuild
  -- it and return the result.
