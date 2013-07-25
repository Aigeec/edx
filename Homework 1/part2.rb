class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class String
	def beats?(val)
		if(self.downcase == 'r' and val.downcase == 'p')
			return false
		elsif(self.downcase == 'p' and val.downcase == 's')
			return false
		elsif(self.downcase == 's' and val.downcase == 'r')
			return false
		elsif(self.downcase == val.downcase)
			return true
		else
			return true
		end
	end
end

def rps_game_winner(game)
	# YOUR CODE HERE	
	raise WrongNumberOfPlayersError unless game.length == 2	
	game.each do |p|  raise NoSuchStrategyError unless ['r', 'p', 's'].index(p[1].downcase)  end

	playerOneStrategy = game[0][1]
	playerTwoStrategy = game[1][1]

	if (playerOneStrategy.beats?(playerTwoStrategy))
		return game[0]
	else
		return game[1]
	end	
end

def rps_tournament_winner(tournament)  
  # YOUR CODE HERE    
  if(tournament.size % 2 and tournament.size > 2)  
  	winnerOne = rps_tournament_winner(tournament.slice(0, tournament.size/2))
  	winnerTwo = rps_tournament_winner(tournament.slice(tournament.size/2, tournament.size/2))
  	rps_tournament_winner([winnerOne, winnerTwo])
  elsif(tournament.size == 2 and tournament[0][0].size == 2)  	  	
  	winnerOne = rps_tournament_winner(tournament[0])
  	winnerTwo = rps_tournament_winner(tournament[1])
  	rps_tournament_winner([winnerOne, winnerTwo])
  elsif (tournament.size == 2 and tournament[0][0].is_a? String and tournament[1][0].is_a? String)
  	winner = rps_game_winner(tournament)  	
  	winner
  else
  	raise WrongNumberOfPlayersError
  end
end

puts rps_tournament_winner([ [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"], ["Michael", "S"] ], ], [ [ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ], [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"], ["Michael", "S"] ], ], [ [ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ] ])