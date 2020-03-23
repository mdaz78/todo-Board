require_relative 'item.rb'
require_relative 'list.rb'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    puts 'Enter a command:'
    cmd, label, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      @lists[label] = List.new(label)

    when 'ls'
      puts @lists.keys

    when 'showall'
      @lists.each_value(&:print)

    when 'mktodo'
      @lists[label].add_item(*args)

    when 'toggle'
      @lists[label].toggle_item(args.first.to_i)

    when 'rm'
      @lists[label].remove_item(*args.map(&:to_i))

    when 'purge'
      @lists[label].purge

    when 'up'
      @lists[label].up(*args.map(&:to_i))

    when 'down'
      @lists[label].down(*args.map(&:to_i))

    when 'swap'
      @lists[label].swap(*args.map(&:to_i))

    when 'sort'
      @lists[label].sort_by_date!

    when 'priority'
      @lists[label].print_priority

    when 'print'
      @lists[label].print(*args.map(&:to_i))

    when 'quit'
      return :quit
    else
      p 'Sorry, that command is not recognized.'
    end

  end

  def print_list_of_commands
    puts '== List of Commands =='
    puts '01. mklist <new_list_label>'
    puts '02. ls'
    puts '03. showall'
    puts '04. mktodo <list_label> <item_title> <item_deadline> <optional_item_description>'
    puts '05. toggle <list_label> <item_index>'
    puts '06. rm <list_label> <item_index>'
    puts '07. purge'
    puts '08. up <list_label> <index> <optional amount>'
    puts '09. down <list_label> <index> <optional amount>'
    puts '10. swap <list_label> <index_1> <index_2>'
    puts '11. sort <list_label>'
    puts '12. priority <list_label>'
    puts '13. print <list_label> <optional_index>'
    puts '14. quit'
  end

  def run
    print_list_of_commands
    loop do
      return if get_command == :quit
    end
  end
end