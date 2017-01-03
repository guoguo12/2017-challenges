open Core.Std

let int_list_of_string s =
  String.split ~on:' ' s
  |> List.map ~f:int_of_string

(* Use a counter to track item counts.
 * Return item with highest count. *)
let find_majority xs =
  let table = Int.Table.create () in
  let update x = match Hashtbl.find table x with
    | None -> Hashtbl.set table ~key:x ~data:1
    | Some v -> Hashtbl.set table ~key:x ~data:(v + 1)
  in
  List.iter ~f:update xs;
  Hashtbl.to_alist table
  |> List.sort ~cmp:(fun (k1, v1) (k2, v2) -> v1 - v2)
  |> List.last_exn
  |> fun (k, _) -> k

let _ =
  printf "%s" "> ";
  read_line () |> int_list_of_string |> find_majority |> printf "%d\n"
