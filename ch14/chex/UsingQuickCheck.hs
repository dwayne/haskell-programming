module UsingQuickCheck where

import Test.QuickCheck
import Data.List (sort)


-- 1.
half :: Fractional a => a -> a
half x = x / 2


halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half


prop_halfIdentity :: (Eq a, Fractional a) => a -> Bool
prop_halfIdentity x = halfIdentity x == x


qc_halfIdentity :: IO ()
qc_halfIdentity = do
  quickCheck (prop_halfIdentity :: Float -> Bool)
  quickCheck (prop_halfIdentity :: Double -> Bool)


-- 2.
-- for any list you apply sort to this property should hold
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
  where
    go _ status@(_, False) = status
    go y (Nothing, t) = (Just y, t)
    go y (Just x, _) = (Just y, x >= y)

-- See https://wiki.haskell.org/File:Right-fold-transformation.png
--
-- listOrdered [1, 2]
-- = snd $ 1 --- go --- go
--                     /  \
--                    2   (Nothing, True)
-- = snd $ 1 --- go --- (Just 2, True)
-- = snd $ (Just 1, True)
-- = True


prop_sortListOrdered :: (Ord a) => [a] -> Bool
prop_sortListOrdered = listOrdered . sort


qc_sortListOrdered :: IO ()
qc_sortListOrdered = do
  quickCheck (prop_sortListOrdered :: [Int] -> Bool)
  quickCheck (prop_sortListOrdered :: [String] -> Bool)


-- 3.
prop_plusAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
prop_plusAssociative x y z = x + (y + z) == (x + y) + z


prop_plusCommutative :: (Eq a, Num a) => a -> a -> Bool
prop_plusCommutative x y = x + y == y + x


qc_plus :: IO ()
qc_plus = do
  quickCheck (prop_plusAssociative :: Int -> Int -> Int -> Bool)
  quickCheck (prop_plusCommutative :: Int -> Int -> Bool)


-- 4.
prop_multAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
prop_multAssociative x y z = x * (y * z) == (x * y) * z


prop_multCommutative :: (Eq a, Num a) => a -> a -> Bool
prop_multCommutative x y = x * y == y * x


qc_mult :: IO ()
qc_mult = do
  quickCheck (prop_multAssociative :: Int -> Int -> Int -> Bool)
  quickCheck (prop_multCommutative :: Int -> Int -> Bool)


-- 5.
-- N.B. We need to ignore division by 0 in both cases.

prop_quotRem :: (Eq a, Integral a) => a -> a -> Bool
prop_quotRem x y = y == 0 || (quot x y) * y + (rem x y) == x


prop_divMod :: (Eq a, Integral a) => a -> a -> Bool
prop_divMod x y = y == 0 || (div x y) * y + (mod x y) == x


qc_quotRem :: IO ()
qc_quotRem = do
  quickCheck (prop_quotRem :: Int -> Int -> Bool)


qc_divMod :: IO ()
qc_divMod = do
  quickCheck (prop_divMod :: Int -> Int -> Bool)


-- 6.
-- Is (^) associative or commutative?

prop_powerAssociative :: (Eq a, Integral a) => a -> a -> a -> Bool
prop_powerAssociative x y z = (x ^ y) ^ z == x ^ (y ^ z)


prop_powerCommutative :: (Eq a, Integral a) => a -> a -> Bool
prop_powerCommutative x y = x ^ y == y ^ x


qc_powerAssociative :: IO ()
qc_powerAssociative = do
  quickCheck (prop_powerAssociative :: Int -> Int -> Int -> Bool)
-- It fails for x=0, y=0, z=0 since
-- LHS: (0 ^ 0) ^ 0 = 1 ^ 0 = 1
-- RHS: 0 ^ (0 ^ 0) = 0 ^ 1 = 0
-- LHS /= RHS


qc_powerCommutative :: IO ()
qc_powerCommutative = do
  quickCheck (prop_powerCommutative :: Int -> Int -> Bool)
-- It fails for x=0, y=1
-- LHS: 0 ^ 1 = 0
-- RHS: 1 ^ 0 = 1
-- LHS /= RHS


-- Just my curiousity
-- I wonder what values it would use to show that addition does not
-- distribute over multiplication

prop_addDistribution :: (Eq a, Num a) => a -> a -> a -> Bool
prop_addDistribution x y z = x + (y * z) == (x * y) + (x * z)


qc_addDistribution :: IO ()
qc_addDistribution = do
  quickCheck (prop_addDistribution :: Int -> Int -> Int -> Bool)
-- It fails for x=0, y=1, z=1
-- LHS: 0 + (1 * 1) = 0 + 1 = 1
-- RHS: (0 * 1) + (0 * 1) = 0 + 0 = 0
-- LHS /= RHS


-- 7.
prop_reverseId :: (Eq a) => [a] -> Bool
prop_reverseId xs = (reverse . reverse) xs == xs


qc_reverseId :: IO ()
qc_reverseId = quickCheck (prop_reverseId :: [Char] -> Bool)


-- 8.
-- To be completed.


-- 9.
-- To be completed.


-- 10.
-- To be completed.


-- 11.
-- To be completed.
