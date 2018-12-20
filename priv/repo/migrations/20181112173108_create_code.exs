defmodule App.Repo.Migrations.CreateCode do
  use Ecto.Migration

  def change do
    create table(:codes) do
      add :type, :string
      add :serial, :string
      add :best_by, :date

      timestamps()
    end
  end
end
