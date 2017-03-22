module FixerUpper where

-- Exercise: Fixer Upper

-- 1
f :: Maybe String
f = const <$> Just "Hello" <*> pure "World"


-- 2
g :: Maybe (Int, Int, String, [Int])
g = (,,,) <$> Just 90
          <*> Just 10
          <*> Just "Tierness"
          <*> pure [1, 2, 3]
