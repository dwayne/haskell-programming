module CountTheBeforeVowel where


countTheBeforeVowel :: String -> Integer
countTheBeforeVowel s =
  case words s of
    []       -> 0
    [w]      -> 0
    theWords ->
      let
        classifiedWords = map classify theWords
        count (IsThe, StartsWithVowel) accum = 1 + accum
        count _ accum                        = accum
      in
        foldr count 0 $ zip classifiedWords (tail classifiedWords)


data Classification = IsThe | StartsWithVowel | SomethingElse


classify :: String -> Classification
classify s
  | s == "the"        = IsThe
  | startsWithVowel s = StartsWithVowel
  | otherwise         = SomethingElse


startsWithVowel :: String -> Bool
startsWithVowel []     = False
startsWithVowel (c:cs) = isVowel c


isVowel :: Char -> Bool
isVowel c = c `elem` "aeiou"
