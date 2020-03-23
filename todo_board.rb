require_relative 'item.rb'
require_relative 'list.rb'

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    puts 'Enter a command:'
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      @list.up(*args.map(&:to_i))
    when 'down'
      @list.down(*args.map(&:to_i))
    when 'swap'
      @list.swap(*args.map(&:to_i))
    when 'sort'
      @list.sort_by_date!
    when 'priority'
      @list.print_priority
    when 'print'
      @list.print(*args.map(&:to_i))
    when 'toggle'
      @list.toggle_item(*args.map(&:to_i))
    when 'rm'
      @list.remove_item(*args.map(&:to_i))
    when 'quit'
      return :quit
    else
      p 'Sorry, that command is not recognized.'
    end

  end

  def print_list_of_commands
    puts '== List of Commands =='
    puts '1. mktodo <title> <deadline> <optional description>'
    puts '2. up <index> <optional amount>'
    puts '3. down <index> <optional amount>'
    puts '4. swap <index_1> <index_2>'
    puts '5. sort'
    puts '6. priority'
    puts '7. print <optional_index>'
    puts '8. toggle <index>'
    puts '9. rm <index>'
    puts '10. quit'
  end

  def run
    print_list_of_commands
    loop do
      return if get_command == :quit
    end
  end
end