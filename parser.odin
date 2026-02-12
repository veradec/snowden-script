// #+feature dynamic-literals

package snowden_parser
import "core:fmt"
import "core:os"
import "core:strings"
import "core:math"

// keywords :: []string{"print", "add", "subtract", "for", "while"}

find_keywords :: proc(line: string) -> int {
    
    tokens := strings.split(line, " ")
    idx:int
    res:int = -1
    loop : for token,idx in tokens {
	if(idx == 0){
	    switch token {
	    case "print" :
		println(..tokens[1:])
		break loop

	    case "add" :
		res =  add(..tokens[1:])
		break loop
	    case "exp" :
		res = exp(..tokens[1:])
		break loop
	    case "mult":
		res = mult(..tokens[1:])
	    case "div":
		res = div(..tokens[1:])
	    case "//" :
		break loop
		case:
		if(len(tokens) > 1 && tokens[idx+1] == "="){
		    set_variable(token, ..tokens[2:])
		} else {
		    fmt.println("UNKOWN STATEMENT FOUND")
		}
	    }
	    	     

	} 
    }
	    return res
}

split_by_line :: proc(file: string) {
    lines := strings.split(file, "\n")
    idx: int
    for line, idx in lines {
	// fmt.printf("line -> %d -> %s\n", idx, line)
	find_keywords(line)
    }

}

main :: proc(){
    file_path :: "/home/san/code/snowden/test.sd"
    f, ok := os.read_entire_file(file_path, context.allocator)
    if !(ok) {
	fmt.println("Couldn't read the file")
	os.exit(1)
    }
    defer delete(f,context.allocator)
    string_file := string(f)
    split_by_line(string_file)

}
