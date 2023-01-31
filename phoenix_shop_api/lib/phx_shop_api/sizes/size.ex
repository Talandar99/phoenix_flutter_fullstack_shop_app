defmodule PhxShopApi.Sizes.Size do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "sizes" do
    field :multiplier, :float
    field :size, :string

    timestamps()
  end

  @doc false
  def changeset(size, attrs) do
    size
    |> cast(attrs, [:size, :multiplier])
    |> validate_required([:size, :multiplier])
  end
end
