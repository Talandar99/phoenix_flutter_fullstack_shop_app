defmodule PhxShopApiWeb.RecipeControllerTest do
  use PhxShopApiWeb.ConnCase

  import PhxShopApi.RecipesFixtures

  alias PhxShopApi.Recipes.Recipe

  @create_attrs %{
    ingredients_list: "some ingredients_list",
    title: "some title"
  }
  @update_attrs %{
    ingredients_list: "some updated ingredients_list",
    title: "some updated title"
  }
  @invalid_attrs %{ingredients_list: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all recipes", %{conn: conn} do
      conn = get(conn, Routes.recipe_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create recipe" do
    test "renders recipe when data is valid", %{conn: conn} do
      conn = post(conn, Routes.recipe_path(conn, :create), recipe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.recipe_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ingredients_list" => "some ingredients_list",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.recipe_path(conn, :create), recipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update recipe" do
    setup [:create_recipe]

    test "renders recipe when data is valid", %{conn: conn, recipe: %Recipe{id: id} = recipe} do
      conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.recipe_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ingredients_list" => "some updated ingredients_list",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
      conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete recipe" do
    setup [:create_recipe]

    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, Routes.recipe_path(conn, :delete, recipe))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.recipe_path(conn, :show, recipe))
      end
    end
  end

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end
end
