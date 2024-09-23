# Nikhil Kumar

require 'timeout'
require_relative 'deck'

class Game
    attr_reader :players

    def initialize
        # prompt the user for the number of players
        puts "Enter the number of players:"
        @num_players = gets.chomp.to_i

        # make sure at least 1 player
        if @num_players < 1
            puts "You need at least 1 player to start the game."
            exit
        end

        # initialize variables
        @deck = Deck.new
        @board = []
        @players = Array.new(@num_players) { { score: 0 } } # set all scores to 0
        @sets_found = 0
    end

    # starting text, deal, and start game loop
    def start
        puts "Welcome to the multiplayer game of Set!"
        puts "You have 2 minutes to identify as many sets as possible."
        deal_initial_cards
        play_game
    end

    # deal and display 12 cards
    def deal_initial_cards
        @board = @deck.deal(12)
        display_board
    end

    # display the board in vertical list format
    def display_board
        puts "\nCurrent board:"
        @board.each_with_index do |card, index|
        puts "#{index + 1}: #{card}"
        end
    end

    # play game for 120 seconds (2 minutes)
    def play_game
        begin
            Timeout.timeout(120) do # 120-second time limit
                game_loop
        end
        rescue Timeout::Error
            puts "\nTime's up!"
        end
        end_game
    end

    # game loop
    def game_loop
        while true
            # check if there are any valid sets available before asking for input
            if !set_available?
                puts "No valid sets on the board. The game is over!"
                break
            end

            # 
            puts "\nPlayers, identify a set by entering your player number and the card numbers separated by spaces (or type 'exit' to quit):"
            input = gets.chomp

            # exit if needed
            if input.downcase == 'exit'
                break
            end

            # separate id from cards
            player_id, selected_cards = process_input(input)

            # if valid set, replace cards, update score, and redisplay board. else, try again
            if player_id && selected_cards && valid_set?(selected_cards)
                @sets_found += 1
                @players[player_id][:score] += 1
                puts "Player #{player_id + 1} found a valid set! Their score: #{@players[player_id][:score]}"
                replace_cards(selected_cards)
                display_board
            else
                puts "Incorrect set or invalid input. Try again."
            end
        end
    end

    def process_input(input)

        # split the input into player number and card numbers
        parts = input.split
        player_id = parts.shift.to_i - 1 # First part is the player number
        selected_cards = parts.map { |i| @board[i.to_i - 1] rescue nil }
        [player_id, selected_cards.compact.size == 3 ? selected_cards : nil]
    end

    def valid_set?(cards)
        return false unless cards.size == 3
        attributes = [:number, :color, :shape, :shading]

        # check for each attribute, either all the same or all different
        attributes.all? do |attr|
            values = cards.map { |card| card.send(attr) }
            values.uniq.size == 1 || values.uniq.size == 3
        end
    end

    # replace cards using those in the deck, if there are any left
    def replace_cards(cards)
        cards.each do |card|
            @board[@board.index(card)] = @deck.deal(1).first if @deck.remaining_cards > 0
        end
    end

    # check if any valid sets are available on the current hand of 12
    def set_available?
        @board.combination(3).any? { |cards| valid_set?(cards) }
    end

    # print that the game is over, player with max score wins
    def end_game
        puts "\nGame over! Final scores:"
        @players.each_with_index do |player, index|
            puts "Player #{index + 1}: #{player[:score]} points"
        end

        winner = @players.each_with_index.max_by { |player, index| player[:score] }
        puts "The winner is Player #{winner[1] + 1} with #{winner[0][:score]} points!"
    end
end
