defmodule KV.Store do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
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
  def init(:ok) do
   {:ok, HashDict.new} 
  end

  def handle_cast({:set, key, value}, state) do
    {:noreply, HashDict.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, HashDict.fetch(state, key), state}
  end
  
  def handle_cast({:del, key}, state) do
    raise "Error"
  end
end
