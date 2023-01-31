defmodule PhxShopApi.MealsTest do
  use PhxShopApi.DataCase

  alias PhxShopApi.Meals

  describe "meals" do
    alias PhxShopApi.Meals.Meal

    import PhxShopApi.MealsFixtures

    @invalid_attrs %{orderdate: nil, recipeid: nil, status: nil, userid: nil}

    test "list_meals/0 returns all meals" do
      meal = meal_fixture()
      assert Meals.list_meals() == [meal]
    end

    test "get_meal!/1 returns the meal with given id" do
      meal = meal_fixture()
      assert Meals.get_meal!(meal.id) == meal
    end

    test "create_meal/1 with valid data creates a meal" do
      valid_attrs = %{orderdate: "some orderdate", recipeid: "some recipeid", status: "some status", userid: "some userid"}

      assert {:ok, %Meal{} = meal} = Meals.create_meal(valid_attrs)
      assert meal.orderdate == "some orderdate"
      assert meal.recipeid == "some recipeid"
      assert meal.status == "some status"
      assert meal.userid == "some userid"
    end

    test "create_meal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meals.create_meal(@invalid_attrs)
    end

    test "update_meal/2 with valid data updates the meal" do
      meal = meal_fixture()
      update_attrs = %{orderdate: "some updated orderdate", recipeid: "some updated recipeid", status: "some updated status", userid: "some updated userid"}

      assert {:ok, %Meal{} = meal} = Meals.update_meal(meal, update_attrs)
      assert meal.orderdate == "some updated orderdate"
      assert meal.recipeid == "some updated recipeid"
      assert meal.status == "some updated status"
      assert meal.userid == "some updated userid"
    end

    test "update_meal/2 with invalid data returns error changeset" do
      meal = meal_fixture()
      assert {:error, %Ecto.Changeset{}} = Meals.update_meal(meal, @invalid_attrs)
      assert meal == Meals.get_meal!(meal.id)
    end

    test "delete_meal/1 deletes the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{}} = Meals.delete_meal(meal)
      assert_raise Ecto.NoResultsError, fn -> Meals.get_meal!(meal.id) end
    end

    test "change_meal/1 returns a meal changeset" do
      meal = meal_fixture()
      assert %Ecto.Changeset{} = Meals.change_meal(meal)
    end
  end
end
