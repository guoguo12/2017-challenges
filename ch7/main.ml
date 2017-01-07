open Core.Std

let solve xs =
  let sum_of = List.fold ~init:0 ~f:(+) in
  let length = List.length xs in
  let triangle n = n * (n + 1) / 2 in
  triangle length - sum_of xs

let _ =
  let show_solution xs =
    let problem = List.to_string Int.to_string xs in
    let solution = solve xs in
    printf "%s -> %d\n" problem solution
  in
  List.iter ~f:show_solution [
    [0; 2];
    [1; 2; 3; 4];
    [0; 1; 2; 3; 4; 5; 7; 8; 9]
  ]
