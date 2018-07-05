defmodule AwesomeChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt


  schema "users" do
    field :avatar_url, :string
    field :name, :string
    field :password_hash, :string
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
    |> cast(attrs, [:name, :avatar_url, :password_hash])
    |> validate_required([:name, :password_hash])
  end
end
