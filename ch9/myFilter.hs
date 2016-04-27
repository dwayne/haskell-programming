article :: String -> Bool
article "the" = True
article "an"  = True
article "a"   = True
article _     = False

myFilter :: String -> [String]
myFilter = (filter (not . article)) . words
