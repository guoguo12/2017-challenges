open Core.Std

let (-|) = Fn.compose

module type Tree_type = sig
  type t = Null | Node of int * t * t
  val find_min : t -> int
  val delete : t -> int -> t
  val preorder : t -> int list
  val to_string : t -> string
  val print : t -> unit
end

module Tree : Tree_type = struct
  type t = Null | Node of int * t * t
  let rec find_min = function
    | Null -> Int.max_value
    | Node (_, l, _) when l != Null -> find_min l
    | Node (v, _, _) -> v
  let rec delete t target =
    match t with
    | Null -> Null
    | Node (v, l, r) when v == target -> (
        match (l, r) with
        | (Null, Null) -> Null
        | (l, Null) -> l
        | (Null, r) -> r
        | (l, r) ->
            let right_min = find_min r in
            Node (right_min, l, (delete r right_min))
    )
    | Node (v, l, r) ->
        match compare target v with
        | -1 -> Node (v, (delete l target), r)
        | 1 -> Node (v, l, (delete r target))
  let rec preorder = function
    | Null -> []
    | Node (v, l, r) ->
        List.append (preorder l) (v :: (preorder r))
  let to_string = List.to_string ~f:Int.to_string -| preorder
  let print = Printf.printf "%s\n" -| to_string
end

let _ =
  let open Tree in
  let t1 = Node (1, Node (0, Null, Null),
                    Node (2, Null,
                             Node (3, Null,
                                      Node (4, Null, Null)))) in
  Printf.printf "Tree 1: %s \n" (to_string t1);
  print_string "Deleting 0-4\n";
  for target = 0 to 4 do
    print (delete t1 target)
  done;
  let t2 = Node (4, Node (2, Node (1, Null, Null),
                             Node (3, Null, Null)),
                    Node (6, Node (5, Null, Null),
                             Node (7, Null, Null))) in
  Printf.printf "Tree 2: %s \n" (to_string t2);
  print_string "Deleting 1-7\n";
  for target = 1 to 7 do
    print (delete t2 target)
  done
