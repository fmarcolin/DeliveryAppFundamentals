defmodule DeliveryApp.Users.UserTest do
  use ExUnit.Case

  alias DeliveryApp.Users.User

  import DeliveryApp.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Felipe Marcolin",
          "Rua do teste, 123",
          "felipe.marcolin@teste.com",
          "99999999999",
          24
        )

      expected_response = {:ok, build(:user)}

      assert expected_response == response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Felipe Marcolin",
          "Rua do teste, 123",
          "felipe.marcolin@teste.com",
          "99999999999",
          16
        )

      expected_response = {:error, "Invalid parameters"}

      assert expected_response == response
    end
  end
end
