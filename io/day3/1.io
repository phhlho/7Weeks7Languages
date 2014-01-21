// Enhance the xml example program to add spaces to show indentation
Builder := Object clone
Builder forward := method(	
	tabs := 0
	if ((call sender type) == "Number") then(tabs := call sender + 1)
	for(i,1,tabs, write("\t"))
	writeln("<", call message name, ">")	
	call message arguments foreach(
		arg,
		content := self doMessage(arg, tabs);		
		if(content type == "Sequence", for(i,1,tabs, write("\t"));writeln(content)))
	for(i,1,tabs, write("\t"))
	writeln("</", call message name, ">"))
Builder ul(
	li("Io"),
	li("Lua"),
	li("Javascript"))
	
Builder div(div(div(li("Io"),li("Lua"))))
