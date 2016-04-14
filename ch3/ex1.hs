-- Uncomment and load into GHCi to see that it fails with
-- Not in scope: 'd'
-- area d = pi * (r * r)
-- r = d / 2

area d = pi * (r * r)
  where r = d / 2
