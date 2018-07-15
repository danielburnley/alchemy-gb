defmodule DumpRomHex do
  def main(args) do
    parse_args(args) |> execute
  end

  defp parse_args(argv) do
    {_, args, _} = OptionParser.parse(argv)
    args
  end

  defp execute([]) do
    IO.puts("Usage: dump_rom_to_hex.sh path_to_rom.gb")
  end

  defp execute([path]) do
    {:ok, rom} = File.read(path)
    print_file(rom, 0, 0)
  end

  defp write_address(address) do
    IO.write("0x#{Integer.to_string(address, 16) |> String.pad_leading(4, "0")} | ")
  end

  defp write_byte(byte, 0, address) do
    write_address(address)
    IO.write(Integer.to_string(byte, 16) |> String.pad_leading(2, "0"))
  end

  defp write_byte(byte, 15, _) do
    IO.write(Integer.to_string(byte, 16) |> String.pad_leading(2, "0"))
    IO.write("\n")
  end

  defp write_byte(byte, _, _) do
    IO.write(Integer.to_string(byte, 16) |> String.pad_leading(2, "0"))
    IO.write(" ")
  end

  defp print_file(<<>>, _, _), do: nil

  defp print_file(<<byte::integer-size(8), rest::binary>>, i, address) do
    write_byte(byte, i, address)
    print_file(rest, rem(i + 1, 16), address + 1)
  end
end

DumpRomHex.main(System.argv())
