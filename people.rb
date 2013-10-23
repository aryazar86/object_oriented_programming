class Person
  
  attr_accessor :name

  def what_my_name
    puts "Hi, my name is #{@name}."
  end

end

class Student < Person
  
  def learn
    puts "I get it!"
  end

end

class Instructor < Person
  
  def teach
    puts "Everything in Ruby is an Object."
  end

end

new_student = Student.new
new_student.name = "Christina"
new_instructor = Instructor.new
new_instructor.name = "Chris"

new_student.what_my_name
new_instructor.what_my_name

new_student.learn
new_instructor.teach

new_student.teach

=begin 
  This doesn't work because .teach is an instance method
  of Instructor. Since Student is not a parent of Instructor
  it can't access any of the methods inside the Instructor
  class. 
=end
