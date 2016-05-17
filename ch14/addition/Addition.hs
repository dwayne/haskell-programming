module Addition where

import Test.Hspec

-- Example 1
-- main :: IO ()
-- main = hspec $ do
--   describe "Addition" $ do
--     it "1 + 1 is greater than 1" $ do
--       (1 + 1) > 1 `shouldBe` True
--     it "2 + 2 is equal to 4" $ do
--       2 + 2 `shouldBe` 4

-- Example 2
-- dividedBy :: Integral a => a -> a -> (a, a)
-- dividedBy num denom = go num denom 0
--   where
--     go n d count
--       | n < d = (count, n)
--       | otherwise = go (n - d) d (count + 1)
--
-- main :: IO ()
-- main = hspec $ do
--   describe "Addition" $ do
--     it "15 divided by 3 is 5" $ do
--       dividedBy 15 3 `shouldBe` (5, 0)
--     it "22 divided by 5 is 4 remainder 2" $ do
--       dividedBy 22 5 `shouldBe` (4, 2)

-- Short Exercise
myMult :: (Eq a, Num a) => a -> a -> a
myMult x y
  | sy == 0 || sy == 1                 = go x y 0
  | sy == (-1) && (sx == 0 || sx == 1) = go y x 0
  | otherwise                          = go ax ay 0
  where
    sx = signum x
    sy = signum y
    ax = abs x
    ay = abs y
    go _ 0 ab = ab
    go a b ab = go a (b - 1) (a + ab)

main :: IO ()
main = hspec $ do
  describe "Multiplication" $ do
    it "5 multiplied by 0 is 0" $ do
      myMult 5 0 `shouldBe` 0
    it "0 multiplied by 5 is 0" $ do
      myMult 0 5 `shouldBe` 0
    it "2 multiplied by 3 is 6" $ do
      myMult 2 3 `shouldBe` 6
    it "-2 multiplied by 3 is -6" $ do
      myMult (-2) 3 `shouldBe` (-6)
    it "2 multiplied by -3 is -6" $ do
      myMult 2 (-3) `shouldBe` (-6)
    it "-2 multiplied by -3 is 6" $ do
      myMult (-2) (-3) `shouldBe` 6
