ans := Random value(100) round
Curses init
for(i, 1, 10, 
    Curses move(5, 7)
    "Guess" print
    "Guess" println
    guess := Curses input(3)
    Curses refresh
    if(guess == ans, "Correct" println; exit)
    if(guess > ans, "Too large", "Too small")
)
Curses end
