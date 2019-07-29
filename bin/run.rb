require_relative "../config/environment"

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def greeting
  puts "Let's play Mini-doku!"
  puts "Each row and column must contain numbers 1-3"
  puts "---------------------------------------"
  sleep(2)
end

def main_menu
  prompt = TTY::Prompt.new
  prompt.select("Select a position on the grid from 1-9") do |menu|
    menu.choice name: "1", value: 1
    menu.choice name: "2", value: 2
    menu.choice name: "3", value: 3
    menu.choice name: "4", value: 4
    menu.choice name: "5", value: 5
    menu.choice name: "6", value: 6
    menu.choice name: "7", value: 7
    menu.choice name: "8", value: 8
    menu.choice name: "9", value: 9
  end
end

def select_token
  prompt = TTY::Prompt.new
  prompt.select("Select a number to place") do |menu|
    menu.choice name: "1", value: 1
    menu.choice name: "2", value: 2
    menu.choice name: "3", value: 3
  end
end

def select_index
  case main_menu
  when 1
    return 0
  when 2
    return 1
  when 3
    return 2
  when 4
    return 3
  when 5
    return 4
  when 6
    return 5
  when 7
    return 6
  when 8
    return 7
  when 9
    return 8
  end
end

def select_number
  case select_token
  when 1
    return 1
  when 2
    return 2
  when 3
    return 3
  end
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def move(index, token)
  @board[index] = token
end

def turn
  index = main_menu
  token = select_token
#   binding.pry
  move(index, token)
  display_board
end

board = ["1", " ", " ", " ", "2", " ", " ", " ", "3", " ", " ", " "]
greeting
game = Sudoku.new(board)
game.display_board
turn
