module type Tree_type = sig
  type t = Leaf of int | Node of int * t * t
  val sexp_of_t : t -> Sexplib.Sexp.t
  val to_string : t -> string
  val reverse : t -> t
end
