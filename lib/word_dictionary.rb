# frozen_string_literal: true

# Convert integer to possible word matched string
module WordDictionary
  DIGITS_MAP = {
    2 => %w[a b c],
    3 => %w[d e f],
    4 => %w[g h i],
    5 => %w[j k l],
    6 => %w[m n o],
    7 => %w[p q r s],
    8 => %w[t u v],
    9 => %w[w x y z]
  }.freeze

  DICTIONARY = File.readlines('dictionary.txt').map(&:strip)

  # Convert number to array of elements. The element may be word or word pair.
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def self.word_dictionaries(number)
    first = ''
    last = number.dup
    full_words = word_dictionary(number)
    words = full_words
    while last.length > 3
      first += last.slice!(0)
      next if first.length < 3
      first_words = word_dictionary(first)
      last_words = word_dictionary(last)

      if !first_words.empty? && !last_words.empty?
        combinations = first_words.product(last_words)
        words += combinations
      end
      # remove full_words from words pairs
      words.reject! { |ele| full_words.include?(ele[0] + ele[1]) }
    end
    words
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  # Convert number to array of words. The element will be a whole word
  def self.word_dictionary(number)
    words = nil
    number.each_char do |num|
      digits = DIGITS_MAP[num.to_i]
      raise "Invalid number '#{num}' typed." if digits.nil?
      words = !words.nil? ? words.product(digits) : digits
    end
    final_words = words.map { |ele| ele.flatten.join }
    final_words.select! { |word| word_exists(word) }
    final_words
  end

  # Check word exists in the dictionary ?
  def self.word_exists(word)
    upcase_word = word.upcase
    w = DICTIONARY.bsearch { |x| x >= upcase_word }
    w == upcase_word
  end
end
