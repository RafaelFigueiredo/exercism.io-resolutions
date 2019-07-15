defmodule RotationalCipher do

    @uppercase  ?A..?Z
    @downcase  ?a..?z
    @alphabet_interval  ?Z - ?A
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    # Verify if you turn more than on full cicle, 26. This is to avoid jump from downcase to uppercase characters using a to big number (26x)
    shift = cond do
        shift > @alphabet_interval -> rem(shift, @alphabet_interval) -1
        true -> shift
    end

    # Lambda function the shift the character
    fun_shift_character = fn
        ## if [UPPER CASE]
        <<c::8>> when c in @uppercase ->
            n = cond do
                    (c + shift) > ?Z -> ?A + (shift + c - ?Z) - 1
                    true -> c + shift
                end
            <<n>>

        ## if [downcase]
        <<c::8>> when c in @downcase ->
            n = cond do
                    (c + shift) > ?z -> ?a + (shift + c - ?z) - 1
                    true -> c + shift
                end
            <<n>>

        ## ELSE
        <<c::8>> -> <<c>>
    end

    ## Cipher pipeline
    text
    |> String.split("", trim: true)
    |> Enum.map(fun_shift_character)
    |> to_string()
  end
end
