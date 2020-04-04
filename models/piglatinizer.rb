class PigLatinizer

  def piglatinize(word)
    binding.pry
    way = "way"
    ay = "ay"
    # if starts with a consonant
      # lop of first letter and tack on end with "-ay"
    # elsif starts with two consonants
      # lop off first two letters and tack on end
    # elsif starts with vowel
      # keep work but tack on way @ the end
      if starts_with_one_consonant?(word)
        first_letter = word[0]
        headless_word = word[1..word.size-1]
        final_word = headless_word + first_letter + ay
      elsif starts_with_two_consonants?(word)
        first_two_letters = word[0..1]
        headless_word = word[2..word.size-1]
        final_word = headless_word + first_two_letters + ay
      elsif starts_with_a_vowel?(word)
        final_word = word + way
      end
  end

  def starts_with_one_consonant?(word)
    binding.pry
    if word[0].scan(/[bcdfghjklmnpqrstvwxyz]/) && word[1].scan(/[aeoui]/)
      true
    end

  end

  def starts_with_two_consonants?(word)

  end

  def starts_with_a_vowel?(word)

  end

end
