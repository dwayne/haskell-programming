-- Exercise: Possibly

data Possibly a
  = LolNope
  | Yeppers a
  deriving (Eq, Show)


instance Functor Possibly where
  fmap f LolNope = LolNope
  fmap f (Yeppers a) = Yeppers (f a)
