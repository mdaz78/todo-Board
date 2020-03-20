require_relative 'item.rb'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = Array.new([])
  end

  def add_item(title, deadline, description = '')
    return false unless Item.valid_date?(deadline)

    item = Item.new(title, deadline, description)
    @items << item
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index.negative? || index >= size

    true
  end

  def swap(index_1, index_2)
    return false unless valid_index?(index_1) && valid_index?(index_2)

    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end

  def [](index)
    return nil unless valid_index?(index)

    @items[index]
  end

  def priority
    @items.first
  end

  def print
    puts @label
    @items.each_with_index do |item, index|
      puts "#{index} - #{item.title} - #{item.deadline}"
    end
  end

  def print_full_item(index)
    item = @items[index]
    puts '----------------------'

    puts "#{item.title} - #{item.deadline}"
    puts "#{item.description}" unless item.description.empty?

    puts '----------------------'
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(index, amount = 1)
    return false unless valid_index?(index)

    while index.positive? && amount.positive?
      current_index = index
      index -= 1
      swap(current_index, index)
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false unless valid_index?(index)

    while index < @items.length - 1 && amount.positive?
      current_index = index
      index += 1
      swap(current_index, index)
      amount -= 1
    end

    true
  end
end