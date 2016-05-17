module WordNumber where

import Data.List (intersperse)
import Data.Maybe (fromJust)

digitToWord :: Int -> Maybe String
digitToWord 0 = Just "zero"
digitToWord 1 = Just "one"
digitToWord 2 = Just "two"
digitToWord 3 = Just "three"
digitToWord 4 = Just "four"
digitToWord 5 = Just "five"
digitToWord 6 = Just "six"
digitToWord 7 = Just "seven"
digitToWord 8 = Just "eight"
digitToWord 9 = Just "nine"
digitToWord _ = Nothing

digits :: Int -> [Int]
digits n
  | n == 0    = []
  | otherwise = digits (div n 10) ++ [mod n 10]

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map (fromJust . digitToWord) . digits
