defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.reduce( %{pos: 0, roman: ""}, fn alg, acc->
                                            alg_to_roman = convert(alg,acc[:pos]) |>String.reverse()
                                            %{pos: acc[:pos] + 1, roman: acc[:roman] <> alg_to_roman} end)
    |> Map.get(:roman)
    |> String.reverse()



  end


  @fives %{ 0 => "V", 1 => "L", 2=>"D"}
  @decimal %{ 0 => "I", 1 => "X", 2=>"C", 3=>"M"}

  def convert(alg, pos) do
    cond do
      alg in 1..3 -> String.duplicate(@decimal[pos], alg)
      alg == 4    -> @decimal[pos] <> @fives[pos]
      alg == 5    -> @fives[pos]
      alg in 6..8 -> @fives[pos] <> String.duplicate(@decimal[pos], (alg-5) )
      alg == 9    -> @decimal[pos] <> @decimal[(pos + 1)]
      true -> ""
    end
  end


end
