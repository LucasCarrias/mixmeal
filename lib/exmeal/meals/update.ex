defmodule Exmeal.Meals.Update do
  alias Exmeal.{Meal, Repo, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error}
      meal -> do_update(meal, params)
    end
  end

  def do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  def handle_update({:ok, %Meal{}} = result), do: result

  def handle_update({:error, result}) do
    { :error, Error.build(:bad_request, result) }
  end
end
