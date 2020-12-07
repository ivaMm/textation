require 'textation/text'

describe Text do
  tx = Text.new
  result_file = {
    average_sentences_per_paragraph: 2.5,
    average_words_per_sentence: 23.2,
    character_count: 574,
    character_count_excluding_spaces: 483,
    letter_count: 455,
    line_count: 6,
    lines_per_paragraph: [3, 2],
    occurences_of_words: {"anything"=>5, "arrested"=>5, "done"=>5, "for"=>5, "have"=>5, "having"=>5, "he"=>5, "josef"=>5, "k"=>5, "morning"=>5, "must"=>5, "one"=>5, "slandered"=>5, "someone"=>5, "truly"=>5, "was"=>5, "without"=>5, "wrong"=>5},
    paragraph: ["Someone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested.\nSomeone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested!\nSomeone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested?", "Someone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested?!\nSomeone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested...\n"],
    paragraph_count: 2,
    percentage_of_unique_words: 15.52,
    percentage_of_useful_words: 4.31,
    percentage_of_words: {"anything"=>0.0, "arrested"=>0.0, "done"=>0.0, "for"=>0.0, "have"=>0.0, "having"=>0.0, "he"=>0.0, "josef"=>0.0, "k"=>0.0, "morning"=>0.0, "must"=>0.0, "one"=>0.0, "slandered"=>0.0, "someone"=>0.0, "truly"=>0.0, "was"=>0.0, "without"=>0.0, "wrong"=>0.0},
    sentence_count: 5,
    syllables_per_line: [26, 26, 26, 0, 26, 26],
    unique_words: ["someone", "must", "have", "slandered", "josef", "k", "for", "one", "morning", "without", "having", "done", "anything", "truly", "wrong", "he", "was", "arrested"],
    useful_words: ["slandered", "josef", "morning", "wrong", "arrested"],
    word_count: 116,
  }

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
      percentage_of_useful_words: 37.5,
      unique_words:  ["i", "love", "ruby", "and", "loves", "me"],
      percentage_of_unique_words: 75.0,
      occurences_of_words: {"ruby"=>2, "i"=>1, "love"=>1, "and"=>1, "loves"=>1, "me"=>1},
      percentage_of_words: {"ruby"=>30.0, "i"=>10.0, "love"=>10.0, "and"=>10.0, "loves"=>10.0, "me"=>10.0}
  }

  it 'text file analyze' do
    expect(tx.analyze_file('data/test_source_text.txt')).to be_a Hash
    expect(tx.analyze_file('data/test_source_text.txt')).to eq(result_file)

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
