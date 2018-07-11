defmodule AwesomeChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt


  schema "users" do
    field :avatar_url, :string
    field :name, :string
    field :password_hash, :string
    field :access_token, :string
    field :access_token_expired_at, :naive_datetime
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, %{"password" => password} = attrs) do
    user
    |> cast(attrs, [:name, :avatar_url])
    |> put_change(:password_hash, hashpwsalt(password))
    |> validate_required([:name, :password_hash])
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :avatar_url, :access_token, :access_token_expired_at])
    |> validate_required([:name, :password_hash])
  end
end
