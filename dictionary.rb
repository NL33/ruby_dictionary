require './lib/term'

def main_menu

  puts "Press 'a' to add a new term and definition. Press 'l' to list all terms and definitions. 
        Press 'e' to edit a term. Press 's' to search for a term. Press 'x' to exit"
  when 'a'
    add_term
  when 'l'
    list_terms
  when 'e'
    edit_terms
  when 's'
    search_terms
  when 'x'
    exit
  else
    puts "Please enter a valid option"
  end
end

  def add_term
    puts "please enter a word for the new definition"
     word_input = gets.chomp.to_s
    puts "please enter the definition for #{word_input}"
      definition_input = gets.chomp.to_s
    word_input = Term.new(definition_input)
    word_input.save
    puts "#{word_input} has been created"
    additional_terms
  end

  def additional_terms
    puts "press 'n' to enter a new definition for #{word_input} or press 'x' to return to main menu"
     if gets.chomp = 'n'
      puts "please enter the new definition" 
        additional_definition = gets.chomp.to_s
        word_input.push_definition(additional_definition)
      puts "your definition has been saved" 
      additional_terms
     elsif gets.chomp = 'x'
      main_menu
    end
  end

  def list_terms
    Term.all.each do |word|
      puts "#{word.word}: #{word.definitions}"
    end
    puts "Press 'm' to return to the main menu."
     if gets.chomp == 'm'
        main_menu
     else
        puts "please enter a valid selection"
    end
  end

  def edit_terms
    puts "please enter the term that you would like to edit"
    word_to_edit = gets.chomp.to_s
    if Term.search(word_to_edit) == "match"
      puts "enter 't' to delete the entire term or 'd' to delete one of #{word_to_edit}'s definitions"
        if gets.chomp == 't'
         word_to_edit.delete
         puts "#{word_to_edit} has been deleted"
         puts "Press 'e' to enter a new term to edit or 'x' to return to the main menu"
            if gets.chomp == 'e'
              edit_terms
            elsif gets.chomp == 'x'
              main_menu
             end
        elsif gets.chomp == 'd'
          "please enter the number of the definition you wish to delete (for example, for the first definition, enter '1', for the second, enter '2', etc..)"
          array = word_to_edit.definitions
          definition_number = gets.chomp - 1  #minus 1 to correspond to natural array numbering
          array.delete_at(definition_number)
          puts "that definition has been deleted" 
          puts "Press 'e' to enter a new term to edit or 'x' to return to the main menu"
            if gets.chomp == 'e'
              edit_terms
            elsif gets.chomp == 'x'
              main_menu
             end
    elsif Term.search(word_to_edit) == no match 
      "we did not find that word. Press 'j' to enter a term to edit or 'r' to exit"
      if gets.chomp == 'j'
        edit_terms
      elsif gets.chomp == 'r'
        main_menu
      elsif gets.chomp != 'j' || != 'r'
        puts "please enter a valid selection"
      end
    end
  end

def search_terms
  puts "Enter the term you want to search for"
  searched_for_word = gets.chomp
  if Term.search(searched_for_word) == "match"
    puts "#{word.word}: #{word.definitions}"
    puts "Press 's' to search again, or 'm' to return to the main menu."
      if gets.chomp == 's'
          search_term
      elsif gets.chomp == 'm'
          main_menu
      end
  elsif Term.search(searched_for_word) == "no match"
    puts "No match. Press 's' to search again, or 'm' to return to the main menu."
       if gets.chomp == 's'
          search_term
      elsif gets.chomp == 'm'
          main_menu
      end
  end
end



