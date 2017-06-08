module EventsHelper
  def formatted_date(date)
    return 'N/A' if date.nil?
    date.strftime("%m/%d/%Y – %I:%M%p")
  end
end
