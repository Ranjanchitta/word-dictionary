require_relative '../lib/word_search_dictionary'
require 'rspec'

RSpec.describe WordSearchDictionary do
  it 'should convert 6686787825 number to expected words' do
    expect(subject.get_mapped_words('6686787825')).to match_array([['noun', 'struck'], ['onto', 'struck'], ['motor', 'truck'], ['motor', 'usual'], ['nouns', 'truck'], ['nouns', 'usual'], 'motortruck'])
  end

  it 'should convert 2282668687 number to expected words' do
    expect(subject.get_mapped_words('2282668687')).to match_array([['act', 'amounts'], ['act', 'contour'], ['bat', 'amounts'], ['bat', 'contour'], ['cat', 'amounts'], ['cat', 'contour'], ['acta', 'mounts'], 'catamounts'])
  end

  it 'should raise error for invalid input (0)' do
    expect { subject.get_mapped_words('0') }.to raise_error(RuntimeError, 'Please provide valid phone number.')
  end

  it 'should raise error for invalid input (1)' do
    expect { subject.get_mapped_words('1') }.to raise_error(RuntimeError, 'Please provide valid phone number.')
  end
end