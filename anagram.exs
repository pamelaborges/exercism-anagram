defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |>
    filter_not_equals(base) |>
    filter_equals_length(base) |>
    filter_anagram(base)
  end

  defp filter_not_equals(candidates, base) do
    Enum.filter(candidates, &(not_equals(base, &1)))
  end

  defp filter_equals_length(candidates, base) do
    Enum.filter(candidates, &(equals_length(base, &1)))
  end

  defp filter_anagram(candidates, base) do
    Enum.filter(candidates, &is_anagram?(&1, base))
  end

  defp is_anagram?(word, base) do
    convert_list_char(word) === convert_list_char(base)
  end

  defp convert_list_char(word), do: String.downcase(word) |> String.codepoints |> Enum.sort
  defp not_equals(w1, w2), do: String.downcase(w1) != String.downcase(w2)
  defp equals_length(w1, w2), do: String.length(w1) === String.length(w2)
end
