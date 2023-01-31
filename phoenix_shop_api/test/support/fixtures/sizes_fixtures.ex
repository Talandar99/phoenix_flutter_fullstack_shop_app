defmodule PhxShopApi.SizesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxShopApi.Sizes` context.
  """

  @doc """
  Generate a size.
  """
  def size_fixture(attrs \\ %{}) do
    {:ok, size} =
      attrs
      |> Enum.into(%{
        multiplier: 120.5,
        size: "some size"
      })
      |> PhxShopApi.Sizes.create_size()

    size
  end
end
