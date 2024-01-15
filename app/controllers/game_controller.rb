require "open-uri"



class GameController < ApplicationController

  def new
    letters = ('A'..'Z').to_a
    @answer = []

    10.times do
      letter = letters.sample
      @answer.push(letter)
      # letters.delete(letter)
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/" + params[:answer]

    @result = "Sorry but #{params[:answer]} does not seem to be an english word"

    if JSON.parse(URI.open(url).read)["found"]
      @result = "Congratulations! #{params[:answer]} is a valid english word!"
    end

  end

end
