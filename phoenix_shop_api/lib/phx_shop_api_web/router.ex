defmodule PhxShopApiWeb.Router do
  use PhxShopApiWeb, :router
  use Plug.ErrorHandler

  def handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  def handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  def handle_errors(conn, %{reason: %Plug.Parsers.ParseError{}}) do
    conn |> json(%{errors: "Invalid JSON formatting"}) |> halt()
  end

  def handle_errors(conn, _reason) do
    conn |> json(%{errors: "An error occurred"}) |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug PhxShopApiWeb.Auth.Pipeline
    # plug PhxShopApiWeb.Auth.SetAccount
  end

  scope "/api", PhxShopApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create
    post "/accounts/sign_in", AccountController, :sign_in
  end

  scope "/api", PhxShopApiWeb do
    pipe_through [:api, :auth]
    get "/accounts/by_id/:id", AccountController, :show
    # ingredients
    get "/ingredients", IngredientController, :index
    get "/ingredients/by_id/:id", IngredientController, :show
    post "/ingredients/update/:id", IngredientController, :update
    delete "/ingredients/delete/:id", IngredientController, :delete
    post "/ingredients/create", IngredientController, :create
    # recipes
    get "/recipes", RecipeController, :index
    get "/recipes/by_id/:id", RecipeController, :show
    post "/recipes/update/:id", RecipeController, :update
    delete "/recipes/delete/:id", RecipeController, :delete
    post "/recipes/create", RecipeController, :create
  end
end
