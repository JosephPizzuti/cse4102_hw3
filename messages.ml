(* This file was auto-generated based on "parser.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 30 ->
        "Unexpected end of file\n"
    | 28 ->
        "Unexpected )\n"
    | 25 ->
        "Expected expression after .\n"
    | 24 ->
        "Expected dot after identifier\n"
    | 23 ->
        "Expected identifier after lambda\n"
    | 22 ->
        "Unexpected )\n"
    | 19 ->
        "Expected expression after .\n"
    | 18 ->
        "Expected . after identifier\n"
    | 17 ->
        "Expected identifier after lambda\n"
    | 15 ->
        "Unexpected end of input\n"
    | 12 ->
        "Expected expression after .\n"
    | 11 ->
        "Expected . after identifier\n"
    | 10 ->
        "Expected identifier after lambda\n"
    | 9 ->
        "Expected expression after .\n"
    | 4 ->
        "Expected expression after .\n"
    | 3 ->
        "Expected . after identifier\n"
    | 2 ->
        "Expected identifier after lambda\n"
    | 1 ->
        "Expected expression\n"
    | 0 ->
        "Unexpected )\n"
    | _ ->
        raise Not_found
