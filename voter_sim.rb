require './politician_class.rb'
require './voter_class.rb'

class Simulation

  def initialize
    @politician = [Politician.new("Adrian", "Republican")]
    @voter = [Voter.new("Fabian", "Liberal")]
    start
  end

  def start
    puts "\t\tWelcome to Voter Sim 2016"
    main_menu
  end

  def user_input
    gets.chomp.downcase
  end

  def answer_error
    puts "\t\tInput one character only."
    puts "\t\tTry again."
  end

  def ask_question(question)
    puts question
  end

  def main_menu
    ask_question("\t\tWhat would you like to do?\n\t\t(C)reate, (L)ist, (U)pdate, or (D)elete?\n\t\tTo Exit, type 'Exit'")
    answer = user_input

    if answer == "c"
      create
    elsif answer == "l"
      list
    elsif answer == "u"
      update
    elsif answer == "d"
      delete
    elsif answer == "exit"
      abort
    else
      answer_error
      main_menu
    end

  end

  def create
    ask_question("\t\tWhat would you like to create?\n\t\t(P)olitician or (V)oter?")
    create_answer = user_input

    if create_answer == "p"
      create_politician
    elsif create_answer == "v"
      create_voter
    else
      answer_error
      create
    end

  end

  def create_politician
    ask_question("\t\tEnter Politician's Name")
    pol_name = user_input.capitalize
    ask_question("\t\tEnter Politician's Political Party\n\t\t(D)emocrat, (R)republican or (I)ndependet")
    p_party = user_input
    until p_party == "d" || p_party ==  "i" || p_party == "r"
      answer_error
      create_politician
    end
    @politician << Politician.new(pol_name, Politician.political_party_question(p_party))
    p "#{@politician} created."
    main_menu
  end

  def create_voter
    ask_question("\t\tEnter Voter's Name")
    voter_name = user_input.capitalize
    ask_question("\t\tEnter Voter's Political Identification\n\t\t(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral")
    v_party = user_input
    until v_affiliation == "l" || v_affiliation == "c" || v_affiliation == "t" || v_affiliation == "s" || v_affiliation == "n"
      answer_error
      create_voter
    end
    @voter << Voter.new(voter_name, Voter.political_affiliation_question(v_party))
    p "#{@voter}\n\t\tcreated."
    main_menu
  end

  def list
    ask_question("\t\tWould you like to see (P)oliticians, (V)oters or (B)oth?")
    list_answer = user_input

    if list_answer == "p"
      puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
    elsif list_answer == "v"
      puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
    elsif list_answer == "b"
      puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
      puts "\n"
      puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
    else
      answer_error
      list
    end

    main_menu
  end

  def update
    ask_question("\t\tWould you like to Update (P)oliticians or (V)oters?")
    update_answer = user_input

    if update_answer == "p"
      update_politician
    elsif update_answer == "v"
      update_voter
    else
      answer_error
      update
    end

  end

  def update_politician
    puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
    ask_question("\t\tWho would you like to Update?\n\t\t(Type the Politicians Name)")
    update_politician_answer = user_input

    @politician.each do |find|

      if find.name.downcase == update_politician_answer
        ask_question("\t\tWould you like to update #{find.name}?\n\t\t(Y)es or (N)o?")
        yes_or_no = user_input

        if yes_or_no == "y"
          ask_question("\t\tWould you like to update the Politician's (N)ame or (P)arty?")
          name_or_party = user_input

          if name_or_party == "n"
            ask_question("\t\tEnter the new Name you would like to override the old one with")
            new_name = user_input.capitalize
            find.name = new_name
            puts "\t\tPolitician has been updated."
            puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
          elsif name_or_party == "p"
            ask_question("\t\tEnter Party: (D)emocrat, (R)epublican, (I)ndependent")
            new_party = user_input
            if new_party == "d"
              find.party = "Democrat"
              puts "\t\tPolitician has been updated."
              puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
            elsif new_party == "r"
              find.party = "Republican"
              puts "\t\tPolitician has been updated."
              puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
            elsif new_party == "i"
              find.party = "Independent"
              puts "\t\tPolitician has been updated."
              puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
            else
              answer_error
              update_politician
            end

          else
            answer_error
            update_politician

          end

        end

      end

      main_menu
    end

  end

  def update_voter
    puts @voter.map { |e| "\t\tVoter: #{e.name} | Affiliation: #{e.party}" }
    ask_question("\t\tWho would you like to Update?\n\t\t(Type the Voter's Name)")
    update_voter_answer = user_input

    @voter.each do |find|

      if find.name.downcase == update_voter_answer
        ask_question("\t\tWould you like to update #{find.name}?\n\t\t(Y)es or (N)o?")
        yes_or_no = user_input

        if yes_or_no == "y"
          ask_question("\t\tWould you like to update the Voter's (N)ame or (A)ffiliation?")
          name_or_affiliation = user_input

          if name_or_affiliation == "n"
            ask_question("\t\tEnter the new Name you would like to override the old one with")
            new_name = user_input.capitalize
            find.name = new_name
            puts "\t\tVoter has been updated."
            puts @voter.map { |e| "\t\tVoter: #{e.name} | Affiliation: #{e.party}" }
          elsif name_or_affiliation == "a"
            ask_question("\t\tEnter Affiliation: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist or (N)eutral.")
            new_affiliation = user_input
            if new_affiliation == "l"
              find.party = "Liberal"
              puts "\t\tVoter has been updated."
              puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
            elsif new_affiliation == "c"
              find.party = "Conservative"
              puts "\t\tVoter has been updated."
              puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
            elsif new_affiliation == "t"
              find.party = "Tea Party"
              puts "\t\tVoter has been updated."
              puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
            elsif new_affiliation == "s"
              find.party = "Socialist"
              puts "\t\tVoter has been updated."
              puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
            elsif new_affiliation == "n"
              find.party = "Neutral"
              puts "\t\tVoter has been updated."
              puts @voter.map { |e| "\t\tVoter: #{e.name} | Party: #{e.party}" }
            else
              answer_error
              update_politician
            end

          else
            answer_error
            update_politician

          end

        end

        main_menu
      end

    end

    def delete
      ask_question("\t\tWould you like to Delete (P)oliticians or (V)oters?")
      delete_answer = user_input

      if delete_answer == "p"
        delete_politician
      elsif delete_answer == "v"
        delete_voter
      else
        answer_error
        delete
      end

    end

    def delete_politician
      puts @politician.map { |e| "\t\tPolitician: #{e.name} | Party: #{e.party}" }
      ask_question("\t\tWho would you like to Delete?\n\t\t(Type the Politicians Name)")
      delete_politician_answer = user_input

      @politician.each do |find|

        if find.name.downcase == delete_politician_answer
          ask_question("\t\tWould you like to delete #{find.name}?\n\t\t (Y)es or (N)o?")
          yes_or_no = user_input

          if yes_or_no == "y"
            ask_question("\t\tAre you sure (Y)es or (N)o?")
            are_you_sure = user_input

            if are_you_sure == "y"
              @politician.delete find
            else
              delete_politician
            end

          elsif yes_or_no == "no"
            delete_politician
          else
            delete_politician
          end

        end

      end

      main_menu
    end

  end

  def delete_voter
    puts @voter.map { |e| "\t\tVoter: #{e.name} | Affiliation: #{e.party}" }
    ask_question("\t\tWho would you like to Delete?\n\t\t(Type the Voters Name)")
    delete_voter_answer = user_input

    @voter.each do |find|

      if find.name.downcase == delete_voter_answer
        ask_question("\t\tWould you like to delete #{find.name}?\n\t\t (Y)es or (N)o?")
        yes_or_no = user_input

        if yes_or_no == "y"
          ask_question("\t\tAre you sure (Y)es or (N)o?")
          are_you_sure = user_input

          if are_you_sure == "y"
            @voter.delete find
          else
            delete_voter
          end

        elsif yes_or_no == "no"
          delete_voter
        else
          delete_voter
        end

      end

    end

    main_menu
  end

end

Simulation.new
