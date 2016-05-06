module AsPatterns where

import Data.Char (toUpper)

isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf s@(x:xs) (y:ys) =
  (x == y && isSubsequenceOf xs ys) || isSubsequenceOf s ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords = go . words
  where
    go [] = []
    go (w@(c:cs):ws) = (w, toUpper c : cs) : go ws
