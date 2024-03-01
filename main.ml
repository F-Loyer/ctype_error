open Ctypes

open Foreign

let my_function = foreign "my_function" (int @-> returning int)
external __my_function__ : unit -> unit = "my_function" 
let () = print_int @@ my_function 42
