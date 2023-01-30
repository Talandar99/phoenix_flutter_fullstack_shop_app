defmodule PhxShopApi.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :ingredients_list, :string

      timestamps()
    end
  end
end
