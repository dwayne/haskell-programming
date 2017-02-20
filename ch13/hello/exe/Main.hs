module Main where

import System.IO

import DogsRule
import Hello


main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Please input your name: "
  name <- getLine
  sayHello name
  dogs
