defmodule DeliveryApp.Users.AgentTest do
  use ExUnit.Case

  alias DeliveryApp.Users.Agent, as: UserAgent
  alias DeliveryApp.Users.User

  import DeliveryApp.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "14523496947")
      |> UserAgent.save()

      response = UserAgent.get("14523496947")

      expected_response =
        {:ok,
         %User{
           address: "Rua do teste, 123",
           age: 24,
           cpf: "14523496947",
           email: "felipe.marcolin@teste.com",
           name: "Felipe Marcolin"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000000001")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
