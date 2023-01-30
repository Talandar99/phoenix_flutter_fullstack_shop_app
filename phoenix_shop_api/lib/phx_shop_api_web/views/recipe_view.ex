defmodule PhxShopApiWeb.RecipeView do
  use PhxShopApiWeb, :view
  alias PhxShopApiWeb.RecipeView

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      ingredients_list: recipe.ingredients_list
    }
  end
end
