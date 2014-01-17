// Create a myAverage function on list
list proto setSlot("myAverage", 
	method(
		sum := 0		
		for (i, 0, self size - 1,
			val := self at(i)
			val println
			if (val type == "Number", sum := sum + val, Exception raise("Non-number in list!"))
		)		
		if (self size == 0, nil, sum / self size)
	)
)

writeln("This should be 2.66 ->", list(1,2,5) myAverage)

writeln("Empty list average ->", list() myAverage)

writeln("Bad list average ->", list(1,2,"three",4) myAverage)