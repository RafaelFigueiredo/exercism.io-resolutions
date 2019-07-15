defmodule Words do
  @ascii_punctuation ~r/!|"|\#|\$|%|&|'|\(|\)|\*|\+|,|\.|\/|:|;|<|=|>|\?|@|\[|\\|]|\^|_|`|\{|\||}|~|\s/
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = sentence
            |> String.downcase()                                # As case insentitive we put all in downcase
            |> String.split(@ascii_punctuation, trim: true)     # And split the list using whitespace \s and a list of ascii_punctuation


    # Using a Map as accumulator, for each word of setence we verifify if it is on our list
    # if not in list, create key with 1 iten to count
    # is is just increment the value in list.
    Enum.reduce(words, %{}, fn word, map->
                                  Map.update(map,word,1, fn v -> v + 1 end)
                                end)


    # The result will be in form Map{Word => Count}

  end
end
