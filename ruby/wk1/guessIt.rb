winningNumber = rand(10)
gameOver = false

while !gameOver
  puts "Pick a number:"
  guess = gets
  guessInt = guess.to_i
  puts "Too high" if (guessInt > winningNumber)
  puts "Too low" if (guessInt < winningNumber)
  gameOver = true if (guessInt == winningNumber)
end
puts "You got it! The number was #{winningNumber}"