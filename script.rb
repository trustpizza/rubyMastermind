class Mastermind
    attr_accessor :game_board, :computer_guess
    @@game_over = false
    def initialize(p1)
        system('clear')
        @computer_choices = ['red']
        @computer_guess = @computer_choices.sample
        welcome_screen(p1)
        p1.play(p1, @computer_guess)
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
    @choices = %w[Red Blue]
    puts "Hi #{@name}, welcome to MasterMind"
  end

  def player_name
    puts 'Hi player, what is your name?'
    @name = gets.chomp
  end

  def play(p1, computer_guess)
    puts "#{p1.name} you have X guesses left over"
        puts "Guess!"
        player_guess = gets.chomp.downcase
        if player_guess == computer_guess
            puts '1'
        elsif computer_guess.any? == player_guess
            puts '2'
        else puts 'you lose'
        end
    end
end

p1 = Player.new
game = Mastermind.new(p1)
