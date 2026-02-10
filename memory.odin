package snowden_parser

import "core:fmt"
import "core:strings"

vars:[255]string
vals:[255]int

idx:int

set_variable :: proc (var: string, tokens: .. string) -> bool{
    fmt.printf("Variable -> %s \n", var)
    fmt.printf("Value -> %s\n", tokens)

    res:int = find_keywords(strings.join(tokens, " "))
    fmt.printf("%s -> %d\n", var, res)
    return (write_var(var,res))
}

write_var :: proc(var: string, val: int) -> bool{
    for f in vars{
	if(f == var){
	    return false;
	}
    }

    vars[idx] = var
    vals[idx] = val
    idx+=1
    return true;
}

read_var :: proc(var: string) -> int {
    idx =0
    for f,idx in vars {
	if(f == var){
	    return vals[idx]
	}
    }

    return -1
}
