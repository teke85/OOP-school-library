require './person'

describe Person do
  let(:person) { Person.new(20, 'John') }

  describe '#new' do
    it 'takes three parameters and returns a Person object' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#id' do
    it 'returns a random id between 1 and 1000' do
      person = Person.new('John', 20)
      expect(person.id).to be_between(1, 1000)
    end
  end


  describe '#name' do
    it 'returns the correct name' do
      expect(person.name).to eq('John')
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(person.age).to eq(20)
    end
  end

  describe '#parent_permission' do
    it 'returns the correct parent_permission' do
      expect(person.parent_permission).to eq(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns the correct parent_permission' do
      expect(person.can_use_services?).to eq(true)
    end
  end
end
