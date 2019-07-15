defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    list
    |> Enum.reverse()
    |> Enum.reduce([], &element_filter(&1, &2, fn e -> fun.(e) end))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list
    |> keep(fn e -> !fun.(e) end)

  end

  defp element_filter(elem, acc, fun) do
      cond do
        fun.(elem) -> [elem|acc]
        true -> acc
      end
  end



end
