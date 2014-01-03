# Modify the below class to implement an 'Each' function returning a CsvRow object. Use method_missing on that CsvRow to return the
# value for the column for a given heading.
class CsvRow
  attr_accessor :headers, :row
  
  def initialize(headers, row)
    @headers = headers
    @row = row
  end   
  
  def method_missing(m, *args, &block)    
    colIndex = @headers.find_index(m.to_s)    
    @row[colIndex] if colIndex != nil
  end   
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
        
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      csv_contents.each do |row|
        csvRow = CsvRow.new(headers, row)       
        yield csvRow
      end              
    end      
      
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end
  
class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end
  
csv = RubyCsv.new
csv.each {|row| puts row.one} #expect this to print the value of the 'one' column for each row.
  