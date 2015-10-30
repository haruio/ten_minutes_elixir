defmodule KV.StoreSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, [])
  end

  ## Callback API
  def init(:ok) do
    children = [
      worker(KV.Store, [KV.StoreStash]),
      worker(KV.StoreStash, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
