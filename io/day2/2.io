// Change / to return 0 if the denominator is 0

"Before alteration" println
x := 5 / 0
x println
x := 5 / 1
x println

basicDiv := Number getSlot("/")
Number / := method(denominator,
	numerator := self
	if (denominator == 0, 0, numerator basicDiv(denominator))
)

"After alteration" println
x := 5 / 0
x println
x := 5 / 1 
x println