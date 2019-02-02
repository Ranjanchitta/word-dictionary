require_relative '../lib/word_dictionary'
require 'rspec'

RSpec.describe WordDictionary do
  it 'should convert 6686787825 number to expected words' do
    expect(WordDictionary.word_dictionaries('6686787825')).to match_array([['motor', 'usual'], ['noun', 'struck'], ['nouns', 'truck'], ['nouns', 'usual'], ['onto', 'struck'], 'motortruck'])
  end

  it 'should convert 2282668687 number to expected words' do
    expect(WordDictionary.word_dictionaries('2282668687')).to match_array([['act', 'amounts'], ['act', 'contour'], ['acta', 'mounts'], ['bat', 'amounts'], ['bat', 'contour'], ['cat', 'contour'], "catamounts"])
  end

  it 'should raise error for invalid input (0)' do
    expect { WordDictionary.word_dictionaries('0') }.to raise_error(RuntimeError, "Invalid number '0' typed.")
  end

  it 'should raise error for invalid input (1)' do
    expect { WordDictionary.word_dictionaries('1') }.to raise_error(RuntimeError, "Invalid number '1' typed.")
  end
end