class RsvpsController < ApplicationController
  before_action :set_event, only: [:new, :create, :thank_you]

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new name: params[:name], email: params[:email]
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    _, total_count = Constellation.create_rsvp!(rsvp_params.merge event_id: @event.id)
    respond_to do |format|
      format.html { redirect_to thank_rsvp_url(@event, total_count: total_count) }
    end
  rescue Constellation::GraphQLException, Constellation::HttpException => e
    logger.warn(e.message)
    respond_to do |format|
      # Add some locals that simple form expects (+ errors)
      @rsvp = Rsvp.new
      @error = e.message
      format.html { render :new }
    end
  end

  def thank_you
    @total_count = (params[:total_count] || 0).to_i
  end

  private
    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

    def rsvp_params
      params[:rsvp][:guests] = []
      params[:guest_names]&.each_with_index do |name, idx|
        guest_info = {}
        guest_info[:name] = name
        email = params[:guest_emails][idx]
        guest_info[:email] = email if email.present?
        params[:rsvp][:guests] << guest_info
      end
      params.require(:rsvp).permit(:name, :email, guests: [:name, :email])
    end
end
