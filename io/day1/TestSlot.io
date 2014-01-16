// Do: Execute the code in a slot given its name

// Set up test object
Tester := Object clone
Tester directCall := method("Ran the method direct." println)
Tester indirectCall := method("Ran the method indirect 1." println)
Tester indirectCall2 := method("Ran the method indirect 2." println)
indirectMethod := "indirectCall2"


// Test
Tester directCall
Tester getSlot("indirectCall") call
Tester getSlot(indirectMethod) call