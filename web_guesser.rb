require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@guesses_left = 5

get '/' do
  guess = params['guess'].to_i
  color = color_choice(guess)
  @@guesses_left -= 1
  number = select_number
  message = @@guesses_left.zero? ? reset : check_guess(guess)
  puts @@guesses_left
  erb :index, locals: { number: number, message: message, color: color }
end

def select_number
  return @@secret_number if params['guess'] == @@secret_number ||
                            params['cheat'] == true ||
                            @@guesses_left.zero?
end

def check_guess(guess)
  if guess < @@secret_number
    return 'Way Too Low!' if guess < @@secret_number - 5
    'Too Low!'
  elsif guess > @@secret_number
    return 'Way Too High!' if guess > @@secret_number + 5
    'Too High!'
  else
    reset
    "You're Right! Resetting..."
  end
end

def color_choice(guess)
  if guess < @@secret_number
    return 'red' if guess < @@secret_number - 5
    '#ff5050'
  elsif guess > @@secret_number
    return 'red' if guess > @@secret_number + 5
    '#ff5050'
  else
    'green'
  end
end

def reset
  fail = @@guesses_left.zero?
  @@guesses_left = 5
  @@secret_number = rand(100)
  'Resetting' if fail
end
