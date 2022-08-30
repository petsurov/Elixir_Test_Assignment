defmodule TestAssignment.Repo do
  use Ecto.Repo,
    otp_app: :test_assignment,
    adapter: Ecto.Adapters.Postgres
end
