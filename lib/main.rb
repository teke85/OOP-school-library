require './app'
require './options'

def main
  # create a new instance of 'App'
  app = App.new
  # loop through the select method
  loop do
    select(app)
  end
end

# define select method
def select(app)
  # create a new instance of 'Options'
  option = Options.new
  option.print_options
  input = gets.chomp
  case input
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  when '7'
    exit_ui
  else
    puts 'That is not a valid option'
  end
end

def exit_ui
  puts 'Thank you for using this app!'
  exit
end

main
