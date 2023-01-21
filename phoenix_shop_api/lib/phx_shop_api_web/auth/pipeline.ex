defmodule PhxShopApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :real_deal_api,
    module: PhxShopApiWeb.Auth.Guardian,
    error_handler: PhxShopApiWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
