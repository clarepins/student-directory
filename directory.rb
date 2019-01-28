def input_students
    puts "please enter the names of the students, hobby and country of birth"
    students = []
    puts "name?"
    name = gets.chomp
    puts "hobby?"
    hobby = gets.chomp
    puts "country of birth?"
    birth_country = gets.chomp
    
    while true do
        students << {name: name, cohort: :november, hobby: hobby, birth_country: birth_country}
        puts "how we have #{students.count} students"
        puts "next name? (or enter to finish)"
        name = gets.chomp
        
        if name.empty? 
          break
        end 
        
        puts "hobby?"
        hobby = gets.chomp
        puts "country of birth?"
        birth_country = gets.chomp
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


