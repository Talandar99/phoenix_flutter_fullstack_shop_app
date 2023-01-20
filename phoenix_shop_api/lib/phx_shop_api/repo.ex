defmodule PhxShopApi.Repo do
  use Ecto.Repo,
    otp_app: :phx_shop_api,
    adapter: Ecto.Adapters.Postgres
end
