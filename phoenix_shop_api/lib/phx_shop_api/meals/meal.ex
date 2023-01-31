defmodule PhxShopApi.Meals.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "meals" do
    field :orderdate, :string
    field :recipeid, :string
    field :status, :string
    field :userid, :string

    timestamps()
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:userid, :recipeid, :orderdate, :status])
    |> validate_required([:userid, :recipeid, :orderdate, :status])
  end
end
