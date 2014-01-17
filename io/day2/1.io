// Fibonacci loop
fib := method(int, 
	value := 1
	if (int < 1) then (value := 0)
	if (int > 2) then(
			low := 1
			high := 1
			value := 1
			for(i, 3, int,
				value = low + high
				low = high
				high = value
			)
		)	
	value
)

// Fibonacci recursive (no smarts - just doing it)
fib_recur := method(int,
	value := 1
	if (int < 1) then (value := 0)
	if (int > 2) then (
		value := fib_recur(int - 1) + fib_recur(int - 2)
	)
	value
)

"Fib loop" println
for (i, 1, 10,
	if (i > 1, "," print)
	fib(i) print	
)
"" println

"Fib recur" println
for (i, 1, 10,
	if (i > 1, "," print)
	fib_recur(i) print	
)
"" println