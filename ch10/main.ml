open Core.Std

module type Stack_type = sig
  type t = Empty | Node of char * t
  val create : t
  val push : t -> char -> t
  val pop : t -> (char * t) option
  val is_empty : t -> bool
  val to_string : t -> string
  val show : t -> unit
end

module Stack : Stack_type = struct
  type t = Empty | Node of char * t
  let create = Empty
  let push stack new_ch = Node (new_ch, stack)
  let pop = function
    | Empty -> None
    | Node (ch, next) -> Some (ch, next)
  let is_empty = function
    | Empty -> true
    | Node _ -> false
  let rec to_string = function
    | Empty -> ""
    | Node (ch, next) -> (String.of_char ch) ^ (to_string next)
  let show stack = to_string stack |> printf "%s\n"
end

let is_open_paren ch =
  ch = '(' || ch = '{' || ch = '['

let is_close_paren ch =
  ch = ')' || ch = '}' || ch = ']'

let matching_parens ch1 ch2 =
  (ch1 = '(' && ch2 = ')') ||
  (ch1 = '{' && ch2 = '}') ||
  (ch1 = '[' && ch2 = ']')

let solve str =
  (* Iterative OCaml code! *)
  let stack = ref Stack.create in
  let is_balanced = ref true in
  for i = 0 to (String.length str) - 1 do
    let ch = str.[i] in
    if is_open_paren ch then
      stack := Stack.push !stack ch
    else if is_close_paren ch then
      match Stack.pop !stack with
      | None -> is_balanced := false
      | Some (last_ch, new_stack) ->
          if not (matching_parens last_ch ch) then (
            is_balanced := false
          );
          stack := new_stack
  done;
  !is_balanced && Stack.is_empty !stack

let _ =
  let show_solution str = printf "%s -> %B\n" str (solve str) in
  List.iter ~f:show_solution [
    "()";
    "(((())))";
    "([{ocaml}])";
    ")(";
    "(()";
    "(}";
    "{{{{{{{{{adfkjaefia}}}}}}}";
    "{{{{{{{{{[[[[[[kadfa{{{{{{{((({daljfdaf({{{[]}}kaldjfs})})))}}}}}}}]]]]]]}kjfela}}}}}}}}";
    "{{{[}}}}dafda";
    "{{{{{{{{{}}}}}}}}}";
    "[[[[[[[[[kafjalfeianfailfeja;fjai;efa;sfj]]]]]]]]]kjajdain";
    " ";
    "((((((fjdalfeja((((alefjalisj(())))))))))))d";
    ")))(((d";
    "({)}"
  ]
