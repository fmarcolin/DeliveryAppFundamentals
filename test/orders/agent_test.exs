defmodule DeliveryApp.Orders.AgentTest do
  use ExUnit.Case

  import DeliveryApp.Factory

  alias DeliveryApp.Orders.Agent, as: OrderAgent

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      response = OrderAgent.save(order)

      assert {:ok, _uuid} = response
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("213232-32312-312-3132")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
