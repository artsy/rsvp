require 'rails_helper'

describe 'rsvps/thank_you.html.erb' do
  it 'displays the over capacity message when there are more RSVPs than capacity' do
    assign(:total_count, 4)
    assign(:event, Event.new(capacity: 3))

    render
    expect(rendered).to include 'This event is currently at capacity'
  end

  it 'displays the thank you message otherwise' do
    assign(:total_count, 3)
    assign(:event, Event.new(capacity: 3))

    render
    expect(rendered).to include 'Thank you for your RSVP'
  end
end
