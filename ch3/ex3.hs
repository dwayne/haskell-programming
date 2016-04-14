-- 2

addBang s = s ++ "!"

getFourthAsString s = take 1 $ drop 4 s

drop9 s = drop 9 s

-- 3

thirdLetter :: String -> Char
thirdLetter x = x !! 2


-- 4

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x
