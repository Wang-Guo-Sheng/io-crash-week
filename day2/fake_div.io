// Redefine division operator to return 0 for 0 denomination

OperatorTable addOperator("div", 2)

(1 / 2) println

# tmp := method(a, b, a / b)
# tmp(1, 2) println
0 div := method(den, 0)
Number div := method(den, if(den == 0, 0, (call target) / den))

(0 div 2) println
