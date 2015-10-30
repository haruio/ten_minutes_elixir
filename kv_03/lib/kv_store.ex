defmodule KV.Store do
  use GenServer

  def start_link(stash) do
    GenServer.start_link(__MODULE__, stash, [{:name, __MODULE__}])
  end

  def set(server, key, value) do
    GenServer.cast(server, {:set, key, value})
  end

  def get(server, key) do
    GenServer.call(server, {:get, key})
  end

  def del(server, key) do
    GenServer.cast(server, {:del, key})
  end

  ## Callback API
  def init(stash) do
    {:ok, stash}
  end

  def handle_cast({:set, key, value}, stash) do
    KV.StoreStash.set(stash, key, value)
    {:noreply, stash} 
  end

  def handle_call({:get, key}, _from, stash) do
    {:reply, KV.StoreStash.get(stash, key), stash}
  end

  def handle_cast({:del, key}, state) do
    0 / 0
  end

  def terminate(_r, _s) do
    {:ok}
  end

end
