package snowden_parser

import "core:fmt"
println :: proc(tokens: ..string){
    for token in tokens do fmt.print(token , " ")
    fmt.println()
}

