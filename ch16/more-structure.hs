-- 16.13 More structure, more functors

data Wrap f a
  = Wrap (f a)
  deriving (Eq, Show)
-- This looks so strange to me
--
-- But let's try to break it down
-- f and a are types
-- (f a) has to mean that f :: * -> * and a :: *
--
-- So, Wrap Maybe Int is a possible type
--
-- let a = 1 :: Int
-- let x = Wrap (Just a) :: Wrap Maybe Int


instance Functor f => Functor (Wrap f) where
  -- f :: a -> b
  -- fa :: f a
  --
  -- Hence, we need to fmap f over fa. But, that would mean
  -- we need f to be a Functor.
  --
  -- Thus,
  fmap f (Wrap fa) = Wrap (fmap f fa)
