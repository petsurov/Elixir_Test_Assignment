# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :test_assignment,
  ecto_repos: [TestAssignment.Repo]

# Configures the endpoint
config :test_assignment, TestAssignmentWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: TestAssignmentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestAssignment.PubSub,
  live_view: [signing_salt: "O5euuJfq"]

config :test_assignment, :pow,
  user: TestAssignment.Users.User,
  repo: TestAssignment.Repo,
  web_module: TestAssignmentWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: TestAssignmentWeb.PowMailer

# Configures the mailer
config :test_assignment, TestAssignmentWeb.PowMailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "SG.x.x"
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
