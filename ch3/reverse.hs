module Reverse where

rvrs :: String -> String
rvrs x = concat [awesomeString, " ", isString, " ", curryString]
  where
    curryString   = take 5 x
    isString      = take 2 $ drop 6 x
    awesomeString = take 7 $ drop 9 x

-- Note: rvrs only works sensibly for the string "Curry is awesome",
-- and strings of a similar shape.

main :: IO ()
main = print $ rvrs "Curry is awesome"
