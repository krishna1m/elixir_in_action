defmodule Chapter3 do
  @moduledoc """
  Exercises from Chapter 3
  Dealing with files
  """

  @doc """
  Outputs lengths of each line in the input file.

  ## Examples
  iex> Chapter3.lines_lengths!(".gitignore")
  [53, 8, 0, 61, 7, 0, 59, 6, 0, 66, 5, 0, 73, 7, 0, 62, 14, 0, 64, 4, 0, 53, 22, 0, 43, 5]
  """
  def lines_lengths!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.map(&String.length/1)
  end

  @doc """
  Outputs the longest line length in the input file.

  ## Examples
  iex> Chapter3.longest_line_length!(".gitignore")
  73
  """
  def longest_line_length!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.length/1)
    |> Enum.max()
  end

  @doc """
  Outputs the longest line in the input file.

  ## Examples
  iex> Chapter3.longest_line!(".gitignore")
  "# Ignore .fetch files in case you like to edit your project deps locally."
  """
  def longest_line!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.reduce(fn line, curr_max_line ->
      case String.length(line) > String.length(curr_max_line) do
        true ->
          line

        false ->
          curr_max_line
      end
    end)
  end

  @doc """
  Outputs the words per line in the input file.

  ## Examples
  iex> Chapter3.words_per_line!(".gitignore")
  [9, 1, 0, 12, 1, 0, 9, 1, 0, 9, 1, 0, 14, 1, 0, 13, 1, 0, 9, 1, 0, 8, 1, 0, 7, 1]
  """
  def words_per_line!(file_path) do
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.map(fn line ->
      length(String.split(line))
    end)
  end
end
