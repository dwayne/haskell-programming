mySplit :: Char -> String -> [String]
mySplit _ [] = []
mySplit ch s@(c:cs) = if c == ch then mySplit ch cs else w : mySplit ch t
  where
    w = takeWhile (/= ch) s
    t = dropWhile (/= ch) s

myWords :: String -> [String]
myWords = mySplit ' '

myLines :: String -> [String]
myLines = mySplit '\n'
