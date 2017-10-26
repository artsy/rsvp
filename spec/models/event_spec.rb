require 'rails_helper'

describe 'Event' do

  context 'description length' do
    it 'allows a blank description' do
      event = Event.new
      expect(event).to be_valid
    end

    it 'allows a description' do
      event = Event.new
      event.description = 'A decent description'
      expect(event).to be_valid
    end

    it 'does not allow a description more than 2000 chars' do
      event = Event.new
      event.description = '*' * 2001
      expect(event).to_not be_valid
    end
  end
end
