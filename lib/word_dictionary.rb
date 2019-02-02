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
end
