open Core.Std

let int_list_of_string s =
  String.split ~on:' ' s
  |> List.map ~f:int_of_string

let has xs x =
  List.exists ~f:((=) x) xs

let exclude xs x =
  List.filter ~f:((<>) x) xs

let find_non_duplicate xs =
  (* First time you see a number, add it to `seen`.
   * Next time you see it, remove it. *)
  let rec helper seen = function
    | [] -> List.hd_exn seen
    | x :: xs -> helper (if has seen x then exclude seen x else x :: seen) xs
  in
  helper [] xs

let _ =
  printf "%s" "> ";
  read_line () |> int_list_of_string |> find_non_duplicate |> printf "%d\n"
