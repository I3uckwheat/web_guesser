require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
get '/' do
  guess = params['guess'].to_i
  message, color = check_guess(guess, number)
  erb :index, locals: { number: number, message: message, guess: guess, color: color }
end

def check_guess(guess, number)
  if guess > number + 5
    message = 'Way too high!'
    color = 'red'
  elsif guess > number
    message = 'Too High!'
    color = 'LightCoral'
  elsif guess < number - 5
    message = 'Way too low!'
    color = 'red'
  elsif guess < number
    message = 'too Low!'
    color = 'LightCoral'
  elsif guess == number
    message = 'You got it right!'
    color = 'green'
  end
  [message, color]
end
