module Hutton where

data Expr
  = Lit Integer
  | Add Expr Expr

eval :: Expr -> Integer
eval (Lit n) = n
eval (Add a b) = eval a + eval b

-- test
-- eval (Add (Lit 1) (Lit 9001))

printExpr :: Expr -> String
printExpr (Lit n) = show n
printExpr (Add a b) = printExpr a ++ " + " ++ printExpr b

-- test
-- printExpr (Add (Lit 1) (Lit 9001))
--
-- let a1 = Add (Lit 9001) (Lit 1)
-- let a2 = Add a1 (Lit 20001)
-- let a3 = Add (Lit 1) a2
-- printExpr a3
