defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @allowed_fields ~w{description date calories}a
  @required_fields ~w{description date calories}a

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  @primary_key {:id, :binary_id, autogenerate: true  }
  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @allowed_fields)
    |> validate_required(@required_fields)
  end
end
