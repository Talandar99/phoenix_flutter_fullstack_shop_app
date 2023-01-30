defmodule PhxShopApi.IngredientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxShopApi.Ingredients` context.
  """

  @doc """
  Generate a ingredient.
  """
  def ingredient_fixture(attrs \\ %{}) do
    {:ok, ingredient} =
      attrs
      |> Enum.into(%{
        ammount_left: 42,
        name: "some name",
        price: 120.5
      })
      |> PhxShopApi.Ingredients.create_ingredient()

    ingredient
  end
end
