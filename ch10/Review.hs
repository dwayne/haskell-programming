stops = "pbtdkg"
vowels = "aeiou"

-- 1

-- a)
triples = [(x, y, z) | x <- stops, y <- vowels, z <- stops]

-- b)
triplesP =
  [(x, y, z) | x <- stops, y <- vowels, z <- stops, x == 'p']

-- c)
nouns = ["he", "dog", "restaurant", "cat"]
verbs = ["run", "call", "type"]

nounVerbNoun = [(x, y, z) | x <- nouns, y <- verbs, z <- nouns]

-- 2
-- It computes average word length.
seekritFunc :: String -> Int
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))

-- 3
avgWordLength :: Fractional a => String -> a
avgWordLength s = fromIntegral totalLength / fromIntegral numWords
  where
    theWords = words s
    totalLength = sum $ map length theWords
    numWords = length theWords
