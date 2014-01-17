// Extend 2dArray with transpose

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

Array transpose := method(
	if (backingList size > 0 and backingList at(0) size > 0, 
		currentArray := self backingList
		oldYSize := currentArray size
		oldXSize := currentArray at(0) size
		newArray := Array dim(oldYSize, oldXSize)
		for (x, 0, oldXSize - 1,
			for (y, 0, oldYSize -1,
				newArray set(y,x,self get(x,y))
			)
		)
	self backingList := newArray backingList		
	)
	return self
)

// Setup 2d array
mine := Array dim(2,3)
mine set(0,0,10)
mine set(0,1,14)
mine set(0,2,18)
mine set(1,0,20)
mine set(1,1,22)
mine set(1,2,24)

writeln("Pre-transpose")
writeln("Get element at 1,1 (expect:22) -> ", mine get(1,1))
writeln("Get element at 0,2 (expect:18) -> ", mine get(0,2))
writeln("Get element at 1,2 (expect:24) -> ", mine get(1,2))

mine transpose

writeln("Post-transpose")
writeln("Get element at 1,1 (expect:22) -> ", mine get(1,1))
writeln("Get element at 2,0 (expect:18) -> ", mine get(2,0)) 
writeln("Get element at 2,1 (expect:24) -> ", mine get(2,1))