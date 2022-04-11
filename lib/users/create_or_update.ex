defmodule DeliveryApp.Users.CreateOrUpdate do
  alias DeliveryApp.Users.Agent, as: UserAgent
  alias DeliveryApp.Users.User

  def call(%{name: name, address: address, email: email, cpf: cpf, age: age}) do
    name
    |> User.build(address, email, cpf, age)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, "User created or upated successfully"}
  end

  defp save_user({:error, _reason} = error), do: error
end
