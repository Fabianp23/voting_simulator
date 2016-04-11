require './people_class.rb'


class Politician < People

  def self.political_party_question(political_party_answer)

    if political_party_answer == "d"
      "Democrat"
    elsif political_party_answer == "r"
      "Republican"
    elsif political_party_answer == "i"
      "Independent"
    else
      puts "\t\tInput one character only."
      puts "\t\tTry again."
    end

  end

end
