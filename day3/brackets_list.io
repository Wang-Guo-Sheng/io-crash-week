curlyBrackets := method(
    r := List clone
    call message arguments foreach(arg,
        r push(doMessage(arg))
    )
    r
)

listString := "{1,{2,3},\"four\"}"
readList := doString(listString)
readList println
