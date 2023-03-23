require_relative 'person'

class Teacher < Person
  def initialize(age, name = 'Unknown', specialization:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end
end
