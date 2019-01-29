def input_students
    puts "please enter the names of students and their cohort"
    puts "press enter twice to end"
    
    students = []
   
    while true do
        puts "name?"
        $name = gets.chomp
        if !$name.empty?
          puts "cohort?"
          $cohort = gets.chomp
        end 
      
      if $name.empty?
        break
      end 
      
      students << {name: $name, cohort: $cohort}
      if students.count == 1
        puts "now we have 1 student"
      else
        puts "now we have #{students.count} students"
      end 
      
    end 
    students
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

def interactive_menu
  students = []
  loop do 
  # 1 print the menu and ask the user what to do 
    puts "Menu (select option number)"
    puts "1. input student(s)"
    puts "2. list student(s)"
    puts "9. exit"
  # 2 read the input and save it to a var
    menu_choice = gets.chomp
  # 3 do what the user has asked
    case menu_choice 
      when "1"
        students = input_students
      when "2"
        if students.empty?
          puts "There are no students at Makers"
        else 
          print_header
          print_by_cohort(students)
          print_footer(students)
        end 
      when "9"
        # exit
      else 
        puts "Try again"
    end 
  end 
end 

interactive_menu




 