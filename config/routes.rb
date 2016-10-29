Rails.application.routes.draw do
  get '/:event_id/rsvp', to: 'rsvps#new', as: 'new_rsvp'
  post '/:event_id/rsvp', to: 'rsvps#create', as: 'create_rsvp'
  get '/:event_id/rsvp/thank-you', to: 'rsvps#thank_you', as: 'thank_rsvp'

  namespace :admin do
    resources :events
  end
end
