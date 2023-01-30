# frozen_string_literal: true

# BEGIN
def anagramm_filter(input_word, words)
  words.filter { |word| word.chars.tally == input_word.chars.tally }
end
# END
