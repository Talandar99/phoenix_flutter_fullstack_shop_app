defmodule PhxShopApiWeb.DefaultController do
  use PhxShopApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Error 66: Hello there")
  end
end
