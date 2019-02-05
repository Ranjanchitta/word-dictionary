# frozen_string_literal: true

# Convert integer to possible word matched string
module WordSearchDictionary
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

  DICTIONARY = File.readlines('dictionary.txt').map { |x| x.strip.downcase }

  def self.get_mapped_words(number)
    number = number.is_a?(Integer) ? number.digits.reverse : number.to_i.digits.reverse
    raise 'Please provide valid phone number.' if number.empty? || !number.length.equal?(10)
    map_dgt = number.map { |dgt| DIGITS_MAP[dgt] }
    total = map_dgt.length - 1
    groups = mapped_combinations(map_dgt, total)
    words = combinations(groups)
    words << (map_dgt.shift.product(*map_dgt).map(&:join) & DICTIONARY).join(', ')
    words.delete_if(&:empty?)
  end

  def self.combinations(groups)
    words = []
    groups.delete_if { |x| x == [] }.each do |word|
      word.first.product(word.last).each do |aw|
        words << aw
      end
    end
    words
  end

  def self.mapped_combinations(num, total)
    words = []
    2.upto(total) do |i|
      first_word = num[0..i]
      next_word = num[i + 1..total]
      next if next_word.length < 3 || first_word.length < 3
      fcs = first_word.shift.product(*first_word).map(&:join)
      scs = next_word.shift.product(*next_word).map(&:join)
      next if fcs.nil? || scs.nil?
      words << [(fcs & DICTIONARY), (scs & DICTIONARY)]
    end
    words
  end
end
