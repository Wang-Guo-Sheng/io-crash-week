ans := Random value(100) round println

for(i, 1, 10,
    "Guess " print
    guess := File standardInput readLine asNumber
    if(guess == ans, "Correct" println; break)
    if(guess > ans, "Too large" println, "Too small" println)
)
