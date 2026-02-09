package snowden_parser
import "core:fmt"
set_variable :: proc (var: string, tokens: .. string){
    fmt.printf("Variable -> %s \n", var)
    fmt.printf("Value -> %s\n", tokens)
    
}
