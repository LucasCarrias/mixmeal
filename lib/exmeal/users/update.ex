defmodule Exmeal.Users.Update do
  alias Exmeal.{User, Repo, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error}
      user -> do_update(user, params)
    end
  end

  def do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  def handle_update({:ok, %User{}} = result), do: result

  def handle_update({:error, result}) do
    { :error, Error.build(:bad_request, result) }
  end
end
