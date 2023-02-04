defmodule PrettiexRecommended.Checks.PublicFunctionsOnTop do
  use Prettiex

  check do
    meta do
      name "Public functions on top"
      message "Public function declarations should come first in a module"

      description """
      """
    end

    definition do
      sequence do
        pattern form defp

        pattern form def
      end
    end
  end
end

