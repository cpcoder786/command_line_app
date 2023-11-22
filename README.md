## Client Search and Duplicate Finder

This Ruby command-line application allows users to search through a json and find duplicates based on email addresses.

This Ruby script (`main.rb`) is a command-line application designed to interact with client data stored in a JSON file (`clients.json`). It provides two main functionalities: searching for clients based on a given query and finding clients with duplicate emails.


### Prerequisites

Make sure you have Ruby installed on your system. The script requires Ruby version 2.0.0 or higher.

If Ruby is not installed, you can download it from the official [Ruby website](https://www.ruby-lang.org/en/downloads/).

To check your Ruby version, run the following command in your terminal:

`ruby -v`


## Usage
- Clone the repository to your local machine:
  `git clone https://github.com/cpcoder786/command_line_app.git`
- Navigate to the project directory:
 ` cd command_line_app`

## Run the main program:
` ruby main.rb`

## Instruction to run by CLI:
Follow the prompts to interact with the application. You can either enter a command and query interactively or provide command-line arguments.

Supported commands:

**search:** Search clients by full name.
**find_duplicates:** Find clients with duplicate email addresses.
If using the interactive mode, the application will prompt you for the command and query.

For the search command, you can choose to perform an exact match by entering '1' when prompted.

**Example**

  `ruby main.rb`

Command-line arguments:

`ruby main.rb`

**For Search:**  


    Enter command (search/find_duplicates): search
    Enter query: Jane Smith
    Do you want an exact match? Press 1 for yes, or press enter to ignore then we will use a case-insensitive substring match: 1
    Matching clients:
    {"id"=>2, "full_name"=>"Jane Smith", "email"=>"jane.smith@yahoo.com"}


**For find duplicates:**
   

    Enter command (search/find_duplicates): find_duplicates
        Enter query: test@gmail.come
        Matching clients:
        {"id"=>2, "full_name"=>"Jane Smith", "email"=>"jane.smith@yahoo.com"}
        {"id"=>15, "full_name"=>"Another Jane Smith", "email"=>"jane.smith@yahoo.com"}

**To run the test suite, use the following command**:

   `ruby -I. -r test/unit -e "ARGV.each { |f| require f }" test/command_line_app_test.rb`


