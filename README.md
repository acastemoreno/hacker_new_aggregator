# HackerNewsAggregator

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Origin of websocket connection
For exploratory testing purpose, websocket connection can be stablish by any origin.

If you want to enable validation for websocket origin, you need to change config/prod.exs `check_origin` option to `true`

## Build, release and deploy
Setting runtime environment variables:
  * Make a copy of `docker.env.example` to `docker.env` and modify as you need

Build the imagen with:
  * mac: `make -f Makefile build`
  * linux: `./Makefile build`

Run the image with:
  * mac: `make -f Makefile run`
  * linux: `./Makefile run`

## Endpoints
 - `http://localhost/api/topstories/`: Retrieve ids of collected Hacker News top stories. Information is renewed each 5 minutes
 - `http://localhost/api/topstories/:story_id`: Retrieve information of Hacker News story. Information is consulted at the moment
## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
