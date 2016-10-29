module EventsHelper
  def count_to_capacity(event)
    "#{event.rsvp_count} / #{event.capacity}"
  end
end
