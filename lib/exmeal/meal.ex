defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exmeal.User

  @required_fields ~w{description date calories user_id}a

  @derive {Jason.Encoder, only: @required_fields ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true  }
  @foreign_key_type :binary_id
  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    belongs_to :user, User

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
