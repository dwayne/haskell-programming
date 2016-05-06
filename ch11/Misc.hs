module Misc where

import Data.Char (toUpper)

-- 1

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (c:cs) = toUpper c : cs

-- 2

capitalizeParagraph :: String -> String
capitalizeParagraph = go True
  where
    go _ [] = []
    go doIt (' ':cs) = ' ' : go doIt cs
    go doIt ('.':cs) = '.' : go True cs
    go False (c:cs)  = c : go False cs
    go True (c:cs)   = toUpper c : go False cs

-- I didn't need to reuse the capitalizeWord function.
