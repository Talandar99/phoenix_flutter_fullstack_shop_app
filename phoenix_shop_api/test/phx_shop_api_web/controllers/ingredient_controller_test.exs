defmodule PhxShopApiWeb.IngredientControllerTest do
  use PhxShopApiWeb.ConnCase

  import PhxShopApi.IngredientsFixtures

  alias PhxShopApi.Ingredients.Ingredient

  @create_attrs %{
    ammount_left: 42,
    name: "some name",
    price: 120.5
  }
  @update_attrs %{
    ammount_left: 43,
    name: "some updated name",
    price: 456.7
  }
  @invalid_attrs %{ammount_left: nil, name: nil, price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ingredients", %{conn: conn} do
      conn = get(conn, Routes.ingredient_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ingredient" do
    test "renders ingredient when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ingredient_path(conn, :create), ingredient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.ingredient_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ammount_left" => 42,
               "name" => "some name",
               "price" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ingredient_path(conn, :create), ingredient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ingredient" do
    setup [:create_ingredient]

    test "renders ingredient when data is valid", %{conn: conn, ingredient: %Ingredient{id: id} = ingredient} do
      conn = put(conn, Routes.ingredient_path(conn, :update, ingredient), ingredient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.ingredient_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ammount_left" => 43,
               "name" => "some updated name",
               "price" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ingredient: ingredient} do
      conn = put(conn, Routes.ingredient_path(conn, :update, ingredient), ingredient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ingredient" do
    setup [:create_ingredient]

    test "deletes chosen ingredient", %{conn: conn, ingredient: ingredient} do
      conn = delete(conn, Routes.ingredient_path(conn, :delete, ingredient))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.ingredient_path(conn, :show, ingredient))
      end
    end
  end

  defp create_ingredient(_) do
    ingredient = ingredient_fixture()
    %{ingredient: ingredient}
  end
end
