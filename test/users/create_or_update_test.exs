defmodule DeliveryApp.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias DeliveryApp.Users.Agent, as: UserAgent
  alias DeliveryApp.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Felipe",
        address: "Rua teste",
        email: "email@teste",
        cpf: "09382947592",
        age: 24
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or upated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Felipe",
        address: "Rua teste",
        email: "email@teste",
        cpf: "09382947592",
        age: 15
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
