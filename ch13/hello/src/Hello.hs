module Hello ( sayHello ) where

sayHello :: IO ()
sayHello = do
  putStrLn "hello world"
