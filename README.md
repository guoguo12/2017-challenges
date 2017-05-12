My solutions to coding puzzles drawn from [Year of Programming](https://github.com/YearOfProgramming/2017Challenges) and [r/dailyprogrammer](https://www.reddit.com/r/dailyprogrammer/), written in OCaml using [Core](https://github.com/janestreet/core).

See subdirectories for build instructions.

## Things learned
* How to use `Hashtbl`.
* How to use [ppx_sexp_conv](https://github.com/janestreet/ppx_sexp_conv) (and the [*deriving* framework](https://github.com/whitequark/ppx_deriving) in general).
* When writing a new module, must repeat signature in ML file, even when present in MLI file.
* Parens around tuples are actually optional in many cases, but it is clearer to use parens.
* Use parens to disambiguate when using `as` in `match` clauses.
* Be careful when partially applying infix operators: `((>) 0)` means "less than zero?". Compare to `(>0)` in Haskell.
* OCaml has some weird math operators, like `(~-)` for negation and `( * )` for multiplication.
* The form `if A then B` can be used in iterative code; `B` must evaluate to `()`.
* Use parens to disambiguate when nesting `match` expressions.
* A for-loop evaluates to `()`, meaning it may require a semicolon after the `end`.
