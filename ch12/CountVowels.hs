module CountVowels where


countVowels :: String -> Integer
countVowels = len . filter isVowel


len :: [a] -> Integer
len [] = 0
len (_:xs) = 1 + len xs


isVowel :: Char -> Bool
isVowel c = c `elem` "aeiou"
