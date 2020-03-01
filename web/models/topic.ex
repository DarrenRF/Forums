defmodule Forum.Topic do
  use Forum.Web, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, Forum.User
    has_many :comments, Forum.Comment, on_delete: :delete_all
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
