defmodule GameGuess do
  # A guessing game
  def gen_random_num do
    # Generate a random number
    num_list = Enum.to_list 1..10
    Enum.random num_list
  end

  def user_guess do
    # User guesses a number
    IO.gets "Guess a number "
  end

  def str_to_int word do
    # Convert user input to int
    guess = String.replace word, "\n", ""
    String.to_integer guess
  end

  def game_round 0, number do
    # The game is over and the user did not guess the number
    IO.puts "You did not guess my number, it was #{number}"
  end

  def game_round n, number do
    guess = user_guess
    guess = str_to_int guess
    IO.puts number
    cond do
      guess == number ->
        IO.puts "You guessed correctly!"
      guess > number ->
        IO.puts "You guessed too high."
        game_round(n-1, number)
      guess < number ->
        IO.puts "You guessed too low."
        game_round(n-1, number)
    end
  end
end


number = GameGuess.gen_random_num
GameGuess.game_round(5, number)
