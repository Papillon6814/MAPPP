defmodule MapApp.Repo do
  use Ecto.Repo,
    otp_app: :map_app,
    adapter: Ecto.Adapters.Postgres
end
