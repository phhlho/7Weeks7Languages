# Print the contents of an array of 16 #s, four numbers at a time, using just each. Then, do the same with each_slice in Enumerable.

# Init Array
rnd = Random.new(29) #seed random for consistent test results
a = []
(0..15).each {|val| a.push(rnd.rand(100))}

# Print the contet of array, four numbers at a time
printArray = []
puts 'First print method'
a.each do |val|
  printArray.push(val)
  if (printArray.length == 4)
    puts printArray.join(',')
    printArray = []
  end
end

# Do it again, with each_slice
puts 'Second print method'
a.each_slice(4) {|val| puts val.join(',')}