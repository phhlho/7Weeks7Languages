# Write a simple grep that will print the lines of a file having occurrences of a phrase on that line.

if (ARGV.length != 2)
  puts 'Expect 2 args: {filename} {regex}'
  exit
end

filename = ARGV[0]
regex = ARGV[1]
lineNo = 1
puts "Matches"
File.readlines(filename).each do |line|
  if (line.match(regex) != nil)
    puts "#{lineNo} - #{line}"
  end
  lineNo += 1
end