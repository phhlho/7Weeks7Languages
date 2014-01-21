// Enhance the xml example program to add attributes
OperatorTable addAssignOperator(":", "addAttribute")

Map addAttribute := method(
	self atPut(call evalArgAt(0), call evalArgAt(1))
)

curlyBrackets := method(
	r := Map clone	
	call message arguments foreach(arg,	
		r doMessage(arg)
	)
	r
)

Builder := Object clone
Builder forward := method(	
	tabs := 0
	if ((call sender type) == "Number") then(tabs := call sender + 1)
	attrString := "" asMutable
	if (call message arguments at(0) name == "curlyBrackets") then(
		attr := doMessage(call message arguments removeFirst)		
		attr keys foreach(key, 		
			// Need to strip "s from the key for some reason...
			keyText := key asMutable removeAt(0)
			keyText := keyText removeAt(keyText size - 1)
			value := attr at(key)
			attrString = attrString .. " #{keyText}=\"#{value}\"," interpolate
		)		
		if (attrString size > 0) then(attrString := attrString asMutable removeAt(attrString size - 1))
	) 		
	
	for(i,1,tabs, write("\t"))
	writeln("<", call message name, attrString, ">")	
	call message arguments foreach(
		arg,
		content := self doMessage(arg, tabs);		
		if(content type == "Sequence", for(i,1,tabs, write("\t"));writeln(content)))
	for(i,1,tabs, write("\t"))
	writeln("</", call message name, ">")
)

// Need to execute tests as separate script due to OperatorTable command
doFile("3-test.io")