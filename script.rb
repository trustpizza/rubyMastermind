require 'pry-byebug'
class Mastermind
    attr_accessor :game_board, :computer_guess
    @@game_over = false
    def initialize(p1)
        system('clear')
        @computer_choices = %w[red blue green purple black yellow]
        @computer_sample = %w[red blue green purple black yellow] #This is needed so that I can delete already chosen colors but still test against the original array
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

    def computer_choices_selector(computer_choices)
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
        player_guesses = []
        for i in 1..4 do
            puts "Guess spot #{i}"
            guess = gets.chomp.downcase
            player_guesses.push(guess)
        end
        player_guesses
    end

    def check_if_guess_exists(player_guesses, computer_guess)
        player_guesses.each do |guess|
            computer_guess.each do |item|
                if item == guess
                    puts "#{guess} exists in the code"
                end
            end
        end
        binding.pry
    end
        
    def check_if_guess_is_in_right_spot(player_guesses, computer_choices, computer_guess)
        for i in 0..3
            if player_guesses[i] == computer_choices[i]
                puts 'Black'
            end
        end
    end

    def play(p1, computer_choices, computer_guess)
        puts "#{p1.name} you have X guesses left over"
        puts "Guess!"
        player_guesses = player_guesses()
        check_if_guess_exists(player_guesses, @computer_guess)
        check_if_guess_is_in_right_spot(player_guesses)
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