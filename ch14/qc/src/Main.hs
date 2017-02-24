module Main where

import CoArbitrary
import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)


main :: IO ()
main = do
  sample trivialGen


-- Trivial

data Trivial = Trivial deriving (Eq, Show)


trivialGen :: Gen Trivial
trivialGen = return Trivial


instance Arbitrary Trivial where
  arbitrary = trivialGen


-- Identity

data Identity a = Identity a deriving (Eq, Show)


identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)


instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen


identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen


-- Pair

data Pair a b = Pair a b deriving (Eq, Show)


pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)


instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
  arbitrary = pairGen


pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen


-- Sum

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)


-- equal odds for each
sumGenEqual :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof [ return $ First a
        , return $ Second b
        ]


sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual


sumGenFirstPls :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenFirstPls = do
  a <- arbitrary
  b <- arbitrary
  frequency
    [ (10, return $ First a)
    , (1, return $ Second b)
    ]


sumGenCharIntFirst :: Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls
