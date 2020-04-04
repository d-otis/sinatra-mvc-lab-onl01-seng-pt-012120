class PigLatinizer

  @@way = "way"
  @@ay = "ay"

  def piglatinize(input)
    if is_sentence?(input)
      sentence_changer(input)
    else
      word_changer(input)
    end
  end

  # private

  def sentence_changer(input)
    input.split.collect do |word|
      word_changer(word)
    end.join(" ")
  end

  def word_changer(word)
    if starts_with_one_consonant?(word)
      pl_one_consonant_word(word)
    elsif starts_with_two_consonants?(word) && !starts_with_three_consonants?(word)
      pl_two_consonant_word(word)
    elsif starts_with_three_consonants?(word)
      pl_three_consonant_word(word)
    elsif starts_with_a_vowel?(word)
      pl_vowel_word(word)
    end
  end

  def pl_one_consonant_word(word)
    first_letter = word[0]
    headless_word = word[1..word.size-1]
    final_word = headless_word + first_letter + @@ay
  end

  def pl_two_consonant_word(word)
    first_two_letters = word[0..1]
    headless_word = word[2..word.size-1]
    final_word = headless_word + first_two_letters + @@ay
  end

  def pl_three_consonant_word(word)
    first_three_letters = word[0..2]
    headless_word = word[3..word.size-1]
    final_word = headless_word + first_three_letters + @@ay
  end

  def pl_vowel_word(word)
    final_word = word + @@way
  end

  def starts_with_one_consonant?(word)
    if !word[0].downcase.scan(/[bcdfghjklmnpqrstvwxyz]/).empty? && !word[1].scan(/[aeoui]/).empty?
      true
    end
  end

  def starts_with_two_consonants?(word)
    if word[0..1].scan(/[bcdfghjklmnpqrstvwxyz]/).count == 2
      true
    end
  end

  def starts_with_three_consonants?(word)
    if word[0..2].downcase.scan(/[bcdfghjklmnpqrstvwxyz]/).count == 3
      true
    end
  end

  def starts_with_a_vowel?(word)
    if !word[0].downcase.scan(/[aeoui]/).empty?
      true
    end
  end

  def is_sentence?(word)
    if word.split.count > 1
      true
    end
  end

end
