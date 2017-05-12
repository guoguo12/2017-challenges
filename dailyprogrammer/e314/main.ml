open Core.Std

(* Must use "with type ..." or OCaml will not recognize that
 * "string list" and "StringListElt.t" are equivalent. *)
module StringListElt : (Set.Elt with type t = string list) = struct
  type t = string list
  let compare = List.compare String.compare
  let t_of_sexp = List.t_of_sexp String.t_of_sexp
  let sexp_of_t = List.sexp_of_t String.sexp_of_t
end

module StringListSet = Set.Make(StringListElt)

let rec factorial (n : int) : int =
  if n <= 1 then n
  else n * (factorial (n - 1))

let permutations (xs : string list) : string list list =
  let target = factorial (List.length xs) in
  let set = ref StringListSet.empty in
  while StringListSet.length !set < target do
    set := StringListSet.add !set (List.permute xs)
  done;
  Set.to_list !set

let solve (input : string) : unit =
  let xs_permutations = String.split ~on:' ' input |> permutations in
  let int_of_strings xs = String.concat xs |> Int.of_string in
  let cmp a b = (int_of_strings a) - (int_of_strings b) in
  let max_sol = List.max_elt ~cmp:cmp xs_permutations
    |> Option.value ~default:[] |> String.concat in
  let min_sol = List.min_elt ~cmp:cmp xs_permutations
    |> Option.value ~default:[] |> String.concat in
  Printf.printf "%s %s\n" min_sol max_sol

let _ =
  solve "5 56 50";
  solve "79 82 34 83 69";
  solve "420 34 19 71 341";
  solve "17 32 91 7 46"
