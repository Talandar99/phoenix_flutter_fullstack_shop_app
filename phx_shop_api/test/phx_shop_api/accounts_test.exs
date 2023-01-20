defmodule PhxShopApi.AccountsTest do
  use PhxShopApi.DataCase

  alias PhxShopApi.Accounts

  describe "accounts" do
    alias PhxShopApi.Accounts.Account

    import PhxShopApi.AccountsFixtures

    @invalid_attrs %{email: nil, full_name: nil, is_admin: nil, password: nil, phone_number: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{email: "some email", full_name: "some full_name", is_admin: true, password: "some password", phone_number: "some phone_number"}

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.email == "some email"
      assert account.full_name == "some full_name"
      assert account.is_admin == true
      assert account.password == "some password"
      assert account.phone_number == "some phone_number"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{email: "some updated email", full_name: "some updated full_name", is_admin: false, password: "some updated password", phone_number: "some updated phone_number"}

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.email == "some updated email"
      assert account.full_name == "some updated full_name"
      assert account.is_admin == false
      assert account.password == "some updated password"
      assert account.phone_number == "some updated phone_number"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
