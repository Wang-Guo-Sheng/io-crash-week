// Redefine division operator to return 0 for 0 denomination

(1 / 2) println

OperatorTable addOperator("div", 2)
// This would not work unless input line by line in terminal
// https://iolanguage.org/guide/guide.html#Syntax-Operators
// Note that this change will not effect the source file in which the OperatorTable is modified as the full file is parsed before it is evaluated.

Number div := method(den, call target / den)
message(1 div 2) println
1 div 2 println
