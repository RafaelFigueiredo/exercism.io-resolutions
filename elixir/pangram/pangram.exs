defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @alphabet ?a..?z
  @alphabet_lenght 26

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) when sentence == "" do
    false
  end

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> count_letters()
    |> Kernel.==(@alphabet_lenght)

  end

  defp count_letters(sentence) do
    sentence
    |> String.downcase()
    |> to_charlist()
    |> Enum.reduce([],  fn elem, acc ->
                              cond do
                                elem not in @alphabet -> acc
                                elem in acc -> acc
                                true -> [elem|acc]
                              end
                        end)
    |> length()
  end

end
