defmodule AwesomeChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :avatar_url, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password_hash, :avatar_url])
    |> validate_required([:name, :password_hash, :avatar_url])
  end
end
