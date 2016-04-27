module MyWords where

myWords :: String -> [String]
myWords []       = []
myWords (' ':s)  = myWords s
myWords s        = w : myWords t
  where
    w = takeWhile (/= ' ') s
    t = dropWhile (/= ' ') s
