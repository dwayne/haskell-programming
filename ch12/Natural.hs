module Natural where

data Nat
  = Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat k
  | k < 0 = Nothing
  | otherwise = Just $ go k
  where
    go 0 = Zero
    go k = Succ $ go $ k - 1
