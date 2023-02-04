defmodule PrettiexRecommended.Checks.NoModuleTest do
  use ExUnit.Case, async: true

  alias Prettiex.Issue
  alias Prettiex.Runner

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

    assert [%Issue{}] = Runner.run(PrettiexRecommended.Checks.NoModule, ast)
    
  end

  test "skip __MODULE__ aliases" do
    ast =
      quote do
        defmodule Person do
          alias __MODULE__
          defstruct [:name]

          def build(name) do
            %{name: name}
          end
        end
      end

    assert [] = Runner.run(PrettiexRecommended.Checks.NoModule, ast)
  end

  test "returns issue when both __MODULE__ usage and alias are present" do
    ast =
      quote do
        defmodule Person do
          alias __MODULE__
          defstruct [:name]

          def build(name) do
            %{name: name}
          end
        end
      end

    assert [] = Runner.run(PrettiexRecommended.Checks.NoModule, ast)
  end
end
