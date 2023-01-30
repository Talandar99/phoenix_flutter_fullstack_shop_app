defmodule PhxShopApi.Ingredients.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ingredients" do
    field :ammount_left, :integer
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :price, :ammount_left])
    |> validate_required([:name, :price, :ammount_left])
  end
end
