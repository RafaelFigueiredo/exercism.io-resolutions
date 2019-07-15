defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    words = String.split(phrase)

    # for loop recursive
    to_string(for_words(words))
  end

  def for_words([w | tail]) do
    cond do
      tail == [] ->
        translate_word(w)

      tail != [] ->
        translate_word(w) <> " " <> for_words(tail)

      true ->
        nil
    end
  end

  def translate_word(word) do
    # we will split the world in the first vowel or in 'y'. It will giv a list with 3 parts
    # c - consoant part, v - vowel , tail - the rest of the word

    [c, v, tail] = String.split(word, ~r{(a|e|i|o|u)}, parts: 2, include_captures: true)
    [c_y, v_y, tail_y] = String.split(word, ~r{(a|e|i|o|u|y)}, parts: 2, include_captures: true)

    # @todo se a palavra não tem vogal

    cond do
      ######## RULE 1 #######
      # If a word begins with a vowel sound, add an "ay" sound to the end of the word.
      # Please note that "xr" and "yt" at the beginning of a word make vowel sounds
      # (e.g. "xray" -> "xrayay", "yttria" -> "yttriaay").

      # if lenght of constant part is zero, then start with vowel
      String.length(c) == 0 ->
        word <> "ay"

      # if the fist letter is x or y, folowed by another consoant, add "ay" to the end
      String.length(c) >= 2 and (String.first(c) == "x" or String.first(c) == "y") ->
        word <> "ay"

      # String.length(c) == 0 and String.first(v) == "y"-> tail <> v <>"ay"

      ######## RULE 3 ########
      # If a word starts with a consonant sound followed by "qu", move it to the end of the word,
      # and then add an "ay" sound to the end of the word (e.g. "square" -> "aresquay").
      # Note: Rule 3 come before Rule 2 because Rule 2 is valid for any lenght of constant greater then zero, so
      # rule 3 will never be evalueted if it come after
      String.last(c) == "q" and String.first(v) == "u" ->
        [c_q, _, tail] = String.split(word, ~r{(u)}, parts: 2, include_captures: true)
        tail <> c_q <> "uay"

      ######## RULE 4 ########
      # If a word contains a "y" after a consonant cluster or as the second letter in a two letter
      # word it makes a vowel sound (e.g. "rhythm" -> "ythmrhay", "my" -> "ymay").
      String.length(c_y) == 1 and String.first(v_y) == "y" ->
        v <> tail <> c <> "ay"

      String.length(c_y) > 1 and String.first(v_y) == "y" ->
        v <> tail <> c <> "ay"

      ######## RULE 2 ########
      # If a word begins with a consonant sound, move it to the end of the word and then add an
      # "ay" sound to the end of the word. Consonant sounds can be made up of multiple
      # consonants, a.k.a. a consonant cluster (e.g. "chair" -> "airchay").
      String.length(c_y) > 0 and String.first(v_y) == "y" ->
        tail <> v <> c <> "ay"

      String.length(c) > 0 and String.first(v) != "y" ->
        v <> tail <> c <> "ay"
    end
  end
end
