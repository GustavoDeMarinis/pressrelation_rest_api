# PressrelationsTrainingDay
To  start postgres server:

 * sudo sudo service postgresql stop
 * run docker-compose up

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

To start Front-end Server
 * cd frontend
 * yarn dev

To make API calls with both front and back running locally:
 * run ps aux | grep chrome | awk '{ print $2 }' 
 * sudo kill all the process 
 * run chrome without cors security google-chrome --disable-web-security --user-data-dir=".config/google-chrome"

Now you can visit [`localhost:3000`](http://localhost:3000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
