class Mastermind
    attr_accessor :game_board, :computer_guess
    @@game_over = false
    def initialize(p1)
        system('clear')
        @computer_choices = %w[red blue green purple black yellow]
        @computer_guess = @computer_choices.sample
        welcome_screen(p1)
        p1.play(p1, @computer_choices, @computer_guess)
    end

    def welcome_screen(p1)
        puts '==================='
        puts '======Welcome======'
        puts '========to========='
        puts '====MasterMind:===='
        puts "=======#{p1.name}!======="
        puts '==================='
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

  def play(p1, computer_choices, computer_guess)
    puts "#{p1.name} you have X guesses left over"
    puts "Guess!"
    player_guesses = player_guesses()
    check_if_guess_exists(player_guesses)
    check_if_guess_is_in_right_spot(player_guesses)

    def check_if_guess_exists(player_guesses, computer_choices)
        if computer_choices.any? == player_guesses
            puts 'white'
        end
    end
        
    def check_if_guess_is_in_right_spot(player_guesses, computer_choices, computer_guess)
        if computer_choices.index(computer_guesses) == computer_choices.index(player_guesses)  
            puts 'black'
        end      
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
end
end

p1 = Player.new
game = Mastermind.new(p1)