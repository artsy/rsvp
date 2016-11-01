module EventsHelper
  def count_to_capacity(event)
    "#{event.rsvp_count} / #{event.capacity}"
  end

  def formatted_date(date)
    return 'N/A' if date.nil?
    date.strftime("%m/%d/%Y – %I:%M%p")
  end
end
