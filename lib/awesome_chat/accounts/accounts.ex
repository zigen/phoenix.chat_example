defmodule AwesomeChat.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias AwesomeChat.Repo
  alias AwesomeChat.Accounts.User
  alias Comeonin.Bcrypt

  @doc """

  """
  @spec authenticate_user(map()) :: {:ok, %User{}} | {:error, %Ecto.Changeset{}}
  def authenticate_user(%{"name" => name, "password" => password} = params) do
    changeset = %User{} |> User.changeset(params)
    case get_user_by_name(name) do
      %User{} = user -> if Bcrypt.checkpw(password, user.password_hash) do
                       {:ok, user}
                     else
                       {:error, changeset}
                     end
      _ ->
        Bcrypt.dummy_checkpw()
        {:error, changeset}
    end
  end


  def authenticate_user(_) do
    Bcrypt.dummy_checkpw()
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @spec get_user_by_name(binary()) :: %User{} | nil
  def get_user_by_name(name) when is_binary(name) do
    Repo.one(from u in User, where: u.name == ^name, limit: 1)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
