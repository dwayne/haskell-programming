cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- 1
-- appedCatty "woohoo!"
-- => woops mrow woohoo!

-- 2
-- frappe "1"
-- => "1 mrow haha"

-- 3
-- frappe (appedCatty "2")
-- => "woops mrow 2 mrow haha"

-- 4
-- appedCatty (frappe "blue")
-- => "woops mrow blue mrow haha"

-- 5
-- cattyConny (frappe "pink")
--            (cattyConny "green" (appedCatty "blue"))
-- => "pink mrow haha mrow green mrow woops mrow blue"

-- 6
-- cattyConny (flippy "Pugs" "are") "awesome"
-- => "are mrow Pugs mrow awesome"
