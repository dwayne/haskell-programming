myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ []          = []
myZipWith _ [] _          = []
myZipWith f (x:xs) (y:ys) = (f x y) : myZipWith f xs ys

-- tests
-- myZipWith (+) [1, 2, 3] [10, 11, 12]
-- myZipWith (*) [1, 2, 3] [10, 11, 12]
-- myZipWith (==) ['a'..'f'] ['a'..'m']
-- myZipWith max [10, 5, 34, 9] [6, 8, 12, 7]

myZip :: [a] -> [b] -> [(a, b)]
myZip = myZipWith (,)

-- tests
-- myZip [1, 2, 3] [4, 5, 6]
-- myZip [1, 2] [4, 5, 6]
-- myZip [1, 2, 3] [4]
-- myZip [] [1..1000000000000000000]
-- myZip ['a'] [1..1000000000000000000]
-- myZip [1..100] ['a'..'c']
