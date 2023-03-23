require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def to_h
    {
      name: @name,
      age: @age
    }
  end
end
