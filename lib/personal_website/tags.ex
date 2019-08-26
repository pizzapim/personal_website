defmodule PersonalWebsite.Tags do
  @behaviour Ecto.Type
  def type, do: {:array, :string}

  def cast(str) when is_binary(str) do
    str
    |> String.replace(~r/\s/, "")
    |> String.split(",")
    |> cast
  end

  def cast(arr) when is_list(arr) do
    if Enum.all?(arr, &String.valid?/1), do: {:ok, arr}, else: :error
  end

  def cast(_), do: :error

  def dump(val) when is_list(val), do: {:ok, val}
  def dump(_), do: :error

  def load(val) when is_list(val), do: {:ok, val}
  def load(_), do: :error

  def display(tags) when is_list(tags), do: Enum.join(tags, ", ")
end
