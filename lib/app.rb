require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './data/preserve_data'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books = read_data('./data/books.json')
    if @books.empty?
      puts 'There are no books yet'
      return
    end

    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def display_people
    @people = read_data('./data/people.json')
    @people.each do |p|
      puts " Age: #{p['age']}, Name: #{p['name']}, ID: #{p['id']}"
    end
  end

  def list_people
    @people = read_data('./data/people.json')
    if @people.empty?
      puts 'There are no people'
    else
      display_people
    end
  end

  def create_student
    get_input = Options.new
    age = get_input.get_input('Age: ', :to_i)
    name = get_input.get_input('Name: ')
    permission = get_input.get_input('Has parent permission? [Y/N]:  ', :downcase)
    student = Student.new(age, name, parent_permission: permission)
    @people.push(student)
    save_data(@people, './data/people.json')
    puts 'Student Created Successfully'
  end

  def create_teacher
    get_input = Options.new
    age = get_input.get_input('Age: ', :to_i)
    name = get_input.get_input('Name: ')
    specialization = get_input.get_input('Specialization: ')

    @people << Teacher.new(age, name, specialization: specialization)
    save_data(@people, './data/people.json')
    puts 'Teacher Created Successfully'
  end

  def create_person
    input_result = select_person_type

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def select_person_type
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp.to_i
  end

  def create_book
    get_input = Options.new
    title = get_input.get_input('Title:')
    author = get_input.get_input('Author:')

    book = Book.new(title, author)
    @books << book
    save_data(@books, './data/books.json')
    puts 'Book created successfully'
  end

  def create_rental
    get_input = Options.new
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = get_input.get_input('Book Index: ', :to_i)

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = get_input.get_input('List Number: ', :to_i)

      date = get_input.get_input('Date: ')

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      save_data(@rentals, './data/rentals.json')
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    @rentals = read_data('./data/rentals.json')
    get_input = Options.new
    id = get_input.get_input('ID of person: ', :to_i)

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
    end
  end
end
