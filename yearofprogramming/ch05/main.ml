open Core.Std

let delete_index s i =
  let left = String.slice s 0 i in
  let right = String.slice s (i + 1) (String.length s) in
  left ^ right

let solve s t =
  String.fold t ~init:(s, "") ~f:(fun (s', results) ch ->
    match String.index s' ch with
    | None -> (s', (String.of_char ch) ^ results)
    | Some i -> (delete_index s' i, results))
  |> snd

let _ =
  let show_solution (s, t) =
    printf "%s, %s -> %s\n" s t (solve s t)
  in
  List.iter ~f:show_solution [
    ("allen", "nellan");
    ("abcd", "eabcd");
    ("abcdefghijklmno", "abcdefghijklmnop")
  ]
