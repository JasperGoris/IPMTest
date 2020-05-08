defmodule ADemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ADemo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ADemo.PubSub}
      # Start a worker by calling: ADemo.Worker.start_link(arg)
      # {ADemo.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ADemo.Supervisor)
  end
end
