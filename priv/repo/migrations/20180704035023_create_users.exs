defmodule AwesomeChat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password_hash, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
