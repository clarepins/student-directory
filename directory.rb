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
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)


