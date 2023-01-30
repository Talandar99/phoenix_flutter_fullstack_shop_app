defmodule PhxShopApi.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipes" do
    field :ingredients_list, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :ingredients_list])
    |> validate_required([:title, :ingredients_list])
  end
end
