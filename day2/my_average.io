list(1,2,3,4) average println
# list(1,2,3,"four") average println

List myAverage := method(
    call target foreach(ele, 
            if(ele type == "Number", ifError,
                Exception raise("none-numerical list element.")
            )
        )
    (call target reduce(+)) / (call target size)
)

list(1,2,3,4) myAverage println
list(1,2,3,"four") myAverage println
