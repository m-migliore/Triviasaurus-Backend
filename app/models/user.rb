class User < ApplicationRecord
  has_many :games

  def allRounds
    roundsArray = []
    self.games.each {|game| roundsArray.concat(game.rounds) }
    roundsArray
  end

  def winPercentage
    correctRounds = allRounds.select{|round| round.correct}
    ((correctRounds.length / allRounds.length.to_f) * 100).to_i
  end

  def playedCategories
    self.allRounds.map {|round| round.category}.uniq
  end

  def categoryStats
    categoryHistory = {}
    self.playedCategories.each do |category|
      totalPlayed = allRounds.select {|round| round.category == category}
      totalWins = totalPlayed.select {|round| round.correct}
      categoryHistory[category] = {
        total: totalPlayed.size,
        wins: totalWins.size,
        winPercentage: ((totalWins.size / totalPlayed.size.to_f) * 100).to_i
      }
    end
    categoryHistory
  end
end
