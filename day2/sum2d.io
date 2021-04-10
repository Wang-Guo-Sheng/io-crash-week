# sum := method(lst, res := 0; lst foreach(ele, res = res + ele); res)
# sum2d := method(lst2d, res := 0; lst2d foreach(vec, res = res + sum(vec)); res)
sum := method(lst, lst reduce(+))
sum2d := method(lsts, res := 0; lsts foreach(lst, res = res + sum(lst)); res)

sum(list(1,2,3)) println
sum2d(list(list(1,2,3), list(4,5,6))) println