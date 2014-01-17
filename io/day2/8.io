// Guess the number game
triesRemaining := 10
min := 1
max := 100
found := false
magicNumber := (Random value(max - min) + min) floor
guessDistance := 0

while (found != true and triesRemaining > 0,
	write("Give me your guess (Remaining: ", triesRemaining, ") - ")
	guess := File standardInput readLine asNumber
	if (guess == magicNumber, found = true; writeln("You did it!"),
		distance := (magicNumber - guess) abs
		if (triesRemaining < 10 and triesRemaining > 1, 
			if (distance > guessDistance, writeln("Colder"), writeln("Hotter"))				
		)
		guessDistance := distance
	)	
	triesRemaining := triesRemaining - 1
)
if (triesRemaining == 0 and found not, "Game Over Man! You Lose!" println)