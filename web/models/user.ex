defmodule Forum.User do
  use Forum.Web, :model

  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    has_many :topics, Forum.Topic
    has_many :comments, Forum.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
