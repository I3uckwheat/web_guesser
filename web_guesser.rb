require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  color = color_choice(guess)
  erb :index, locals: { number: SECRET_NUMBER, message: message, color: color }
end

def check_guess(guess)
  if guess < SECRET_NUMBER
    return 'Way Too Low!' if guess < SECRET_NUMBER - 5
    'Too Low!'
  elsif guess > SECRET_NUMBER
    return 'Way Too High!' if guess > SECRET_NUMBER + 5
    'Too High!'
  else
    'You got it right!'
  end
end

def color_choice(guess)
  if guess < SECRET_NUMBER
    return 'red' if guess < SECRET_NUMBER - 5
    '#ff5050'
  elsif guess > SECRET_NUMBER
    return 'red' if guess > SECRET_NUMBER + 5
    '#ff5050'
  else
    'green'
  end
end
