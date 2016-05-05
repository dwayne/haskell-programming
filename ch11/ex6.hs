import Data.Int -- needed for Int8

-- 1

data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- Its cardinality is 2 + 2 = 4.

-- 2

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

-- Its cardinality is 256 + 2 = 258.

large = Numba 200 -- larger than 127
-- You get a warning that Literal 200 is out of the Int8 range -128..127

small = Numba (-200) -- smaller than -128
-- You get a warning that Literal 200 is out of the Int8 range -128..127

-- Interestingly,
x = Numba (-128) -- generates a warning that Literal 128 is out of the Int8
                 -- range -128..127
