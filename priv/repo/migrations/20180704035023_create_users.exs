defmodule AwesomeChat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :avatar_url, :string, null: true

      timestamps()
    end

  end
end
