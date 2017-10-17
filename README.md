RSVP
===

App for collecting RSVPs for onsite and comms events

Note: This app just holds event information. The RSVP back-end functionality has been deprecated, in favor of sending data to Looker, and [CRM](https://github.com/artsy/constellation).

Meta
---
[![Build Status](https://circleci.com/gh/artsy/rsvp.svg?style=svg)](https://circleci.com/gh/artsy/rsvp)
* __State:__ production
* __Github:__ [https://github.com/artsy/rsvp/](https://github.com/artsy/rsvp/)
* __Point People:__ [@mzikherman](https://github.com/mzikherman)
* __Branches:__ PRs to `master` are automatically built and deployed to staging. PRs from `master` to `release` are automatically deployed to production. [Start a deploy...](https://github.com/artsy/rsvp/compare/release...master?expand=1)

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

Using VSCode (highly recommended)
----
It's generally encouraged to develop with VSCode, and take advantage of some of the recommended extensions. These include GraphQL syntax highlighting, autocomplete, cmd + click to see the definition, etc. This is a big boost over simpler editor experiences, which you might ordinarily use in Ruby projects.

Here are those setup comnands:

```sh
brew update; brew install watchman
npm install @playlyfe/gql
rake graphql:dump_schema  # This writes Constellation's GraphQL schema (fetched from Staging) to disk, powering the VSCode extensions.
```

* Start the application

```ruby
bundle exec rails s
```
