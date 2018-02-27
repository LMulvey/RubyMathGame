require './questions'

module MathGame
    class Game
        attr_accessor :Player1Name
        attr_accessor :Player2Name

        def initialize(player1, player2)
            @Player1 = player1
            @Player2 = player2
            @GameIsOn = true
            @CurrentPlayer = @Player1
            @Questions = MathGame::Questions.new
        end

         # Main process
         def run
            while @GameIsOn do
                if(!@Player1.name || !@Player2.name)
                    self.set_names
                else
                    run_turn
                end
            end
            end_game
        end

        def end_game
            puts "GAME OVER!"
            puts "Final scores: #{get_scores}"
            winner = (@Player1.lives > @Player2.lives) ? @Player1.name : @Player2.name
            puts "#{winner} wins! Congratulations, mah dude."
        end

        def get_scores 
            return  "#{@Player1.name} [#{@Player1.lives}/3] | #{@Player2.name} [#{@Player2.lives}/3]"
        end

        def run_turn
            thisQuestion = @Questions.new_question
            puts "Hey #{@CurrentPlayer.name}: #{thisQuestion[:question]}"
            answer = gets.chomp

            handle_answer(answer == thisQuestion[:answer].to_s)

            if(is_game_over)
                @GameIsOn = false
                return
            else
                puts "Current scores: #{get_scores}"
                switch_player
                puts "----- NEXT TURN -----"
            end
        end

        def switch_player
            if(@CurrentPlayer === @Player1)
                @CurrentPlayer = @Player2
            else
                @CurrentPlayer = @Player1
            end
        end

        def is_game_over
            if(@Player1.lives === 0 || @Player2.lives === 0)
                return true
            else
                return false
            end
        end

        def handle_answer(correct)
            if(correct)
                puts "Nice work, #{@CurrentPlayer.name}! That is correct!"
            else
                puts "Seriously? No. That's wrong, #{@CurrentPlayer.name}!"
                @CurrentPlayer.lives -= 1
            end
        end

        def set_names
            puts "What's your name?"
            @Player1.name = gets.chomp

            puts "Alright, Player 1. Or, uh, #{@Player1.name}... what's your friends name?"
            @Player2.name = gets.chomp

            puts "Alright! We've got #{@Player1.name} and #{@Player2.name}!"
            self.run
        end
    end
end