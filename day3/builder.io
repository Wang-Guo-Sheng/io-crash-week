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
    // Must use an external sequence to store result, otherwise cannot know when to move `>` after the arguments.
    XML_seq appendSeq(indent, "<", call message name, ">\n")
    Builder indent = indent appendSeq(unit_indent)

    is_first := true
    call message arguments foreach(
        arg,
        content := self doMessage(arg)

        //convert XML artributes
        if(is_first and content type == "Map",
            seq := Sequence clone
            content keys foreach(key,
                seq appendSeq(" ", key, "=\"", content at(key), "\"")
            )
            XML_seq removeLast removeLast
            XML_seq appendSeq(seq, ">\n")
        )

        // convert XML elements
        if(
            content type == "Sequence",
            seq := Sequence clone appendSeq(indent)
            seq appendSeq(content)
            XML_seq appendSeq(seq, "\n")
        )
        is_first = false
    )

    Builder indent := indent exSlice(0, indent size - 4)
    XML_seq appendSeq(indent, "</", call message name, ">\n")
)

s := File with("ul.LispML") openForReading contents
s println
XML_seq := Sequence clone
Builder doString(s) println
writeln
s := File with("book.LispML") openForReading contents
s println
XML_seq := Sequence clone
Builder doString(s) println
