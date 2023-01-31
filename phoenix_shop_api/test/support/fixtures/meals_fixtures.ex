defmodule PhxShopApi.MealsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxShopApi.Meals` context.
  """

  @doc """
  Generate a meal.
  """
  def meal_fixture(attrs \\ %{}) do
    {:ok, meal} =
      attrs
      |> Enum.into(%{
        orderdate: "some orderdate",
        recipeid: "some recipeid",
        status: "some status",
        userid: "some userid"
      })
      |> PhxShopApi.Meals.create_meal()

    meal
  end
end
