module Vigenere where

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

vigenere :: String -> String -> String
vigenere keyword = zipWith (rightShift . encode) (concat $ repeat keyword)
-- test
-- vigenere "ally" "meetatdawn"
-- => "mppraeoywy"

unVigenere :: String -> String -> String
unVigenere keyword = zipWith (leftShift . encode) (concat $ repeat keyword)
-- test
-- unVigenere "ally" "mppraeoywy"
-- => "meetatdawn"
