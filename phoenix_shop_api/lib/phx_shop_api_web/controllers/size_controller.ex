defmodule PhxShopApiWeb.SizeController do
  use PhxShopApiWeb, :controller

  alias PhxShopApi.Sizes
  alias PhxShopApi.Sizes.Size

  action_fallback PhxShopApiWeb.FallbackController

  def index(conn, _params) do
    sizes = Sizes.list_sizes()
    render(conn, "index.json", sizes: sizes)
  end

  def create(conn, %{"size" => size_params}) do
    with {:ok, %Size{} = size} <- Sizes.create_size(size_params) do
      conn
      |> put_status(:created)
      |> render("show.json", size: size)
    end
  end

  def show(conn, %{"id" => id}) do
    size = Sizes.get_size!(id)
    render(conn, "show.json", size: size)
  end

  def update(conn, %{"id" => id, "size" => size_params}) do
    size = Sizes.get_size!(id)

    with {:ok, %Size{} = size} <- Sizes.update_size(size, size_params) do
      render(conn, "show.json", size: size)
    end
  end

  def delete(conn, %{"id" => id}) do
    size = Sizes.get_size!(id)

    with {:ok, %Size{}} <- Sizes.delete_size(size) do
      send_resp(conn, :no_content, "")
    end
  end
end
