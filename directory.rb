def input_students
    puts "please enter the names of the students"
    puts "to finish, press enter twice"
    students = []
    name = gets.chomp
    
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "how we have #{students.count} students"
        name = gets.chomp
    end 
    students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  entry = 0
  while entry < students.length do
    puts "#{students[entry][:name]} (#{students[entry][:cohort]} cohort)"
    entry += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)


