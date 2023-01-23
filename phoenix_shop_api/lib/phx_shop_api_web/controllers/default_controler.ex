defmodule PhxShopApiWeb.DefaultController do
  use PhxShopApiWeb, :controller

  def index(conn, _params) do
    text(
      conn,
      "{\"bro\":\"pick route\"}"
    )
  end
end
