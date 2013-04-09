# encoding: utf-8
require 'questionnaire'

module UglyTrivia
  class Game
    def  initialize
      @players = []
      @places = Array.new(6, 0)
      @purses = Array.new(6, 0)
      @in_penalty_box = Array.new(6, 0)

      @questionnaire = Questionnaire.new

      @current_player = 0
      @is_getting_out_of_penalty_box = false
    end

    def is_playable?
      how_many_players >= 2
    end

    def add(player_name)
      @players.push player_name
      @places[how_many_players] = 0
      @purses[how_many_players] = 0
      @in_penalty_box[how_many_players] = false

      puts "#{player_name} was added"
      puts "They are player number #{@players.length}"

      true
    end

    def how_many_players
      @players.length
    end

    def roll(roll)
      puts "#{@players[@current_player]} is the current player"
      puts "They have rolled a #{roll}"

      if @in_penalty_box[@current_player]
        if roll % 2 != 0
          @is_getting_out_of_penalty_box = true

          puts "#{@players[@current_player]} is getting out of the penalty box"
          advance_player_by roll
          ask_question
        else
          puts "#{@players[@current_player]} is not getting out of the penalty box"
          @is_getting_out_of_penalty_box = false
        end

      else
        advance_player_by roll
        ask_question
      end
    end

    def advance_player_by roll
      @places[@current_player] += roll
      @places[@current_player] -= 12 if @places[@current_player] > 11
      puts "#{@players[@current_player]}'s new location is #{@places[@current_player]}"
      puts "The category is #{current_category}"
    end

    def did_fictional_user_answer_correctly?
      if rand(9) == 7
        wrong_answer
      else
        was_correctly_answered‽
      end
    end

    private

    def ask_question
      puts @questionnaire.next_question(current_category)
    end

    def current_category
      Questionnaire.category_for(@places[@current_player])
    end

    public

    def was_correctly_answered‽
      if @in_penalty_box[@current_player] and not @is_getting_out_of_penalty_box
        next_player!
        true
      else
        puts 'Answer was correct!!!!'
        @purses[@current_player] += 1
        puts "#{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins."

        winner = did_player_win
        next_player!
        return winner
      end
    end

    def wrong_answer
      puts 'Question was incorrectly answered'
      puts "#{@players[@current_player]} was sent to the penalty box"
      @in_penalty_box[@current_player] = true
      next_player!
      return true
    end

    private

    def next_player!
      @current_player += 1
      @current_player %= @players.length
    end

    def did_player_win
      !(@purses[@current_player] == 6)
    end
  end
end
