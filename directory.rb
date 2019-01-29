def input_students
    puts "please enter the names of the students, cohort, hobby and country of birth"
    puts "press enter twice to end"
    students = []
    
    while true do
      ask_for_info
      
      if $name.empty?
        break
      end 
      
      students << {name: $name, cohort: $cohort, hobby: $hobby, birth_country: $birth_country}
      if students.count == 1
        puts "now we have 1 student"
      else
        puts "now we have #{students.count} students"
      end 
      
    end 
    students
end 

def ask_for_info
  puts "name?"
  $name = gets.gsub("\n", "")
  if !$name.empty?
    puts "cohort?"
    cohort = gets.gsub("\n", "")
    if cohort.empty?
      $cohort = :january
    else 
      $cohort = cohort.to_sym
    end 
    puts "hobby?"
    $hobby = gets.gsub("\n", "")
    puts "country of birth?"
    $birth_country = gets.gsub("\n", "")
  end 
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
  if names.count == 1
    puts "Overall, we have 1 great student"
  else 
    puts "Overall, we have #{names.count} great students"
  end 
end

students = input_students
puts students

if students.empty?
  puts "There are no students at Makers"
else 
  print_header
  print_by_cohort(students)
  print_footer(students)
end 



 
 