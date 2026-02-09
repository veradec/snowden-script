package snowden_parser

import "core:fmt"
import "core:strconv"
import "core:os"


add :: proc(tokens:..string) -> int {
    res :int
    loop :for token in tokens {
	temp,ok := strconv.parse_int(token)
	res += temp
	if !(ok){
	    break loop;
	}
    }

    return res
}

mult :: proc(tokens:..string) -> int{
    res :int = 1
    loop :for token in tokens {
	temp,ok := strconv.parse_int(token)
	res *= temp
	if !(ok){
	    break loop;
	}
    }

    return res
}
div :: proc(tokens:..string) -> int{
    res :int = 1
    loop :for token in tokens {
	temp,ok := strconv.parse_int(token)
	res = temp / res
	if !(ok){
	    break loop;
	}
    }

    return res
}

exp_res :: proc(x: int, y: int) -> int {
    res: int = 1
    for i in 0..<y{
	res = res * x
    }

    return res
}

exp :: proc(tokens:..string) -> int {
    if(len(tokens) > 2){
	fmt.println("more than 2 args")
	os.exit(1)
    }

    x, ok := strconv.parse_int(tokens[0])
    if (ok == false){
	fmt.println("You fucked up")
    }
    y:int
    y, ok = strconv.parse_int(tokens[1])
    if(ok == false){
	fmt.println("You fucked up")
    }
    return (exp_res(x,y))

}

