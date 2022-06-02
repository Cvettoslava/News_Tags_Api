defmodule ApiNews.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ApiNews.Repo,
      # Start the Telemetry supervisor
      ApiNewsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ApiNews.PubSub},
      # Start the Endpoint (http/https)
      ApiNewsWeb.Endpoint
      # Start a worker by calling: ApiNews.Worker.start_link(arg)
      # {ApiNews.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiNews.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiNewsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
