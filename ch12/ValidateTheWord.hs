module ValidateTheWord where


newtype Word' = Word' String deriving (Eq, Show)


vowels = "aeiou"


mkWord :: String -> Maybe Word'
mkWord s =
  let
    (nVowels, nConsonants) = foldr count (0, 0) s
    count c (nv, nc)
      | c `elem` vowels = (nv + 1, nc)
      | otherwise       = (nv, nc + 1)
  in
    if nVowels > nConsonants
    then Nothing
    else Just (Word' s)
