# command_line_app.rb
require 'json'

class CommandLineApp
  # Initialize the CommandLineApp with client data in JSON format.
  def initialize(data)
    @clients = JSON.parse(data)
  end

  # Search clients by full name, supporting exact or substring matching.
  def search_by_full_name(query, exact = false)
    results = search_by('full_name', query, exact)
    display_results(results)
  end

  # Search clients by a specific field, supporting exact or substring matching.
  def search_by(field, query, exact)
    condition =
      if exact
        # Exact match condition using equality.
        proc { |client| client[field] == query }
      else
        # Substring match condition using case-insensitive regex.
        proc { |client| client[field].match?(Regexp.new(Regexp.escape(query), Regexp::IGNORECASE)) }
      end

    # Use the condition to filter and select clients.
    @clients.select(&condition)
  end

  # Find clients with duplicate values in a specified field.
  def find_duplicate(field)
    @clients.group_by { |hash| hash[field] }
            .select { |_, group| group.size > 1 }
  end

  # Find and display clients with duplicate email addresses.
  def find_duplicate_emails
    duplicates = find_duplicate('email')
    display_results(duplicates)
  end

  private

  # Display search results to the console.
  def display_results(results)
    if results.empty?
      puts 'No matching clients found.'
    else
      puts 'Matching clients:'
      results.each { |client| puts client }
    end
  end
end
