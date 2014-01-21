// Extend lists to work with square brackets

List squareBrackets := method(	
	if (call target size == 0) then(return call message arguments) else(return call target at(call message argAt(0) asString asNumber))
)

writeln("---Original List---")
y := list(3,4,5)
writeln("This shoudl be 4->", y at(1))

writeln("---Bracket List---")
x := list[3,4,5]
writeln ("This should be 4->", x[1])