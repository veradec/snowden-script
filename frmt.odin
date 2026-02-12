package snowden_parser

import "core:fmt"
import "core:strconv"
println :: proc(tokens: ..string){
    for token in tokens{
	if(token[0] == '$'){
	    check_for_var((token))
	    continue
	}
	fmt.print(token , " ")
    } 
    fmt.println()
}

check_for_var :: proc(token: string){
    if(token[0] == '$') {
	int_ret := read_var(token[1:])
	fmt.println(int_ret)

    }
}
