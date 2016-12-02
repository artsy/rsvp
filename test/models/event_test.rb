require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "maximum description length" do
    event = Event.new
    event.valid?
    assert event.errors[:description].empty?

    event.description = 'A decent description'
    event.valid?
    assert event.errors[:description].empty?

    event.description = '*' * 2001
    event.valid?
    assert !event.errors[:description].empty?
  end
end
