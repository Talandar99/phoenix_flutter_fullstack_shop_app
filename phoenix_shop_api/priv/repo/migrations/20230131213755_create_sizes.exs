defmodule PhxShopApi.Repo.Migrations.CreateSizes do
  use Ecto.Migration

  def change do
    create table(:sizes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :size, :string
      add :multiplier, :float

      timestamps()
    end
  end
end
