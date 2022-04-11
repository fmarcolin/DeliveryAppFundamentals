defmodule DeliveryApp.Orders.ReportTest do
  use ExUnit.Case

  import DeliveryApp.Factory

  alias DeliveryApp.Orders.Agent, as: OrderAgent
  alias DeliveryApp.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "99999999999,pizza,1,35.5japonesa,2,20.50,76.50\n" <>
          "99999999999,pizza,1,35.5japonesa,2,20.50,76.50\n"

      assert expected_response == response
    end
  end
end
