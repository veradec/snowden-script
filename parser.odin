// #+feature dynamic-literals

package snowden_parser
import "core:fmt"
import "core:os"
import "core:strings"
import "core:math"

// keywords :: []string{"print", "add", "subtract", "for", "while"}

find_keywords :: proc(line: string) {
    
    tokens := strings.split(line, " ")
    idx:int
    loop : for token,idx in tokens {
	if(idx == 0){
	    switch token {
	    case "print" :
		println(..tokens[1:])
		break loop

	    case "add" :
		add(..tokens[1:])
		break loop
	    case "exp" :
		exp(..tokens[1:])
		break loop
	    case "mult":
		mult(..tokens[1:])
	    case "div":
		div(..tokens[1:])
	    case "//" :
		break loop
		case:
		if(len(tokens) > 1 && tokens[idx+1] == "="){
		    set_variable(token, ..tokens[1:])
		} else {
		    fmt.println("UNKOWN STATEMENT FOUND")
		}
	    }
	    	     

	} 
    }
}

split_by_line :: proc(file: string) {
    lines := strings.split(file, "\n")
    idx: int
    for line, idx in lines {
	fmt.printf("line -> %d -> %s\n", idx, line)
	find_keywords(line)
	fmt.println()
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
    it := string(f)
    split_by_line(it)

}
