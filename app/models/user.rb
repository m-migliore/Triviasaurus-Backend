class User < ApplicationRecord
  has_many :games

  def allRounds
    roundsArray = []
    self.games.each {|game| roundsArray.concat(game.rounds) }
    roundsArray
  end

  def allWins
    allRounds.select{|round| round.correct}
  end

  # def winPercentage
  #   correctRounds = allRounds.select{|round| round.correct}
  #   ((correctRounds.length / allRounds.length.to_f) * 100).to_i
  # end

  # def winPercentage(wins, total)
  #   ((wins.length / total.length.to_f) * 100).to_i
  # end
  def winPercentage(wins, total)
    if total.length > 0
      ((wins.length / total.length.to_f) * 100).to_i
    else
      0
    end
  end

  def difficultyPlayed(roundArray, difficulty)
    roundArray.select{|round| round.difficulty == difficulty}
  end

  def difficultyWon(roundArray, difficulty)
    roundArray.select{|round| round.difficulty == difficulty && round.correct}
  end

  def playedCategories
    self.allRounds.map {|round| round.category}.uniq
  end

  def categoryStats
    statsByCategory = {}
    self.playedCategories.each do |category|
      totalPlayed = allRounds.select {|round| round.category == category}
      totalWins = totalPlayed.select {|round| round.correct}
      statsByCategory[category] = {
        total: totalPlayed.length,
        wins: totalWins.length,
        winPercentage: winPercentage(totalWins, totalPlayed),
        easyTotal: difficultyPlayed(totalPlayed,"easy").length,
        easyWins: difficultyWon(totalWins,"easy").length,
        easyPercentage: self.winPercentage(difficultyWon(totalWins,"easy"), difficultyPlayed(totalPlayed,"easy")),
        mediumTotal: difficultyPlayed(totalPlayed, "medium").length,
        mediumWins: difficultyWon(totalWins,"medium").length,
        mediumPercentage: self.winPercentage(difficultyWon(totalWins,"medium"), difficultyPlayed(totalPlayed,"medium")),
        hardTotal: difficultyPlayed(totalPlayed,"hard").length,
        hardWins: difficultyWon(totalWins,"hard").length,
        hardPercentage: self.winPercentage(difficultyWon(totalWins,"hard"), difficultyPlayed(totalPlayed,"hard")),
      }
    end
    statsByCategory
  end



  def totalStats
    stats = {
      total: self.allRounds.length,
      wins: self.allWins.length,
      winPercentage: self.winPercentage(allWins, allRounds),
      easyTotal: self.difficultyPlayed(self.allRounds,"easy").length,
      easyWins: self.difficultyWon(self.allRounds,"easy").length,
      easyPercentage: self.winPercentage(self.difficultyWon(self.allRounds,"easy"), self.difficultyPlayed(self.allRounds,"easy")),
      mediumTotal: self.difficultyPlayed(self.allRounds, "medium").length,
      mediumWins: self.difficultyWon(self.allRounds,"medium").length,
      mediumPercentage: self.winPercentage(self.difficultyWon(self.allRounds,"medium"), self.difficultyPlayed(self.allRounds,"medium")),
      hardTotal:self. difficultyPlayed(self.allRounds,"hard").length,
      hardWins: self.difficultyWon(self.allRounds,"hard").length,
      hardPercentage: self.winPercentage(self.difficultyWon(self.allRounds,"hard"), self.difficultyPlayed(self.allRounds,"hard")),
    }
  end
end
