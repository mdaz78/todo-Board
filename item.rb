require 'date'

class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  # date here is a string of the format
  # YYYY-MM-DD
  def self.valid_date?(date)
    begin
      date_format = '%Y-%m-%d'
      Date.strptime(date, date_format)
      true
    rescue ArgumentError
      false
    end
  end

  def initialize(title, deadline, description)
    raise 'Deadline is not valid' unless Item.valid_date?(deadline)

    @title = title
    @deadline = deadline if Item.valid_date?(deadline)
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    raise 'Invalid Date' unless Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end