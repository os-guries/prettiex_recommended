defmodule PrettiexRecommended.Checks.PublicFunctionsOnTopTest do
  use ExUnit.Case, async: true

  alias Prettiex.Issue
  alias Prettiex.Runner

  test "returns an issue a private function is found before a public one" do
    ast =
      quote do
        defmodule Person do
          defp underage?(person) do
          end

          def build(name) do
            %__MODULE__{name: name}
          end
        end
      end

    assert [%Issue{}] = Runner.run(PrettiexRecommended.Checks.PublicFunctionsOnTop, ast)
  end
end
