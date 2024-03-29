defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn(nuc)->
                    cond do
                      nuc == ?G -> ?C
                      nuc == ?C -> ?G
                      nuc == ?T -> ?A
                      nuc == ?A -> ?U
                    end
                  end)

  end
end
