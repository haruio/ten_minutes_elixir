defmodule KV.StoreSupervisorTest do
  use ExUnit.Case, async: true
  test "test supervisor" do
    {:ok, pid} = KV.StoreSupervisor.start_link

    KV.Store.set(KV.Store, "a", 1)

    assert KV.Store.get(KV.Store, "a") == {:ok, 1}
  end

  test "test restart process" do
    {:ok, pid} = KV.StoreSupervisor.start_link

    KV.Store.set(KV.Store, "a", 1)
    KV.Store.del(KV.Store, "a")

    :timer.sleep 100
    assert KV.Store.get(KV.Store, "a") == {:ok, 1}
  end
end
