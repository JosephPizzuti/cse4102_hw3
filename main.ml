open Lambda

let rec repl () =
  try
    let _ = Printf.printf "\n> %!" in
    let line = input_line stdin in
    if String.starts_with ~prefix:"#quit;;" line then
      ()
    else
      let line = line ^ "\n" in
      let lexbuf = Lexing.from_string line in
      (
        try
          let e = Parser.main Lexer.token lexbuf in
          ignore (interp e);
          repl ()
        with
        | Parser.Error s ->
           (Printf.eprintf "Column %d: Syntax error: %s\n%!"
              (Lexing.lexeme_start lexbuf)
              (Messages.message s);
            repl ())
        | Lambda.UnboundVariable ->
           (Printf.eprintf "Unbound Variable\n%!";
            repl ())
      )
  with
  | Lexer.ParseError s ->
     (Printf.eprintf "%s\n%!" s;
      repl ()
     )
  | End_of_file -> ()

let _ = Printf.printf "Welcome to the CSE4102 Lambda interpreter.\n"
let _ = Printf.printf "Type #quit;; to quit.\n"
let _ = repl ()
