defmodule PhxShopApiWeb.MealView do
  use PhxShopApiWeb, :view
  alias PhxShopApiWeb.MealView

  def render("index.json", %{meals: meals}) do
    %{data: render_many(meals, MealView, "meal.json")}
  end

  def render("show.json", %{meal: meal}) do
    %{data: render_one(meal, MealView, "meal.json")}
  end

  def render("meal.json", %{meal: meal}) do
    %{
      id: meal.id,
      userid: meal.userid,
      recipeid: meal.recipeid,
      orderdate: meal.orderdate,
      status: meal.status
    }
  end
end
