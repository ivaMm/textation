require 'textation/text'

describe Text do
  tx = Text.new
  result = {
      character_count: 31,
      character_count_excluding_spaces: 25,
      letter_count: 23,
      line_count: 1,
      word_count: 8,
      sentence_count: 2,
      paragraph: ['I love Ruby! And Ruby loves me!'],
      paragraph_count: 1,
      lines_per_paragraph: [1],
      syllables_per_line: [9],
      average_words_per_sentence: 4.0,
      average_sentences_per_paragraph: 2.0,
      useful_words:  ["love", "ruby", "loves"],
      percentage_of_useful_words: 40.0,
      unique_words:  ["i", "love", "ruby", "and", "loves", "me"],
      percentage_of_unique_words: 80.0,
      occurences_of_words: {"ruby"=>2, "i"=>1, "love"=>1, "and"=>1, "loves"=>1, "me"=>1},
      percentage_of_words: {"ruby"=>30.0, "i"=>10.0, "love"=>10.0, "and"=>10.0, "loves"=>10.0, "me"=>10.0}
  }

  it 'text file analyze' do
    expect(tx.analyze_file('data/test_source_text.txt')).to be_a Hash
  end

  it 'text analyze' do
    expect(tx.analyze('I love Ruby!')).to be_a Hash
    expect(tx.analyze('I love Ruby! And Ruby loves me!')).to eq(result)
  end

  it 'top words' do
    expect(tx.occurence_of_word('I love Ruby! And Ruby loves me!', 'ruby')).to eq(2)
  end
end

# terminal:
# bundle exec rspec spec
