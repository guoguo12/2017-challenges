My OCaml solutions to [these challenges](https://github.com/YearOfProgramming/2017Challenges).

## Things learned
* How to use `Hashtbl`.
* How to use [ppx_sexp_conv](https://github.com/janestreet/ppx_sexp_conv) (and the [*deriving* framework](https://github.com/whitequark/ppx_deriving) in general).
* When writing a new module, must repeat signature in ML file, even when present in MLI file.

## Build instructions

You will need [Core](https://github.com/janestreet/core) and any plugins mentioned above.

Run `make chX; ch0/main.native` to build and run the code for Challenge 0.
