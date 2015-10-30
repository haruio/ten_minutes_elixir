defmodule KV.StoreTest do
  use ExUnit.Case

  test "set test" do
    {:ok, store} = KV.Store.start_link
    assert KV.Store.set(store, "a", 1) == :ok
  end
  
  test "set, get test" do
    {:ok, store} = KV.Store.start_link
    KV.Store.set(store, "a", 1) 
    assert KV.Store.get(store, "a") == {:ok, 1}
  end
  
  # test "del test" do
  #   {:ok, store} = KV.Store.start_link
  #   KV.Store.set(store, "a", 1) 
  #   KV.Store.del(store, "a")

  #   assert KV.Store.get(store, "a") == :ok 
  # end
end
