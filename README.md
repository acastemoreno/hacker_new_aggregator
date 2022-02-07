# HackerNewsAggregator

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Origin for websocket
For exploratory testing purpose, websocket is accepted from any origin. If you want to change to validate origin you need to change config/prod.exs `check_origin` option to `true`

## Build, release and deploy
Build the imagen with:
-mac: `make -f Makefile build`
-linux: `./Makefile build`
## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
