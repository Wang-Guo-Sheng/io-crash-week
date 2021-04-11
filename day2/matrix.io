Matrix := List clone do(
    m ::= 0 # rows
    n ::= 0 # columns

    // init ram with zeros
    dim := method(x, y, 
        tmp := list(); 
        for(i, 1, x, m = y; n = x; tmp push(0)); 
        for(i, 1, y, self push(tmp)); self
    )

    // set an element
    set := method(x, y, val, 
        tmp := self at(y) clone
        tmp atPut(x, val)
        self atPut(y, tmp)
    )

    // get an element
    get := method(x, y, self at(y) at(x))

    // append a row
    matrix_push := method(new, 
        if(self size == 0,
            self n := (new size),
            if((new size) != (self at(0) size),
                raise("size does not match.")
            )
        )
        self push(new)
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
    x := self m
    y := self n
    M := Matrix clone dim(x, y)
    # self println
    # M println
    for(i, 0, x - 1, for(j, 0, y - 1, 
        M set(i, j, self get(j, i))))
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
