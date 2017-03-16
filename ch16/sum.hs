-- Short Exercise

-- 1
data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)


instance Functor (Sum a) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)


-- 2
-- It's impossible to define a Functor in the first argument since
-- we have no way of telling Haskell to fix the second argument.
--
-- Let a and b be arbitrary types, then
--
-- > :k Sum a b
-- *
--
-- > :k Sum a
-- * -> *
--
-- > :k Sum
-- * -> * -> *
--
-- But there is no way to fix b and get a type constructor
-- > :k Sum _ b
