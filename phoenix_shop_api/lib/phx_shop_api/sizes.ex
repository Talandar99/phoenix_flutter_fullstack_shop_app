defmodule PhxShopApi.Sizes do
  @moduledoc """
  The Sizes context.
  """

  import Ecto.Query, warn: false
  alias PhxShopApi.Repo

  alias PhxShopApi.Sizes.Size

  @doc """
  Returns the list of sizes.

  ## Examples

      iex> list_sizes()
      [%Size{}, ...]

  """
  def list_sizes do
    Repo.all(Size)
  end

  @doc """
  Gets a single size.

  Raises `Ecto.NoResultsError` if the Size does not exist.

  ## Examples

      iex> get_size!(123)
      %Size{}

      iex> get_size!(456)
      ** (Ecto.NoResultsError)

  """
  def get_size!(id), do: Repo.get!(Size, id)

  @doc """
  Creates a size.

  ## Examples

      iex> create_size(%{field: value})
      {:ok, %Size{}}

      iex> create_size(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_size(attrs \\ %{}) do
    %Size{}
    |> Size.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a size.

  ## Examples

      iex> update_size(size, %{field: new_value})
      {:ok, %Size{}}

      iex> update_size(size, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_size(%Size{} = size, attrs) do
    size
    |> Size.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a size.

  ## Examples

      iex> delete_size(size)
      {:ok, %Size{}}

      iex> delete_size(size)
      {:error, %Ecto.Changeset{}}

  """
  def delete_size(%Size{} = size) do
    Repo.delete(size)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking size changes.

  ## Examples

      iex> change_size(size)
      %Ecto.Changeset{data: %Size{}}

  """
  def change_size(%Size{} = size, attrs \\ %{}) do
    Size.changeset(size, attrs)
  end
end
