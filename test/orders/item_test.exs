defmodule DeliveryApp.Orders.ItemTest do
  use ExUnit.Case

  alias DeliveryApp.Orders.Item

  import DeliveryApp.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("pizza de milho", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("pizza de milho", :crash, "35.5", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("pizza de milho", :pizza, "asda", 1)

      expected_response = {:error, "Unity price in wrong format"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("pizza de milho", :pizza, "35.5", 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
