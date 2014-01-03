#Test writing to a file via code block vs. not
File.open('writeCodeBlock', 'w') do |f|
  f.puts('test write')
  f.write('write code block')
  end

f2 = File.open('writeNoBlock', 'w')
f2.puts('test write')
f2.write('write no block')
f2.close