require './people_class.rb'


class Voter < People

  def self.political_affiliation_question(voter_affiliation_answer)

    if voter_affiliation_answer == "l"
      "Liberal"
    elsif voter_affiliation_answer == "c"
      "Conservative"
    elsif voter_affiliation_answer == "t"
      "Tea Party"
    elsif voter_affiliation_answer == "s"
      "Socialist"
    elsif voter_affiliation_answer == "n"
      "Neutral"
    else
      puts "\t\tInput one character only."
      puts "\t\tTry again."
    end

  end

end
