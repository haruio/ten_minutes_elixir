defmodule KV.StoreStash do
  def start_link do
    Agent.start_link(fn -> HashDict.new end, name: __MODULE__) 
  end

  def get(agent, key) do
    Agent.get(agent, fn(hash) -> HashDict.fetch(hash, key) end)
  end

  def set(agent, key, value) do
    Agent.update(agent, fn(hash) -> HashDict.put(hash, key, value) end)
  end
end
