defmodule PhxShopApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxShopApi.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        full_name: "some full_name",
        is_admin: true,
        password: "some password",
        phone_number: "some phone_number"
      })
      |> PhxShopApi.Accounts.create_account()

    account
  end
end
