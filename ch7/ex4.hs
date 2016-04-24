dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

-- oneIsOne y == 1 + y * 10
--
-- oneIsTwo x == x + 2 * 10
--            == x + 20

--  1. dodgy 1 0 = 1 + 0 * 10 = 1
--  2. dodgy 1 1 = 1 + 1 * 10 = 11
--  3. dodgy 2 2 = 2 + 2 * 10 = 22
--  4. dodgy 1 2 = 1 + 2 * 10 = 21
--  5. dodgy 2 1 = 2 + 1 * 10 = 12
--  6. oneIsOne 1 = 1 + 1 * 10 = 11
--  7. oneIsOne 2 = 1 + 2 * 10 = 21
--  8. oneIsTwo 1 = 1 + 20 = 21
--  9. oneIsTwo 2 = 2 + 20 = 22
-- 10. oneIsOne 3 = 1 + 3 * 10 = 31
-- 11. oneIsTwo 3 = 3 + 20 = 23
