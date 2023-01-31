defmodule PhxShopApi.SizesTest do
  use PhxShopApi.DataCase

  alias PhxShopApi.Sizes

  describe "sizes" do
    alias PhxShopApi.Sizes.Size

    import PhxShopApi.SizesFixtures

    @invalid_attrs %{multiplier: nil, size: nil}

    test "list_sizes/0 returns all sizes" do
      size = size_fixture()
      assert Sizes.list_sizes() == [size]
    end

    test "get_size!/1 returns the size with given id" do
      size = size_fixture()
      assert Sizes.get_size!(size.id) == size
    end

    test "create_size/1 with valid data creates a size" do
      valid_attrs = %{multiplier: 120.5, size: "some size"}

      assert {:ok, %Size{} = size} = Sizes.create_size(valid_attrs)
      assert size.multiplier == 120.5
      assert size.size == "some size"
    end

    test "create_size/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sizes.create_size(@invalid_attrs)
    end

    test "update_size/2 with valid data updates the size" do
      size = size_fixture()
      update_attrs = %{multiplier: 456.7, size: "some updated size"}

      assert {:ok, %Size{} = size} = Sizes.update_size(size, update_attrs)
      assert size.multiplier == 456.7
      assert size.size == "some updated size"
    end

    test "update_size/2 with invalid data returns error changeset" do
      size = size_fixture()
      assert {:error, %Ecto.Changeset{}} = Sizes.update_size(size, @invalid_attrs)
      assert size == Sizes.get_size!(size.id)
    end

    test "delete_size/1 deletes the size" do
      size = size_fixture()
      assert {:ok, %Size{}} = Sizes.delete_size(size)
      assert_raise Ecto.NoResultsError, fn -> Sizes.get_size!(size.id) end
    end

    test "change_size/1 returns a size changeset" do
      size = size_fixture()
      assert %Ecto.Changeset{} = Sizes.change_size(size)
    end
  end
end
