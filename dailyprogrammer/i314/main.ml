open Core.Std

let solve s =
  let n = String.length s in
  List.range 0 n
  |> List.map ~f:(fun i -> i, (String.suffix s (n - i)) ^ (String.prefix s i))
  |> List.sort ~cmp:(fun (_, s1) (_, s2) -> String.compare s1 s2)
  |> List.hd_exn
  |> Tuple2.uncurry (Printf.printf "%d %s\n")

let _ =
  solve "onion";
  solve "bbaaccaadd";
  solve "alfalfa";
  solve "weugweougewoiheew";
  solve "pneumonoultramicroscopicsilicovolcanoconiosis"
