require 'json'
require 'test/unit'
require_relative '../command_line_app'

class CommandLineAppTest < Test::Unit::TestCase
  def setup
    clients_data = [
      { "id" => 1, "full_name" => "John Doe", "email" => "john.doe@example.com" },
      { "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@example.com" },
      { "id" => 3, "full_name" => "Alex Johnson", "email" => "alex.johnson@example.com" },
      { "id" => 4, "full_name" => "Alex Johnson", "email" => "jane.smith@example.com" }
    ].to_json
    @app = CommandLineApp.new(clients_data)
  end

  def test_search_by_full_name_case_insensitive
    result = capture_stdout { @app.search_by_full_name('john') }
    assert_match(/John Doe/, result)
  end

  def test_search_by_full_name_exact_match
    result = capture_stdout { @app.search_by_full_name('John Doe', true) }
    assert_match(/John Doe/, result)
  end

  def test_search_by_full_name_no_match
    result = capture_stdout { @app.search_by_full_name('Nonexistent Name') }
    assert_match(/No matching clients found/, result)
  end

  def test_find_duplicate_emails
    result = capture_stdout { @app.find_duplicate_emails }
    assert_match(/jane.smith@example.com/, result)
  end

  def test_find_duplicate_emails_no_duplicates
    app = CommandLineApp.new([{ "id" => 1, "full_name" => "John Doe", "email" => "john.doe@example.com" }].to_json)
    result = capture_stdout { app.find_duplicate_emails }
    puts result
    assert_match(/No matching clients found/, result)
  end

  private

  def capture_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end

# run command for test run test cases
# ruby -I. -r test/unit -e "ARGV.each { |f| require f }" test/command_line_app_test.rb
