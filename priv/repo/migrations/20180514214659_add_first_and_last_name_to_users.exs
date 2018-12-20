defmodule App.Repo.Migrations.AddFirstAndLastNameToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :last_name, :string
      add :first_name, :string
    end
  end
end
