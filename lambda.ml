type expr =
  | Var of string
  | Lambda of string * expr
  | App of expr * expr

let rec pretty_print (e: expr) : string =
  match e with
  | Var x -> x
  | Lambda (x, e) -> "\\" ^ x ^ ". " ^ (pretty_print e)
  | App (e1, e2) ->
     (match e1 with
        Lambda _ -> "(" ^ (pretty_print e1) ^ ")"
      | _ -> pretty_print e1)
     ^ " " ^
       (match e2 with
        | Var _ -> pretty_print e2
        | _ -> "(" ^ (pretty_print e2) ^ ")")

let rec subst (e_to_sub : expr) (x : string) (e_in : expr) : expr =
  raise Util.Unimplemented

exception UnboundVariable

let rec step (e: expr) : expr option =
  raise Util.Unimplemented

let rec interp (e : expr) : expr =
  Printf.printf "%s\n%!" (pretty_print e);
  match step e with
  | None -> e
  | Some e' -> interp e'
