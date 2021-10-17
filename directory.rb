@students = []
#first we create an array of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name, 'november')
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def load_students
  # open the file for writing
  puts "Where do you wish to load the student list from?"
  filename = STDIN.gets.chomp
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student(name, cohort)
    end
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
#then print them
def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print_students_list
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
    puts "3. Save the list"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  puts "Where do you wish to save the student list?"
  filename = STDIN.gets.chomp
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


=begin
def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist. Will load students.csv instead"
    load_students
  end
end
=end

def menu_choice(selection)
  case selection
  when "1"
    puts "Option 1 selected"
    students = input_students
  when "2"
    puts "Option 2 selected, showing students"
    show_students
  when "3"
    puts "Option 3 selected, saving student list"
    save_students
  when "4"
    puts "option 4 selected, loading student list"
    load_students
  when "9"
    puts "Goodbye!"
    exit # this will cause the program to exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    menu_choice(STDIN.gets.chomp)
  end
end

interactive_menu

