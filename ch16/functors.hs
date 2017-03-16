-- 1
-- data FixMePls
--   = FixMe
--   | Pls
--   deriving (Eq, Show)
--
--
-- instance Functor FixMePls where
--   fmap = error "it doesn't matter, it won't compile"

-- 2
-- data FixMePls a
--   = FixMe
--   | Pls a
--   deriving (Eq, Show)
--
--
-- instance Functor FixMePls where
--   fmap = error "it doesn't matter, it won't compile"

-- 3
data FixMePls a
  = FixMe
  | Pls a
  deriving (Eq, Show)


instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)

-- 4
-- data FixMePls a
--   = FixMe
--   | Pls a
--   deriving (Eq, Show)
--
--
-- instance Functor (FixMePls a) where
--   fmap _ FixMe = FixMe
--   fmap f (Pls a) = Pls (f a)
