defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller

  def index(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    conn
    |> put_session(:game, game)
    |> render("index.html", tally: tally)
  end

  def update(conn, params) do
    guess = params["guess"]

    tally =
      conn
      |> get_session(:game)
      |> Hangman.make_move(guess)

    put_in(conn.params["guess"], "")
    |> render("index.html", tally: tally)
  end
end
