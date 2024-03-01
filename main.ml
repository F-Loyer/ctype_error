open Ctypes

open Foreign

let f = foreign "f" (int @-> returning int)
external __f__ : unit -> unit = "f" 
let () = print_int @@ f 42
