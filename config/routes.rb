Rails.application.routes.draw do
  get '/', to: redirect('/admin/events')
  get '/admin', to: redirect('/admin/events')

  get  '/:event_id', to: 'rsvps#new', as: 'new_rsvp'
  post '/:event_id', to: 'rsvps#create', as: 'create_rsvp'
  get  '/:event_id/thank-you', to: 'rsvps#thank_you', as: 'thank_rsvp'

  namespace :admin do
    resources :events
    get  '/events/:id/rsvps', to: 'events#rsvps', as: 'events_rsvps'
  end

end
