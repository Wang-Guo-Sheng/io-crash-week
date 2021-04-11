Builder := Object clone do(
    indent := Sequence clone
    // To make a mutable sequence use Sequence clone, rather than specifying an empty string, which would be immutable.
    unit_indent := "    "
)

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1))
)

Builder forward := method(
    writeln(indent, "<", call message name, ">")
    Builder indent = indent appendSeq(unit_indent)
    call message arguments foreach(
        arg,
        content := self doMessage(arg);

        //convert XML artributes
        if(
            content type == "Map",
            seq := Sequence clone
            content keys foreach(key,
                seq appendSeq(key, "=\"", content at(key), "\"")
            )
            writeln(seq)
        )

        // convert XML elements
        if(
            content type == "Sequence",
            seq := Sequence clone appendSeq(indent)
            seq appendSeq(content)
            writeln(seq)
        )

    )
    Builder indent := indent exSlice(0, indent size - 4)
    writeln(indent, "</", call message name, ">")
)

s := File with("ul.LispML") openForReading contents
s println
Builder doString(s)
writeln
s := File with("book.LispML") openForReading contents
s println
Builder doString(s)
