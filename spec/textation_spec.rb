require 'textation'

describe Text do
  tx = Text.new
  result_file = {
    average_sentences_per_paragraph: 2.5,
    average_words_per_sentence: 18.0,
    character_count: 574,
    character_count_excluding_spaces: 483,
    letter_count: 455,
    line_count: 6,
    lines_per_paragraph: "3, 2",
    occurences_of_words: "someone: 5, must: 5, have: 5, slandered: 5, josef: 5, k: 5, for: 5, one: 5, morning: 5, without: 5, having: 5, done: 5, anything: 5, truly: 5, wrong: 5, he: 5, was: 5, arrested: 5",
    paragraph_count: 2,
    percentage_of_unique_words: 20.0,
    percentage_of_useful_words: 5.56,
    percentage_of_words: "someone: 5.56, must: 5.56, have: 5.56, slandered: 5.56, josef: 5.56, k: 5.56, for: 5.56, one: 5.56, morning: 5.56, without: 5.56, having: 5.56, done: 5.56, anything: 5.56, truly: 5.56, wrong: 5.56, he: 5.56, was: 5.56, arrested: 5.56",
    sentence_count: 5,
    syllables_per_line: "27, 27, 27, 0, 27, 27",
    unique_words: "someone, must, have, slandered, josef, k, for, one, morning, without, having, done, anything, truly, wrong, he, was, arrested",
    useful_words: "slandered, josef, morning, wrong, arrested",
    word_count: 90,
  }

  result = {
      character_count: 31,
      character_count_excluding_spaces: 25,
      letter_count: 23,
      line_count: 1,
      word_count: 7,
      sentence_count: 2,
      paragraph_count: 1,
      lines_per_paragraph: "1",
      syllables_per_line: "9",
      average_words_per_sentence: 3.5,
      average_sentences_per_paragraph: 2.0,
      useful_words:  "love, ruby, loves",
      percentage_of_useful_words: 42.86,
      unique_words:  "i, love, ruby, and, loves, me",
      percentage_of_unique_words: 85.71,
      occurences_of_words: "ruby: 2, i: 1, love: 1, and: 1, loves: 1, me: 1",
      percentage_of_words: "ruby: 28.57, i: 14.29, love: 14.29, and: 14.29, loves: 14.29, me: 14.29"
  }

  it 'text analyze' do
    expect(tx.analyze('data/test_source_text.txt')).to be_a Hash
    expect(tx.analyze('data/test_source_text.txt')).to eq(result_file)
    expect(tx.analyze('I love Ruby!')).to be_a Hash
    expect(tx.analyze('I love Ruby! And Ruby loves me!')).to eq(result)
  end

  it 'top words no stop words' do
    expect(tx.top_words_no_stop_words('data/test_source_text.txt')).to eq('slandered, josef, morning')
  end

  it 'top words all' do
    expect(tx.top_words_all('data/test_source_text.txt')).to eq('someone, must, have')
  end

  it 'occurence of word' do
    expect(tx.occurence_of_word('data/test_source_text.txt', 'morning')).to eq(5)
    expect(tx.occurence_of_word('I love Ruby! And Ruby loves me!', 'ruby')).to eq(2)
  end

  it 'percentage of word' do
    expect(tx.percentage_of_word('data/test_source_text.txt', 'morning')).to eq(5.56)
  end
end

# terminal:
# bundle exec rspec spec
