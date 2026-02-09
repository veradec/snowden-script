package snowden_parser

import "core:fmt"
import "core:strings"



set_variable :: proc (var: string, tokens: .. string){
    fmt.printf("Variable -> %s \n", var)
    fmt.printf("Value -> %s\n", tokens)

    res:int = find_keywords(strings.join(tokens, " "))
    fmt.printf("%s -> %d\n", var, res)
}

write_var :: proc(var: string, val: int){
    // WRITE
}
