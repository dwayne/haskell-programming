{-# LANGUAGE ViewPatterns #-}

module Main where

import Test.QuickCheck
import Test.QuickCheck.Function


prop_FunctorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
prop_FunctorIdentity f = fmap id f == f


prop_FunctorCompose :: (Functor f, Eq (f c)) => (a -> b) -> (b -> c) -> f a -> Bool
prop_FunctorCompose f g x = fmap g (fmap f x) == fmap (g . f) x


prop_FunctorCompose' :: (Functor f, Eq (f c)) => Fun a b -> Fun b c -> f a -> Bool
prop_FunctorCompose' (Fun _ f) (Fun _ g) x = fmap g (fmap f x) == fmap (g . f) x


test1 = quickCheck $ \x -> prop_FunctorIdentity (x :: [Int])


-- The problem with this test is that we have to specify specific functions.
-- What if we can generate arbitrary functions for the test?
-- It turns out we can.
test2 = quickCheck $ \x -> prop_FunctorCompose (+1) (*2) (x :: [Int])


type IntToInt = Fun Int Int

test3 = quickCheck $ \f g x -> prop_FunctorCompose' (f :: IntToInt) (g :: IntToInt) (x :: [Int])


testExamples :: IO ()
testExamples = test1 >> test2 >> test3


-- Exercises: Instances of Func

-- 1
newtype Identity a = Identity a deriving (Eq, Show)


instance Functor Identity where
  fmap f (Identity a) = Identity (f a)


identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)


instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen


testIdentity = do
  quickCheck $ \x -> prop_FunctorIdentity (x :: Identity Int)
  quickCheck $ \f g x -> prop_FunctorCompose' (f :: IntToInt) (g :: IntToInt) (x :: Identity Int)


-- 2
data Pair a = Pair a a deriving (Eq, Show)


instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)
  -- Initially it looked to me like 3 functors could be defined here. The
  -- other two possibilities being:
  --
  --   1. fmap f (Pair x y) = Pair (f x) y
  --   2. fmap f (Pair x y) = Pair x (f y)
  --
  -- But, if you look at the types you'd have a problem:
  --
  --   1. f x :: b, y :: a => Pair (f x) y is not of type Pair b
  --   2. x :: a, f y :: b => Pair x (f y) is not of type Pair b


pairGen :: Arbitrary a => Gen (Pair a)
pairGen = do
  x <- arbitrary
  y <- arbitrary
  return $ Pair x y


instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = pairGen


testPair = do
  quickCheck $ \x -> prop_FunctorIdentity (x :: Pair Int)
  quickCheck $ \f g x -> prop_FunctorCompose' (f :: IntToInt) (g :: IntToInt) (x :: Pair Int)


-- 3
data Two a b = Two a b deriving (Eq, Show)


instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)


twoGen :: (Arbitrary a, Arbitrary b) => Gen (Two a b)
twoGen = do
  a <- arbitrary
  b <- arbitrary
  return $ Two a b


instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = twoGen


testTwo = do
  quickCheck $ \x -> prop_FunctorIdentity (x :: Two String Int)
  quickCheck $ \f g x -> prop_FunctorCompose' (f :: IntToInt) (g :: IntToInt) (x :: Two String Int)


-- Todo: 4, 5, 6, 7


-- 8
data Trivial = Trivial
-- Trivial can't be an instance of Functor since Trivial isn't a
-- type constructor, i.e.
--
-- > :kind Trivial
-- *


main :: IO ()
main = do
  testExamples
  testIdentity
  testPair
  testTwo
