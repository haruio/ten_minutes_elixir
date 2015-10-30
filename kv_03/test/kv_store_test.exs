defmodule KV.StoreTest do
  use ExUnit.Case, async: true
  
  test "del test" do
    {:ok, pid} = KV.StoreSupervisor.start_link

    KV.Store.set(KV.Store, "a", 1) 
    KV.Store.get(KV.Store, "a")

    KV.Store.del(KV.Store, "b")
    :timer.sleep 100

    KV.Store.set(KV.Store, "b", 2) 
    assert KV.Store.get(KV.Store, "a") == :error
    assert KV.Store.get(KV.Store, "b") == {:ok, 2}

  end
end
