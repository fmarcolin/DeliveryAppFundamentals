defmodule DeliveryApp.Factory do
  use ExMachina

  alias DeliveryApp.Users.User
  alias DeliveryApp.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua do teste, 123",
      age: 24,
      cpf: "99999999999",
      email: "felipe.marcolin@teste.com",
      name: "Felipe Marcolin"
    }
  end

  def item_factory do
    %Item{
      description: "pizza de milho",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua do teste, 123",
      items: [
        build(:item),
        build(:item,
          description: "temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "99999999999"
    }
  end
end
