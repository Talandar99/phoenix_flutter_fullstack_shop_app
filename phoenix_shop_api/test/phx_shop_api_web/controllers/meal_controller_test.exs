defmodule PhxShopApiWeb.MealControllerTest do
  use PhxShopApiWeb.ConnCase

  import PhxShopApi.MealsFixtures

  alias PhxShopApi.Meals.Meal

  @create_attrs %{
    orderdate: "some orderdate",
    recipeid: "some recipeid",
    status: "some status",
    userid: "some userid"
  }
  @update_attrs %{
    orderdate: "some updated orderdate",
    recipeid: "some updated recipeid",
    status: "some updated status",
    userid: "some updated userid"
  }
  @invalid_attrs %{orderdate: nil, recipeid: nil, status: nil, userid: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all meals", %{conn: conn} do
      conn = get(conn, Routes.meal_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create meal" do
    test "renders meal when data is valid", %{conn: conn} do
      conn = post(conn, Routes.meal_path(conn, :create), meal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.meal_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "orderdate" => "some orderdate",
               "recipeid" => "some recipeid",
               "status" => "some status",
               "userid" => "some userid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.meal_path(conn, :create), meal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update meal" do
    setup [:create_meal]

    test "renders meal when data is valid", %{conn: conn, meal: %Meal{id: id} = meal} do
      conn = put(conn, Routes.meal_path(conn, :update, meal), meal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.meal_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "orderdate" => "some updated orderdate",
               "recipeid" => "some updated recipeid",
               "status" => "some updated status",
               "userid" => "some updated userid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, meal: meal} do
      conn = put(conn, Routes.meal_path(conn, :update, meal), meal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete meal" do
    setup [:create_meal]

    test "deletes chosen meal", %{conn: conn, meal: meal} do
      conn = delete(conn, Routes.meal_path(conn, :delete, meal))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.meal_path(conn, :show, meal))
      end
    end
  end

  defp create_meal(_) do
    meal = meal_fixture()
    %{meal: meal}
  end
end
