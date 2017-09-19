module AsPatterns where

import Data.Char (toUpper)

isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf s t = go s t
  where
    go [] _ = True
    go _ [] = False
    go (a:as) (b:bs) = (a == b && go as bs) || go s bs

capitalizeWords :: String -> [(String, String)]
capitalizeWords = go . words
  where
    go [] = []
    go (w@(c:cs):ws) = (w, toUpper c : cs) : go ws
