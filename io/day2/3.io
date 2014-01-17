// Program to add up all numbers in 2d array

2dAdd := method(input, 
	total := 0
	for (i, 0, input size - 1, total := total + input at(i) sum)
	total
)


test2d := list(list(2,3,4), list(3,4,5), list(6,7,8))
writeln("This should be 42 -> ", 2dAdd(test2d))


