-- Analysis
--
-- Given, h = [h_1, h_2, ..., h_n] we can devise a general solution to the
-- problem as follows:
--
-- Let,
--   n   = number of walls,
--   w_i = the ith wall,
--   h_i = the height of the ith wall,
--   v_i = the volume of water that will remain on w_i when rain falls
--
-- where 1 <= i <= n.
--
-- Then, the solution to our problem is sum { v_i }.
--
-- Now, v_1 = v_n = 0.
--
-- Let,
--   hlr_i = the greatest height that can be attained (water + wall height) at
--           w_i considering only the walls to the left of w_i
--         = max { h_k } where 1 <= k <= i-1
--
--   hrl_i = the greatest height that can be attained (water + wall height) at
--           w_i considering only the walls to the right of w_i
--         = max { h_k } where i+1 <= k <= n
--
-- N.B. lr is supposed to be a mnemonic for left-to-right and similarly rl is
-- supposed to be a mnemonic for right-to-left.
--
-- Hence,
--
--   v_i + h_i = min (hlr_i, hrl_i)
--         v_i = min (hlr_i, hrl_i) - h_i
volume :: Integral a => [a] -> (a, [a])
volume h =
  let
    -- computes v_i
    v = zipWith (-)
                (zipWith min
                         -- computes hlr_i
                         (scanl1 max h)

                         -- computes hrl_i
                         (scanr1 max h))
                h
  in
    (sum v, v)
