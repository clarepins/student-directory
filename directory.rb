@students = [] # an empty array accessible to all methods
require "csv" 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_to_hash(name, cohort = "september")
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  repeat_input_students(name)
end

def repeat_input_students(name)
  while !name.empty? do
    # add the student hash to the array
    input_to_hash(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end 

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  # open the file for writing
  puts "please specify filename"
  filename = gets.chomp
  CSV.open("./#{filename}", "wb") do |line|
    @students.each do |student|
      line << [student[:name], student[:cohort]]
    end 
  end 
  puts "#{@students.count} students have been saved to students.csv"
end

def load_students(filename = "students.csv") 
  CSV.foreach("./#{filename}") do |line|
    name, cohort = line
    input_to_hash(name, cohort)
  end   
  puts "#{@students.count} students are now loaded."
end 

def gets_filename
  @filename = ARGV.first # first argument from the command line
  if @filename.nil? # setting default value if no arguments are given
    @filename = "students.csv"
  end 
  load_if_file_exists
end

def load_if_file_exists
  if File.exists?(@filename) # if it exists
    load_students(@filename)
    puts "Loaded #{@students.count} lines from #{@filename}"
  else # if it doesn't exist
    puts "File name: #{@filename} doesn't exist."
    exit # quit the program
  end
end 

gets_filename
interactive_menu