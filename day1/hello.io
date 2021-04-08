#!/usr/bin/io

myObj := Object clone do(
	name ::= nil
	city ::= nil
	addr := method(list(name, city) join ("\n"))
)
myObj val ::= nil
myObj sayHello ::= nil

myObj slotNames print

myObj name := "Sam"
myObj name print
myObj name = "John"
myObj name print

myObj setSayHello("hello" print)
myObj sayHello
# myObj setAddr("hello" print) # raises no respond exception

myObj addr print
myObj proto type print
myObj addr type print

