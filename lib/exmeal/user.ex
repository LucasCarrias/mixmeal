defmodule Exmeal.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w{name cpf email}a
  @allowed_fields @required_fields ++ [:id]

  @derive {Jason.Encoder, only: @allowed_fields}

  @primary_key {:id, :binary_id, autogenerate: true  }
  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @allowed_fields)
    |> validate_required(@required_fields)
  end
end
