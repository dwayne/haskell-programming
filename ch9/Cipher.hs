module Cipher where

import Data.Char

-- N.B. Currently, it only works with the 26 lowercase characters.

encode :: Char -> Int
encode ch = ord ch - ord 'a'

decode :: Int -> Char
decode n = chr (ord 'a' + n)

shift :: (Int -> Int -> Int) -> Int -> Char -> Char
shift f n ch = decode $ mod (f (encode ch) n) 26

rightShift :: Int -> Char -> Char
rightShift = shift (+)

leftShift :: Int -> Char -> Char
leftShift = shift (-)

caesar :: Int -> String -> String
caesar n = map (rightShift n)

unCaesar :: Int -> String -> String
unCaesar n = map (leftShift n)
