defmodule PhxShopApi.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :userid, :string
      add :recipeid, :string
      add :orderdate, :string
      add :status, :string

      timestamps()
    end
  end
end
