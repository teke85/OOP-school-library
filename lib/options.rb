class Options
  def print_options
    puts 'please choose an option by entering a number:'
    options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts options
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end
end
