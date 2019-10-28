defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  import Gallows.Views.Helpers.GameStateHelper

  def game_over?(%{game_state: game_state}) do
    game_state in [:won, :lost]
  end

  def new_game_button(conn) do
    link("New Game", to: Routes.hangman_path(conn, :index), method: :get, class: :button)
  end

  def turn(left, target) when target >= left do
    "faint"
  end

  def turn(_left, _target) do
    "dim"
  end
end
