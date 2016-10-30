Rails.application.routes.draw do

  get '/:event_id', to: 'rsvps#new', as: 'new_rsvp'
  post '/:event_id', to: 'rsvps#create', as: 'create_rsvp'
  get '/:event_id/thank-you', to: 'rsvps#thank_you', as: 'thank_rsvp'

  get '/admin', to: redirect('/admin/events')
  namespace :admin do
    resources :events
  end
end
