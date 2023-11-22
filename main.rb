# main.rb
require_relative 'command_line_app'

# Main program
if ARGV.empty?
  # If no command-line arguments are provided, prompt the user
  print 'Enter command (search/find_duplicates): '
  command = gets.chomp

  unless %w[search find_duplicates].include?(command)
    puts 'Invalid command. Supported commands: search, find_duplicates'
    exit(1)
  end
else
  # If command-line arguments are provided, use them
  command = ARGV[0]
  #   query = ARGV[1]
end

# Read client data from the JSON file
data = File.read('clients.json')

# Create an instance of the CommandLineApp
app = CommandLineApp.new(data)

case command
when 'search'
  print 'Enter query: '
  query = gets.chomp

  # Prompt the user for an exact match option
  print 'Do you want an exact match? Press 1 for yes, or press enter to ignore then we will use a case-insensitive substring match: '

  # Get the user's input and convert it to a boolean
  exact_option = gets.chomp == '1'

  # Perform the search with the specified exact match option
  app.search_by_full_name(query, exact_option)
when 'find_duplicates'
  # Find and display clients with duplicate emails
  app.find_duplicate_emails
else
  puts 'Invalid command. Supported commands: search, find_duplicates'
end
