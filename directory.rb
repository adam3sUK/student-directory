@students = []
#first we create an array of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end
#then print them
def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "9"
      exit # this will cause the program to exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu

