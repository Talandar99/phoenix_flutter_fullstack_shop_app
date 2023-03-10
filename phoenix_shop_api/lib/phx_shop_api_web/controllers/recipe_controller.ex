defmodule PhxShopApiWeb.RecipeController do
  use PhxShopApiWeb, :controller

  alias PhxShopApi.Recipes
  alias PhxShopApi.Recipes.Recipe

  action_fallback PhxShopApiWeb.FallbackController

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    with {:ok, %Recipe{} = recipe} <- Recipes.create_recipe(recipe_params) do
      conn
      |> put_status(:created)
      |> render("show.json", recipe: recipe)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    render(conn, "recipe.json", recipe: recipe)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{} = recipe} <- Recipes.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{}} <- Recipes.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
