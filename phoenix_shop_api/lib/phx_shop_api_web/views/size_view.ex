defmodule PhxShopApiWeb.SizeView do
  use PhxShopApiWeb, :view
  alias PhxShopApiWeb.SizeView

  def render("index.json", %{sizes: sizes}) do
    %{data: render_many(sizes, SizeView, "size.json")}
  end

  def render("show.json", %{size: size}) do
    %{data: render_one(size, SizeView, "size.json")}
  end

  def render("size.json", %{size: size}) do
    %{
      id: size.id,
      size: size.size,
      multiplier: size.multiplier
    }
  end
end
