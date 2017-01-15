open Core.Std

(* We assume we are dealing with a full binary tree. *)
module type Tree_type = sig
  type t = Leaf of int | Node of int * t * t
  val sexp_of_t : t -> Sexplib.Sexp.t
  val to_string : t -> string
  val reverse : t -> t
end

module Tree : Tree_type = struct
  type t = Leaf of int | Node of int * t * t [@@deriving sexp_of]
  let to_string tree = sexp_of_t tree |> Sexp.to_string
  let rec reverse = function
    | Leaf x -> Leaf x
    | Node (x, left, right) -> Node (x, (reverse right), (reverse left))
end

let _ =
  let open Tree in
  let show_transform tree =
    printf "%s -> %s\n" (to_string tree) (to_string (reverse tree))
  in
  List.iter ~f:show_transform [
    Leaf 0;
    Node (0, Leaf 1, Leaf 2);
    Node (0, Leaf 1, Node (2, Leaf 3, Leaf 4));
    Node (0, Leaf 1, Node (2, Leaf 3, Leaf 4));
    Node (4, Node (2, Leaf 1, Leaf 3), Node (7, Leaf 6, Leaf 9))
  ]
