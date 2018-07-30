defmodule TestSpec do
  use ESpec

  it do: expect true |> to(be_true())
end

