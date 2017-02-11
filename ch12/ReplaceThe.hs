module ReplaceThe where

import Data.List (intercalate)

-- This may not be the solution they had in mind.


replaceThe :: String -> String
replaceThe s = intercalate " " $ map theToA (words s)
  where
    theToA :: String -> String
    theToA "the"  = "a"
    theToA s      = s
