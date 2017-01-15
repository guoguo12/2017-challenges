open Core.Std

let (-|) = Fn.compose

module type Tree_type = sig
  type t = Null | Node of int * t * t
  val sexp_of_t : t -> Sexplib.Sexp.t
  val to_string : t -> string
  val t_of_sexp : Sexplib.Sexp.t -> t
  val from_string : string -> t
end

module Tree : Tree_type = struct
  type t = Null | Node of int * t * t [@@deriving sexp]
  let to_string = Sexp.to_string -| sexp_of_t
  let from_string = t_of_sexp -| Sexp.of_string
end

let _ =
  let open Tree in
  Node (1, Node (0, Null, Null), Node (2, Null, Null)) |> Tree.to_string |> print_string
