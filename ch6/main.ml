open Core.Std

let solve xs =
  (* Append a sentinel number to the list to force the final run to be added
   * to the list of results. *)
  let xs' = xs @ [(List.last_exn xs) + 2] in
  List.fold xs' ~init:(None, []) ~f:(fun (current_run, result) x ->
    match current_run with
    | None -> (Some (x, x), result)
    | Some (start, last) ->
        if x = last + 1 then
          (Some (start, x), result)
        else if start <> last then
          (Some (x, x), result @ [sprintf "%d->%d" start last])
        else (Some (x, x), result))
  |> snd

let _ =
  let show_solution xs =
    let problem = List.to_string Int.to_string xs in
    let solution = List.to_string ident (solve xs) in
    printf "%s -> %s\n" problem solution
  in
  List.iter ~f:show_solution [
    [1; 2];
    [1];
    [1; 2; 3; 4; 8; 9; 10];
    [1; 2; 4; 5; 7; 8; 10; 11; 13; 14; 16];
    [1; 2; 3; 4; 5; 10; 11; 15; 16; 20]
  ]
