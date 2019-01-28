def input_students
    puts "please enter the names of the students, cohort, hobby and country of birth"
    puts "press enter five times to end"
    students = []
    
    ask_for_info
    
    while true do
      students << {name: $name, cohort: $cohort, hobby: $hobby, birth_country: $birth_country}
      puts "how we have #{students.count} students"
      
      ask_for_info

      if $name.empty?
        break
      end 
      
    end 
    students
end 

def ask_for_info
  puts "name?"
  $name = gets.chomp
  puts "cohort?"
  cohort = gets.chomp
  if cohort.empty?
    $cohort = :january
  else 
    $cohort = cohort.to_sym
  end 
  puts "hobby?"
  $hobby = gets.chomp
  puts "country of birth?"
  $birth_country = gets.chomp
end 

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print_by_cohort(students)
  
  cohorts = {}
  
  students.each do |student|
    cohort = student[:cohort]
    if cohorts[cohort] == nil
      cohorts[cohort] = []
    end 
    
    cohorts[cohort] << student[:name]
  end 
  
  cohorts.each do |cohort, names|
    puts "in the #{cohort.to_s} cohort, we have ..."
    puts names
  end 
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)