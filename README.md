RSVP
===

App for collecting RSVPs for onsite and comms events

Meta
---
[![Build Status](https://semaphoreci.com/api/v1/artsy-it/rsvp-rails/branches/master/badge.svg)](https://semaphoreci.com/artsy-it/rsvp-rails)
* __State:__ development
* __Github:__ [https://github.com/artsy/rsvp_rails/](https://github.com/artsy/rsvp_rails/)
* __Point People:__ [@broskoski](https://github.com/broskoski)

Dependencies
---

Components: Ruby 2.3.1, Rails 5.0, [Watt](https://github.com/artsy/watt)

Services: PostgreSQL

Setup
---

* Obtain working installations of PostgreSQL

```sh
rake db:setup # will create, migrate and seed the db
```

* Start the application

```ruby
bundle exec rails s
```