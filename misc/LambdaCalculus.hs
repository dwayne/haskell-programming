{-# OPTIONS_GHC -Wall #-}
module LambdaCalculus where

type Var = Char

data Expr
  = Var Var
  | Lambda Var Expr
  | App Expr Expr
  deriving (Eq, Show)

{- Pretty prints an expression. -}
prettyPrint :: Expr -> String
prettyPrint (Var v) =
  [v]

prettyPrint (Lambda param body) =
  "\\" ++ [param] ++ "." ++ (prettyPrint body)

prettyPrint (App abstr@(Lambda _ _) abstr'@(Lambda _ _)) =
  "(" ++ prettyPrint abstr ++ ")"
  ++
  "(" ++ prettyPrint abstr' ++ ")"

prettyPrint (App abstr@(Lambda _ _) expr) =
  "(" ++ prettyPrint abstr ++ ")"
  ++
  prettyPrint expr

prettyPrint (App expr abstr@(Lambda _ _)) =
  prettyPrint expr
  ++
  "(" ++ prettyPrint abstr ++ ")"

prettyPrint (App expr expr') =
  prettyPrint expr ++ prettyPrint expr'

-- Examples
--
-- putStrLn $ prettyPrint (Var 'x')
-- => x
--
-- putStrLn $ prettyPrint (Lambda 'x' (Var 'x'))
-- => \x.x
--
-- putStrLn $ prettyPrint (App (Lambda 'x' (Var 'x')) (Var 'y'))
-- => (\x.x)y
--
-- putStrLn $ prettyPrint (App (Lambda 'x' (Var 'x')) (App (Var 'y') (Var 'z')))
-- => (\x.x)yz
--
-- putStrLn $ prettyPrint (Lambda 'x' (Lambda 'y' (App (Var 'x') (Var 'y'))))
-- => \x.\y.xy

{- Determines whether or not a variable is free in an expression. -}
free :: Var -> Expr -> Bool
free x (Var y)          = x == y
free x (Lambda y body)  = x /= y && free x body
free x (App expr expr') = free x expr || free x expr'

-- Examples
--
-- free 'x' (Var 'x')
-- => True
--
-- free 'x' (Var 'y')
-- => False
--
-- free 'x' (Lambda 'x' (Var 'x'))
-- => False
--
-- free 'y' (Lambda 'x' (App (Var 'x') (Var 'y')))
-- => True
