defmodule ApiNews.Repo do
  use Ecto.Repo,
    otp_app: :api_news,
    adapter: Ecto.Adapters.Postgres
end
