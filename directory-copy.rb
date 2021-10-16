#first we create an array of students
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    # get the first name
    name = gets.chomp
    while !name.empty? do
      puts "And what cohort are they a part of?"
      cohort = gets.chomp.downcase.to_sym
      if cohort.length > 0
        students << {name: name, cohort: cohort}
      else
        students << {name: name, cohort: :november}
      end
      puts "Now we have #{students.count} students"
      puts "Please enter another name, or hit return"
      # get another name from the user
      name = gets.chomp
    end
    students
  end
  students = input_students
  #then print them
  def print_header
    puts "The students of Villains Academy"
    puts "-----------"
  end
  
  def print(students)
    n = 1
    i = 0
    until i == students.length
      result = "#{n}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
      puts result.center(result.length + 6, '***')
      n += 1
      i += 1
    end
  end
  
  def print_footer(students)
    puts "Overall, we have #{students.count} great students"
  end
  
  print_header
  print(students)
  print_footer(students)
  