defmodule DeliveryApp do
  alias DeliveryApp.Orders.Agent, as: OrderAgent
  alias DeliveryApp.Orders.CreateOrUpdate, as: CreateOrUpdateOrder
  alias DeliveryApp.Users.Agent, as: UserAgent
  alias DeliveryApp.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
end
