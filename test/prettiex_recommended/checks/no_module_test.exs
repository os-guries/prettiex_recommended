defmodule PrettiexRecommended.Checks.NoModuleTest do
  use ExUnit.Case, async: true

  alias PrettiexRecommended.Checks.NoModule
  alias Prettiex.Issue

  test "returns an issue when __MODULE__ is present" do
    ast =
      quote do
        defmodule Person do
          defstruct [:name]

          def build(name) do
            %__MODULE__{name: name}
          end
        end
      end

    assert [%Issue{}] = NoModule.run_on_module(ast)
  end
end
