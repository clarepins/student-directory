@students = []

def input_students
  puts "please enter the names of students and their cohort"
  puts "press enter twice to end"
  
  while true do
    puts "name?"
    name = gets.chomp
    if !name.empty?
      puts "cohort?"
      $cohort = gets.chomp
    end 
    
    if name.empty?
      break
    end 
    
    @students << {name: name, cohort: $cohort}
    if @students.count == 1
      puts "now we have 1 student"
    else
      puts "now we have #{@students.count} students"
    end 
  end 
end 

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print_students_by_cohort
  
  cohorts = {}
  
  @students.each do |student|
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

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else 
    puts "Overall, we have #{@students.count} great students"
  end 
end

def print_menu
  puts "Menu (select option number)"
  puts "1. input student(s)"
  puts "2. list student(s)"
  puts "9. exit"
end

def list_students
  if @students.empty?
    puts "There are no students at Makers"
  else 
    print_header
    print_students_by_cohort
    print_footer
  end 
end 

def do_menu_choice(menu_choice)
  case menu_choice 
    when "1"
      input_students
    when "2"
      list_students
    when "9"
      # exit
    else 
      puts "Try again"
  end 
end 

def interactive_menu
  loop do 
    print_menu
    do_menu_choice(gets.chomp)
  end 
end 

interactive_menu




 