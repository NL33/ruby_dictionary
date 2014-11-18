class Term

@@all_terms = []

 def Term.all
  	@@all_terms
  end

 def initialize(word, definition)
 	@word = word #including "word" here seems redundant (for term carrot, word will be carrot). But included for proper reading of the term.
	@definitions = [definition] # brackets allow the definitions to be separated
 end

 def word
 	@word
 end

 def definitions
 	@definitions
 end

 def push_definition(new_definition)
 	@definitions << new_definition
 end

  def save
  	@@all_terms << self   
  end

  def show
  	puts self
  end

  def delete
  	@@all_terms.delete(self)
  end

  def delete_definition(edit_word, definition_to_delete)
  	edit_word.delete_at(definition_to_delete)
  end

  def loop
    Term.all.each {|word| puts "#{word.term}: #{word.definitions}"}
  end

  def Term.search(word_entry)
    Term.all.each do |term|
      result = term.word
      if result == word_entry
      	return "match"
      else 
      	return "no match"
      end
    end 
  end

 end

#the following code was used to evaluate some of the above code (it is not necessary, just for illustrative purposes)
Tree = Term.new("tree", "tall with a green top")

Tree.push_definition("provider of oxygen")

Tree.save

Brocolli = Term.new("brocolli", "green food")

Brocolli.push_definition("hearty veggie")

Brocolli.save

Brocolli.delete

array = Tree.definitions

array.delete_at(0)

puts array  #displays: "provider of oxygen"








