defmodule PrettiexRecommended.Checks.NoModule do
  alias Prettiex.Issue

  def run_on_module(ast) do
    Prettiex.collect(ast, fn
      {:alias, _meta, [{:__MODULE__, _, _}]} ->
        :skip

      {:__MODULE__, _, _} ->
        %Issue{
          name: NoModule,
          message:
            "__MODULE__ should not be referenced in the code. " <>
              "Use a __MODULE__ alias instead."
        }

      _ ->
        :continue
    end)
  end
end
