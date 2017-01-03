open Core.Std

let reverse =
  let accum orig ch = (String.of_char ch) ^ orig in
  String.fold ~init:"" ~f:accum

let _ =
  printf "%s" "> ";
  read_line () |> reverse |> print_endline
