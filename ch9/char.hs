import Data.Char

-- 1

-- :t isUpper
-- isUpper :: Char -> Bool

-- :t toUpper
-- toUpper :: Char -> Char

-- 2

-- We would use isUpper.

uppercases :: String -> String
uppercases = filter isUpper

-- tests
-- uppercases "HbEfLrLxO"

-- 3

capitalize :: String -> String
capitalize ""     = ""
capitalize (c:cs) = toUpper c : cs

-- tests
-- capitalize ""
-- capitalize "julie"

-- 4

capitalizeAll :: String -> String
capitalizeAll ""     = ""
capitalizeAll (c:cs) = toUpper c : capitalizeAll cs

-- tests
-- capitalizeAll ""
-- capitalizeAll "woot"

-- 5 and 6

capitalizeHead :: String -> Char
-- capitalizeHead s = (toUpper (head s))
-- capitalizeHead s = (toUpper . head) s
capitalizeHead = toUpper . head

-- tests
-- capitalizeHead "julie"
