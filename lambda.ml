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
  match e_in with
  | Var y             -> if x = y then e_to_sub else Var y
  | App (e1, e2)      -> App (subst e_to_sub x e1, subst e_to_sub x e2)
  | Lambda (y, body)  ->
      if x = y 
      then Lambda (y, body)
      else Lambda (y, subst e_to_sub x body)

exception UnboundVariable

let rec step (e: expr) : expr option =
  match e with
  | Var _         -> raise UnboundVariable
  | Lambda _      -> None
  | App (e1, e2)  ->
      match step e1 with
      | Some e1' -> Some (App (e1', e2))
      | None ->
          match step e2 with
          | Some e2' -> Some (App (e1, e2'))
          | None ->
              match e1 with
              | Lambda (x, body) -> Some (subst e2 x body)
              | _ -> None

let rec interp (e : expr) : expr =
  Printf.printf "%s\n%!" (pretty_print e);
  match step e with
  | None -> e
  | Some e' -> interp e'
