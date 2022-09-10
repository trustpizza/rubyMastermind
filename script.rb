require 'pry-byebug'
require 'colorize'
class Mastermind
  attr_accessor :game_board, :computer_guess

  @@game_over = false
  def initialize(p1)
    system('clear')
    @computer_choices = %w[red blue green purple black yellow]
    @computer_sample = %w[red blue green purple black yellow] # This is needed so that I can delete already chosen colors but still test against the original array
    @computer_guess = computer_choices_selector(@computer_choices)
    welcome_screen(p1)
    play(p1, @computer_choices, @computer_guess)
  end

  def welcome_screen(p1)
    puts '==================='
    puts '======Welcome======'
    puts '========to========='
    puts '====MasterMind:===='
    puts "=======#{p1.name}!======="
    puts '==================='
  end

  def computer_choices_selector(_computer_choices)
    @computer_sample
    computer_code = []
    for i in 0..3 do
      choice = @computer_sample.sample
      @computer_sample.delete(choice)
      computer_code.push(choice)
    end
    computer_code
  end

  def player_guesses
    player_guesses = gets.chomp.downcase.split()
    player_guesses
  end

  def check_if_guess_exists(player_guesses, computer_guess)
    guesses_correct = 0
    player_guesses.each do |guess|
      computer_guess.each do |item|
        guesses_correct += 1 if item == guess
      end
    end
    feed_back = ''
    for i in 1..guesses_correct
      feed_back += "[]"
    end
    puts feed_back.green
  end

  def check_if_guess_is_in_right_spot(player_guesses, computer_guess)
    guesses_correct = 0
    for i in 0..3
        if player_guesses[i] == computer_guess[i]
          guesses_correct += 1
        end
    end
    if guesses_correct == 4
      puts "You Cracked the Code!"
    else
      feed_back = '' 
      for i in 1..guesses_correct
        feed_back += "[]"
      end
      puts feed_back.red
    end
  end

  def play(p1, _computer_choices, computer_guess)
    rounds_played = 0
    until @@game_over == true
        puts "#{p1.name} you have #{9 - rounds_played} guesses left over"
        puts rounds_played == 0 ? 'Guess!' : 'Guess again!'
        rounds_played += 1
        player_guesses = player_guesses()
        check_if_guess_exists(player_guesses, @computer_guess)
        check_if_guess_is_in_right_spot(player_guesses, computer_guess)
        if rounds_played == 9 
            @@game_over = true
            puts "Game over #{p1.name}. You did not crack the code!"
            puts "The code was #{computer_guess}"
        #elsif
            # All guesses are in the right spot
            # You win!
        end
    end
  end
end

# Creates a player for each game
class Player
  attr_accessor :name

  def initialize
    player_name
    @choices = %w[red blue green purple black yellow]
    puts "Hi #{@name}, welcome to MasterMind"
  end

  def player_name
    puts 'Hi player, what is your name?'
    @name = gets.chomp
  end
end

p1 = Player.new
game = Mastermind.new(p1)