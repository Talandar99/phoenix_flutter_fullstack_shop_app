defmodule PhxShopApi.IngredientsTest do
  use PhxShopApi.DataCase

  alias PhxShopApi.Ingredients

  describe "ingredients" do
    alias PhxShopApi.Ingredients.Ingredient

    import PhxShopApi.IngredientsFixtures

    @invalid_attrs %{ammount_left: nil, name: nil, price: nil}

    test "list_ingredients/0 returns all ingredients" do
      ingredient = ingredient_fixture()
      assert Ingredients.list_ingredients() == [ingredient]
    end

    test "get_ingredient!/1 returns the ingredient with given id" do
      ingredient = ingredient_fixture()
      assert Ingredients.get_ingredient!(ingredient.id) == ingredient
    end

    test "create_ingredient/1 with valid data creates a ingredient" do
      valid_attrs = %{ammount_left: 42, name: "some name", price: 120.5}

      assert {:ok, %Ingredient{} = ingredient} = Ingredients.create_ingredient(valid_attrs)
      assert ingredient.ammount_left == 42
      assert ingredient.name == "some name"
      assert ingredient.price == 120.5
    end

    test "create_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ingredients.create_ingredient(@invalid_attrs)
    end

    test "update_ingredient/2 with valid data updates the ingredient" do
      ingredient = ingredient_fixture()
      update_attrs = %{ammount_left: 43, name: "some updated name", price: 456.7}

      assert {:ok, %Ingredient{} = ingredient} = Ingredients.update_ingredient(ingredient, update_attrs)
      assert ingredient.ammount_left == 43
      assert ingredient.name == "some updated name"
      assert ingredient.price == 456.7
    end

    test "update_ingredient/2 with invalid data returns error changeset" do
      ingredient = ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = Ingredients.update_ingredient(ingredient, @invalid_attrs)
      assert ingredient == Ingredients.get_ingredient!(ingredient.id)
    end

    test "delete_ingredient/1 deletes the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{}} = Ingredients.delete_ingredient(ingredient)
      assert_raise Ecto.NoResultsError, fn -> Ingredients.get_ingredient!(ingredient.id) end
    end

    test "change_ingredient/1 returns a ingredient changeset" do
      ingredient = ingredient_fixture()
      assert %Ecto.Changeset{} = Ingredients.change_ingredient(ingredient)
    end
  end
end
