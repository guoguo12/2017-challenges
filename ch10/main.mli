module type Stack_type = sig
  type t = Empty | Node of char * t
  val create : t
  val push : t -> char -> t
  val pop : t -> (char * t) option
  val is_empty : t -> bool
  val to_string : t -> string
  val show : t -> unit
end

val is_open_paren : char -> bool

val is_close_paren : char -> bool

val matching_parens : char -> char -> bool

val solve : string -> bool
