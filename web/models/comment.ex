defmodule Forum.Comment do
  use Forum.Web, :model

  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Forum.User
    belongs_to :topic, Forum.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
