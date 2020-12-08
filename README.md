# Textation

Simple text analysis with Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'textation'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install textation

## Usage

# Create an instance for usage
analyzer = Text.new

# Analyze text file
analyzer.analyze_file(text_file)
#=> will call method analyze(text)👇

# Analyze string
analyzer.analyze('I love Ruby! And Ruby loves me!')
#=> { character_count: 31,
#     character_count_excluding_spaces: 25,
#     letter_count: 23,
#     line_count: 1,
#     word_count: 7,
#     sentence_count: 2,
#     paragraph_count: 1,
#     lines_per_paragraph: "1",
#     syllables_per_line: "9",
#     average_words_per_sentence: 3.5,
#     average_sentences_per_paragraph: 2.0,
#     useful_words:  "love, ruby, loves",
#     percentage_of_useful_words: 42.86,
#     unique_words:  "i, love, ruby, and, loves, me",
#     percentage_of_unique_words: 85.71,
#     occurences_of_words: "ruby: 2, i: 1, love: 1, and: 1, loves: 1, me: 1",
#     percentage_of_words: "ruby: 28.57, i: 14.29, love: 14.29, and: 14.29, loves: 14.29, me: 14.29"
#   }

# get first 3 top words including stop words
analyzer.top_words_all('I love Ruby')
# you can pass number
analyzer.top_words_all('I love Ruby! And Ruby loves me!, 1)
#=> 'ruby'

# get first 3 top words excluding stop words
analyzer.top_words_no_stop_words('I love Ruby')
# you can pass number
analyzer.top_words_no_stop_words('I love Ruby! And Ruby loves me!, 1)
#=> 'ruby'

# get occurence of word
analyzer.occurence_of_word('I love Ruby! And Ruby loves me!, 'ruby')
#=> 2

# get percentage of word
analyzer.percentage_of_word('I love Ruby! And Ruby loves me!, 'ruby')
#=> 28.57

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
