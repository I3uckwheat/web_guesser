require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess, number)
  erb :index, locals: { number: number, message: message, guess: guess }
end

def check_guess(guess, number)
  if guess > number
    message = guess > number + 5 ? 'Way too high!' : 'Too high!'
  elsif guess < number
    message = guess < number - 5 ? 'Way too low!' : 'Too low'
  elsif guess == number
    message = 'You got it right!'
  end
  message
end
