WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], #Bottom Row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || board[index] == nil
    return false
  else
    return true
  end
end

def on_game_board?(index)
  valid_indexes = [0,1,2,3,4,5,6,7,8]
  
  if valid_indexes.include?(index)
    true
  else
    false
  end
end


def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  elsif !on_game_board?(index)
    return false
  else
    return true
  end
end

def turn(board)
  puts "Welcome to Tic Tac Toe!"
  display_board(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end