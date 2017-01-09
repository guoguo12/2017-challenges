open Core.Std

let rec merge xs ys =
  match xs, ys with
  | [], [] -> []
  | xs, [] -> xs
  | [], ys -> ys
  | (x :: xs as list1), (y :: ys as list2) ->
      if x < y then
        x :: (merge xs list2)
      else y :: (merge list1 ys)

let solve xs =
  let sq = List.map ~f:(fun x -> x * x) in
  let above_zero = List.filter ~f:((<) 0) xs |> sq in
  let equal_to_zero = List.filter ~f:((=) 0) xs in
  let below_zero = List.filter ~f:((>) 0) xs |> sq in
  List.concat [equal_to_zero; (merge above_zero (List.rev below_zero))]

let _ =
  let show_solution xs =
    let string_of_int_list = List.to_string ~f:Int.to_string in
    let problem = string_of_int_list xs in
    let solution = string_of_int_list (solve xs) in
    printf "%s -> %s\n" problem solution
  in
  List.iter ~f:show_solution [
    [-2; -1; 0; 1; 2];
    [-5; -4; -3; -2];
    [1; 2]
  ]
