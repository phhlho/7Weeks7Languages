// Extend 2dArray with file IO

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

Array save := method(filename,
	f := File with(filename)
	f remove
	f openForUpdating
	currentArray := self backingList
	for (y, 0, currentArray size - 1,
		currentList := currentArray at(y)
		for (x, 0, currentList size - 1,
			if (x != 0, f write(","))
			f write(currentList at(x) asString)			
		)
		f write("\n")
	)
	f close
)

Array load := method(filename,
	f := File with(filename)
	f openForReading
	line := f readLine
	lines := list()
	while (line != nil,
		lines push(line)
		line := f readLine
	)
	ySize := lines size
	xSize := lines at(0) split(",") size
	
	newArray := Array dim(xSize, ySize)
	for (y, 0, ySize - 1,
		yList := lines at(y) split(",")
		for (x, 0, yList size - 1,
			newArray set(x,y, yList at(x))
		)
	)
	newArray		
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
mine save("test.txt")

mine transpose

writeln("Post-transpose")
writeln("Get element at 1,1 (expect:22) -> ", mine get(1,1))
writeln("Get element at 2,0 (expect:18) -> ", mine get(2,0)) 
writeln("Get element at 2,1 (expect:24) -> ", mine get(2,1))

reload := Array load("test.txt")
writeln("Post-reload")
writeln("Get element at 1,1 (expect:22) -> ", reload get(1,1))
writeln("Get element at 0,2 (expect:18) -> ", reload get(0,2))
writeln("Get element at 1,2 (expect:24) -> ", reload get(1,2))
