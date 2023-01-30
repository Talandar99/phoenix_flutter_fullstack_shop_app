defmodule PhxShopApi.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxShopApi.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        ingredients_list: "some ingredients_list",
        title: "some title"
      })
      |> PhxShopApi.Recipes.create_recipe()

    recipe
  end
end
