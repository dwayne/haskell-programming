module Print3Broken where

printSecond :: IO ()
printSecond = do
  putStrLn greeting -- Not in scope: 'greeting'

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  where greeting = "Yarrrrr"
