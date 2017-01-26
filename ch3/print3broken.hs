module Print3Broken where

-- To make it compile
-- 1. Define greeting at the top-level
greeting :: String
greeting ="Yarrrrr"

printSecond :: IO ()
printSecond = do
  putStrLn greeting -- Not in scope: 'greeting'

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  -- 2. This can be commented out
  -- where greeting = "Yarrrrr"
