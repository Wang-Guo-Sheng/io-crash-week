Matrix := List clone do(
    m ::= 0 # rows
    n ::= 0 # columns

    // init ram with zeros
    dim := method(x, y, 
        tmp := list(); 
        for(i, 1, x, m = y; n = x; tmp push(0)); 
        for(i, 1, y, call target push(tmp)); call target
    )

    // set an element
    set := method(x, y, val, 
        tmp := call target at(y) clone
        tmp atPut(x, val)
        call target atPut(y, tmp)
    )

    // get an element
    get := method(x, y, call target at(y) at(x))

    // append a row
    matrix_push := method(new, 
        if(call target size == 0,
            call target n := (new size),
            if((new size) != (call target at(0) size),
                raise("size does not match.")
            )
        )
        call target push(new)
        m = m + 1
    )
)

A := Matrix clone
A dim(3, 5)
A println
A set(2, 3, 6)
A set(1, 2, 5)
A set(2, 4, 3)
A println
A get(2, 3) println

"----Transpose----" println

Matrix transpose := method(
    x := call target m
    y := call target n
    M := Matrix clone dim(x, y)
    # call target println
    # M println
    for(i, 0, x - 1, for(j, 0, y - 1, 
        M set(i, j, call target get(j, i))))
)

A transpose println

"----Read File----" println

B := Matrix clone
file := File clone openForReading("mat.csv")
while(file isAtEnd == false,
    line := file readLine split(", ")
    B matrix_push(line)
)
file close

B println
B transpose println
