module Lib where

import Test.QuickCheck
import Test.QuickCheck.Function

-- The Functor Laws
--
-- fmap id == id
-- fmap (f . g) == (fmap f) . (fmap g)

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Functor f, Eq (f c)) => (a -> b) -> (b -> c) -> f a -> Bool
functorCompose f g x = fmap (g . f) x == fmap g (fmap f x)

-- tests
-- quickCheck $ \x -> functorIdentity (x :: [Int])
-- quickCheck $ \x -> functorIdentity (x :: Maybe String)
-- quickCheck $ \x -> functorCompose (*2) (+1) (x :: [Int])
-- quickCheck $ \x -> functorCompose (*2) (+1) (x :: Maybe Int)

functorCompose' :: (Functor f, Eq (f c)) => (Fun a b) -> (Fun b c) -> f a -> Bool
functorCompose' (Fun _ f) (Fun _ g) x = fmap (g . f) x == fmap g (fmap f x)

-- tests
-- type IntToInt = Fun Int Int
-- type IntFC = IntToInt -> IntToInt -> [Int] -> Bool
-- quickCheck (functorCompose' :: IntFC)
--
-- type IntToString = Fun Int String
-- type StringToDouble = Fun String Double
-- type T = IntToString -> StringToDouble -> Maybe Int -> Bool
-- quickCheck (functorCompose' :: T)

-- Exercises: Instances of Functor

-- 1
newtype Identity a = Identity a deriving (Eq, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = arbitrary >>= return . Identity
