defmodule PhxShopApiWeb.SizeControllerTest do
  use PhxShopApiWeb.ConnCase

  import PhxShopApi.SizesFixtures

  alias PhxShopApi.Sizes.Size

  @create_attrs %{
    multiplier: 120.5,
    size: "some size"
  }
  @update_attrs %{
    multiplier: 456.7,
    size: "some updated size"
  }
  @invalid_attrs %{multiplier: nil, size: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sizes", %{conn: conn} do
      conn = get(conn, Routes.size_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create size" do
    test "renders size when data is valid", %{conn: conn} do
      conn = post(conn, Routes.size_path(conn, :create), size: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.size_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "multiplier" => 120.5,
               "size" => "some size"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.size_path(conn, :create), size: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update size" do
    setup [:create_size]

    test "renders size when data is valid", %{conn: conn, size: %Size{id: id} = size} do
      conn = put(conn, Routes.size_path(conn, :update, size), size: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.size_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "multiplier" => 456.7,
               "size" => "some updated size"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, size: size} do
      conn = put(conn, Routes.size_path(conn, :update, size), size: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete size" do
    setup [:create_size]

    test "deletes chosen size", %{conn: conn, size: size} do
      conn = delete(conn, Routes.size_path(conn, :delete, size))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.size_path(conn, :show, size))
      end
    end
  end

  defp create_size(_) do
    size = size_fixture()
    %{size: size}
  end
end
