defmodule AwesomeChat.Repo.Migrations.AddAccessTokenToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :access_token, :string
      add :access_token_expired_at, :naive_datetime
    end
  end
end
