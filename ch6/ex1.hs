-- Exercises: Eq Instances


-- 1

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn m) (TisAn n) = m == n

-- 2

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = a == a' && b == b'

-- 3

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt m) (TisAnInt n)     = m == n
  (==) (TisAString s) (TisAString t) = s == t
  (==) _ _                           = False

-- 4

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = x == x' && y == y'

-- 5

data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'

-- 6

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne v) (ThisOne v') = v == v'
  (==) (ThatOne v) (ThatOne v') = v == v'
  (==) _ _                      = False

-- 7

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello v) (Hello v')     = v == v'
  (==) (Goodbye v) (Goodbye v') = v == v'
  (==) _ _                      = False
