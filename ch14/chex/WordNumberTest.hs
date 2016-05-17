module WordNumberTest where

import Test.Hspec
import WordNumber (digitToWord, digits, wordNumber)

main :: IO ()
main = hspec $ do
  describe "digitToWord" $ do
    it "returns Just zero for 0" $ do
      digitToWord 0 `shouldBe` Just "zero"
    it "returns Just one for 1" $ do
      digitToWord 1 `shouldBe` Just "one"

  describe "digits" $ do
    it "returns [1] for 1" $ do
      digits 1 `shouldBe` [1]
    it "returns [1, 0, 0] for 100" $ do
      digits 100 `shouldBe` [1, 0, 0]

  describe "wordNumber" $ do
    it "returns one-zero-zero for 100" $ do
      wordNumber 100 `shouldBe` "one-zero-zero"
    it "returns nine-zero-zero-one for 9001" $ do
      wordNumber 9001 `shouldBe` "nine-zero-zero-one"
