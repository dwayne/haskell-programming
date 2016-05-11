Demonstrates the orphan instance problem.

Compile with: `stack ghc -- -I. --make ListyInstances.hs`.

To illustrate:

1. Copy the Monoid instance from `ListInstances.hs` into `Listy.hs`.
2. Recompile.
3. See the problem occur.
