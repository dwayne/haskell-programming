module IOFunctor where


main :: IO ()
main = putStr "> " >> getInt >>= (putStrLn . show)


getInt :: IO Int
getInt = fmap read getLine
