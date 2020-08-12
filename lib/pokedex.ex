defmodule Pokedex do
  @moduledoc """
  Documentation for `Testapp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Testapp.hello()
      :world

  """
  def hello do
    :world
  end

  def parse_csv(filename) do
    filename
    |> Path.expand
    |> File.stream!
    |> CSV.decode!(separator: ?;, headers: true)
  end

  def get_rare_pokemon(data) do
    data
    |> Enum.filter(fn %{"Legendary" => x} -> String.to_integer(x) == 1 end)
  end

  def encode_pokemon_data(data) do
    Jason.encode_to_iodata!(data, [pretty: true, escape: :javascript_safe])
  end

  def save_to_file(data,filename) do
    {:ok, file} = File.open(filename, [:utf8, :write])
    pokedata = IO.iodata_to_binary(data)
    IO.binwrite(file, pokedata)
    File.close(file)
  end

  def get_pokemon_from_json(filename, num) do
    {:ok, file} = File.read(filename)
    {:ok, pokemons} = Jason.decode(file)
    Enum.take(pokemons, num)
  end

end
