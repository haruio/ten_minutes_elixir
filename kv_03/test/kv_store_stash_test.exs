defmodule KV.StoreStashTest do
  use ExUnit.Case, async: true

  test "stash test" do
    KV.StoreStash.start_link
    KV.StoreStash.set(KV.StoreStash, "a", 1)
    assert KV.StoreStash.get(KV.StoreStash, "a") == {:ok, 1}
  end
end
