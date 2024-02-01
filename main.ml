open Ctypes

open Foreign

let f = foreign "f" (int @-> returning int)

let () = print_int @@ f 42
