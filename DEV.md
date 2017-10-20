# Developer Setup

### Dependencies

This project uses Ruby 2.3.1, Rails 5.0, [Watt](https://github.com/artsy/watt), etc.

Install PostgreSQL.

Run `bin/setup`.

### Use VSCode

It's highly recommended to develop using [VSCode](https://code.visualstudio.com/), and take advantage of some of the recommended extensions. These include GraphQL syntax highlighting, autocomplete, cmd + click to see the definition, etc. This is a big boost over simpler editor experiences, which you might ordinarily use in Ruby projects.

```sh
brew update
brew install watchman
npm install @playlyfe/gql
```

Fetch Constellation's GraphQL schema from staging.

```sh
rake graphql:dump_schema
```

Currently you need a fork of [kumarharsh/graphql-for-vscode](https://github.com/kumarharsh/graphql-for-vscode/pull/50) to get syntax highlighting and auto-completion for GraphQL queries in your Ruby code.

```
git clone git@github.com:mzikherman/graphql-for-vscode.git
cd graphql-for-vscode
git checkout add_ruby_heredoc
npm install
```

Open the checked out project in VSCode and run it via ⌘F5 (Debug/Start without Debugging). This will launch a new VSCode window.

Open RSVP code from the newly opened window.

### Run

Start the application

```ruby
foreman start
```

Navitate to [localhost:5000](http://localhost:5000) with a browser.
