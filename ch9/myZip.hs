myZip :: [a] -> [b] -> [(a, b)]
myZip _ []          = []
myZip [] _          = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

-- tests
-- myZip [1, 2, 3] [4, 5, 6]
-- myZip [1, 2] [4, 5, 6]
-- myZip [1, 2, 3] [4]
-- myZip [] [1..1000000000000000000]
-- myZip ['a'] [1..1000000000000000000]
-- myZip [1..100] ['a'..'c']
