// Create 2dArray prototype

Array := Object clone

Array dim := method(x,y,
	outerList := list()
	for (i, 0, y-1, 			
		innerList := list()
		for (j, 0, x-1,
			innerList push(0)
		)
		outerList push(innerList)
	)
	result := Array clone
	result backingList := outerList
	result
)
Array set := method(x,y,value,		
	self backingList at(y) atPut(x, value)
)

Array get := method(x,y,
	self backingList at(y) at(x)
)

// Setup 2d array
mine := Array dim(2,3)
mine set(0,0,10)
mine set(0,1,14)
mine set(0,2,18)
mine set(1,0,20)
mine set(1,1,22)
mine set(1,2,24)

writeln("Get element at 1,1 (expect:22) -> ", mine get(1,1))
writeln("Get element at 0,2 (expect:18) -> ", mine get(0,2))
 