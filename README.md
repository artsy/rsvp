RSVP
===

App for collecting RSVPs for onsite and comms events

Note: This app just holds event information. The RSVP back-end functionality has been deprecated, in favor of sending data to Looker, and [CRM](https://github.com/artsy/constellation).

Meta
---
[![Build Status](https://circleci.com/gh/artsy/rsvp-rails.svg?style=svg)](https://circleci.com/gh/artsy/rsvp-rails)
* __State:__ production
* __Github:__ [https://github.com/artsy/rsvp/](https://github.com/artsy/rsvp/)
* __Point People:__ [@mzikherman](https://github.com/mzikherman)

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
