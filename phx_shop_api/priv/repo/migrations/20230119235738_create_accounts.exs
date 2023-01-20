defmodule PhxShopApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :password, :string
      add :full_name, :string
      add :phone_number, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:accounts, [:email])
  end
end
