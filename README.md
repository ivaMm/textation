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
#     word_count: 8,
#     sentence_count: 2,
#     paragraph: ['I love Ruby! And Ruby loves me!'],
#     paragraph_count: 1,
#     lines_per_paragraph: [1],
#     syllables_per_line: [9],
#     average_words_per_sentence: 4.0,
#     average_sentences_per_paragraph: 2.0,
#     useful_words:  ["love", "ruby", "loves"],
#     percentage_of_useful_words: 37.5,
#     unique_words:  ["i", "love", "ruby", "and", "loves", "me"],
#     percentage_of_unique_words: 75.0,
#     occurences_of_words: {"ruby"=>2, "i"=>1, "love"=>1, "and"=>1, "loves"=>1, "me"=>1},
#     percentage_of_words: {"ruby"=>30.0, "i"=>10.0, "love"=>10.0, "and"=>10.0, "loves"=>10.0, "me"=>10.0}
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
#=> 30.0

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake 'spec'` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/textation.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
