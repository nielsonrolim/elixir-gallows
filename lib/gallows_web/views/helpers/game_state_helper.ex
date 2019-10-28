defmodule Gallows.Views.Helpers.GameStateHelper do
  import Phoenix.HTML, only: [raw: 1]

  @responses %{
    won: {:info, "You won!"},
    lost: {:danger, "You lost!"},
    good_guess: {:success, "Good guess!"},
    bad_guess: {:warning, "Bad guess!"},
    already_used: {:dark, "You already guessed that."},
    invalid_move: {:warning, "Must be only one letter."}
  }
  def game_state(state) do
    @responses[state]
    |> alert()
  end

  defp alert(nil), do: ""

  defp alert({class, message}) do
    """
      <p class="alert alert-#{class}" role="alert">
        #{message}
      </p>
    """
    |> raw()
  end
end
